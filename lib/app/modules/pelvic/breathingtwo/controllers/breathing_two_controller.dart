import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/constant/keys.dart';

class BreathingTwoController extends GetxController {
  var box = GetStorage();

  String get pelvic1 {
    return box.read(Keys.pelvic1Storage);
  }
  String get pelvic2 {
    return box.read(Keys.pelvic2Storage);
  }
  String get pelvic3 {
    return box.read(Keys.pelvic3Storage);
  }
}
