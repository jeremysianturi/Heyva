import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/breathing/breathingtwo/views/breathing_two_view.dart';
import 'package:heyva/app/modules/breathing/model/pelvic_model.dart';
import 'package:heyva/app/modules/breathing/provider/pelvic_provider.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/services/dio_services.dart';

class BreathingOneController extends GetxController {
  var isLoading = false.obs;
  late DioClient _client;
  late PelvicProvider _provider;
  var errorMessage = ''.obs;
  var isEmailError = false.obs;
  var isPasserror = false.obs;

  @override
  void onInit() {
    _client = DioClient();
    _provider = PelvicProvider(_client.init());
    super.onInit();
  }

  var pelvicResponse =
      PelvicModel(success: "", data: null, message: "", error: "").obs;

  getPelvic() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      pelvicResponse.value = (await _provider.getPelvic())!;
      isLoading.value = false;

      if (pelvicResponse.value.success == "Success") {
        var data = pelvicResponse.value.data;
        var box = GetStorage();
        box.write(Keys.pelvic1Storage, data?.programDetail?[0].textContent);
        box.write(Keys.pelvic2Storage, data?.programDetail?[1].textContent);
        box.write(Keys.pelvic3Storage, data?.programDetail?[2].textContent);
        box.write(Keys.pelvic4Storage, data?.programDetail?[3].textContent);
        box.write(Keys.pelvic5Storage, data?.programDetail?[4].textContent);
        box.write(Keys.pelvic6Storage, data?.programDetail?[5].textContent);
        Future.delayed(400.milliseconds);
        Get.to(const BreathingTwoView());
      } else {
        errorMessage.value = pelvicResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
