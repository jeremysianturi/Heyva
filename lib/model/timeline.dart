import 'package:get/get.dart';

class TimelineModel {
  final String quote;
  final String title;
  final String subtitle;
  final String time;
  final String image;
  var isSelected = false.obs;
  TimelineModel(
      {required this.quote,
      required this.title,
      required this.subtitle,
      required this.time,
      required this.image,
      required this.isSelected});
}
