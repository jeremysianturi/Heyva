import 'package:get/get.dart';

class PrivacyPolicyModel {
  final String title;
  final String subTitle;
  var isSelected = false.obs;

  PrivacyPolicyModel(
      {required this.title, required this.subTitle, required this.isSelected});
}
