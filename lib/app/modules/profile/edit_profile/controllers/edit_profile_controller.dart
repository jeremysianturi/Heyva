import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/profile/model/delete_account_model.dart';
import 'package:heyva/app/modules/profile/model/update_profile_model.dart';
import 'package:heyva/app/modules/profile/provider/profile_provider.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_bottomSheet_message.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';
import 'package:heyva/constant/variabels.dart';
import 'package:heyva/services/dio_services.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  TextEditingController fullnameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  var errorMessage = "".obs;

  File? image;
  var filePath = "".obs;

  final _picker = ImagePicker();

  Future<void> openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      filePath.value = pickedImage.path;
    }
  }

  var isLoading = false.obs;
  late DioClient _client;
  late ProfileProvider _profileProvider;

  @override
  void onInit() {
    _client = DioClient();
    _profileProvider = ProfileProvider(_client.init());

    fullnameC.text = profileName;
    phoneC.text = phone;
    emailC.text = email;

    super.onInit();
  }

  var updateProfileResponse =
      UpdateProfileModel(success: "", data: null, message: "", error: "").obs;

  updateProfile() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      var isEmpty = filePath.value == "";

      updateProfileResponse.value = (await _profileProvider.updateProfile(
          isEmptyFile: isEmpty,
          file: File(filePath.value),
          fullName: fullnameC.text.toString()))!;

      if (updateProfileResponse.value.success == "Success") {
        bottomSheetMessage(
            color: "heyva", desc: "Your profile has been updated.");

        Future.delayed(2.seconds, () {
          isLoading.value = false;
          if (Get.isBottomSheetOpen == true) {
            Get.back();
          }
          Get.back(result: "reload");
        });
      } else {
        // errorMessage.value =
        //     updateProfileResponse.value.message ?? "Error Message";
        bottomSheetMessage(
            color: "heyva",
            desc: "Oops! There is an error saving your profile.");
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }

  var box = GetStorage();

  String get profileName {
    return box.read(Keys.profileName) ?? "";
  }

  String get email {
    return box.read(Keys.profileEmail) ?? "";
  }

  String get phone {
    return box.read(Keys.profilePhone) ?? "";
  }

  String get profileAvatar {
    return box.read(Keys.profileImgUrl);
  }

  changePicture() {
    Get.bottomSheet(
      Container(
          padding: const EdgeInsets.all(20),
          height: 218,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    Strings.changeProfilePicture,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: ColorApp.blue_container),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: CircleAvatar(
                      backgroundColor: ColorApp.btn_orange,
                      child: Transform.rotate(
                        angle: 180 * math.pi / 103.5,
                        child: const Icon(
                          Icons.add,
                          color: ColorApp.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        backgroundColor: ColorApp.btn_orange),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/ic_gallery.svg"),
                        const SizedBox(
                          width: 32,
                        ),
                        const Expanded(
                          child: Text(
                            Strings.chooseFromGallery,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: ColorApp.arrow_white),
                          ),
                        ),
                        Image.asset("assets/icons/ic_arrow_right.png"),
                      ],
                    ),
                    onPressed: () {
                      Get.back();
                      openImagePicker();
                    },
                  ),
                ),
              )
            ],
          )),
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      ),
      backgroundColor: ColorApp.white,
      enableDrag: false,
    );
  }

  var deleteResponse =
      DeleteAccountModel(success: "", data: null, message: "", error: "").obs;

  deleteAccount() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      deleteResponse.value = (await _profileProvider.deleteAccount())!;
      if (deleteResponse.value.success == "Success") {
        bottomSheetMessage(
            color: "heyva", desc: "Your account has been successfully deleted");
        Future.delayed(2.seconds, () {
          var box = GetStorage();
          box.remove(Keys.loginAccessToken);
          box.remove(Keys.loginRefreshToken);
          box.remove(Keys.loginID);
          box.remove(Keys.profileName);
          box.remove(Keys.profileImgUrl);
          box.erase();
          authToken = "";
          refreshToken = "";
          Future.delayed(800.seconds);
          Get.offNamed(Routes.SIGNUP);
        });
      } else {
        // bottomSheetMessage(
        //     color: "heyva",
        //     desc: "Oops! There is an error saving your profile.");
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }
}
