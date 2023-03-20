import 'package:get/get.dart';
import '../controllers/detail_doctor_controller.dart';

class DetailDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailDoctorController>(
          () => DetailDoctorController(),
    );
  }
}