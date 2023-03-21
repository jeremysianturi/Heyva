import 'package:get/get.dart';

class Interest {
  final String subject;
  final String id;
  var isSelected = false.obs;
  Interest({required this.id, required this.subject, required this.isSelected});
}

