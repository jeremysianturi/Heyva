import 'package:get/get.dart';

class ProgramModel {
  ProgramModel({
    required this.name,
    required this.isSelected ,
  });

  late final String name;
  late final RxBool isSelected;
}
