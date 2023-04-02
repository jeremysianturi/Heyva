import 'package:get/get.dart';

class ServiceModel {
  late final String title;
  late final String imgUrl;
  late final RxBool isSelected;

  ServiceModel({
    required this.title,
    required this.imgUrl,
    required this.isSelected,
  });
}
