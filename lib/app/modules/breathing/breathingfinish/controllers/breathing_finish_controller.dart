import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/constant/keys.dart';

class BreathingFinishController extends GetxController {
  var box = GetStorage();

  String get pelvic6 {
    return box.read(Keys.pelvic1Storage);
  }

}