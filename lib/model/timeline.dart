import 'package:get/get.dart';

class TimelineModel {
  final String quote;
  final String title;
  final String subtitle;
  final String time;
  final String image;
  var isSelected = false.obs;
  final Function ontap;

  TimelineModel(
      {required this.ontap,
      required this.quote,
      required this.title,
      required this.subtitle,
      required this.time,
      required this.image,
      required this.isSelected});
}
