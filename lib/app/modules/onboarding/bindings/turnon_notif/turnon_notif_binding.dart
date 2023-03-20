import 'package:get/get.dart';
import '../../controllers/turnon_notif/turnon_notif_controller.dart';

class TurnOnNotifBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TurnOnNotifController>(
          () => TurnOnNotifController(),
    );
  }
}