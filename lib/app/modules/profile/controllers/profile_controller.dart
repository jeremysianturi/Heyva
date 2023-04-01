import 'package:get/get.dart';
import 'package:heyva/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  var profileSettings = [
    "Change Password",
    "Invite Friends",
    "Privacy Policy",
    "FAQ",
    "Rate our App",
    "Notification Settings",
  ];

  onTapSettings(int index) {
    if (index == 0) {
      Get.toNamed(Routes.CHANGE_PASSWORD);
    }
    if (index == 1) {}
    if (index == 2) {
      Get.toNamed(Routes.PRIVACY_POLICY);
    }
    if (index == 3) {
      Get.toNamed(Routes.FAQ);
    }
    if (index == 4) {}
    if (index == 5) {
      Get.toNamed(Routes.NOTIFICATION_SETTINGS);
    }
  }
}
