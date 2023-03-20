import 'package:get/get.dart';

class Interest {
  final String subject;
  var isSelected = false.obs;
  Interest({required this.subject, required this.isSelected});
}

