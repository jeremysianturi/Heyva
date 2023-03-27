import 'package:easy_stepper/easy_stepper.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../model/tag.dart';

class DetailDoctorController extends GetxController {
  List<Tag> list = [
    Tag(tag: "Phycologist"),
    Tag(tag: "Articles"),
  ];

  Rxn<CalendarFormat> calendarFormat = Rxn<CalendarFormat>();
  Rxn<DateTime> focusedDay = Rxn<DateTime>();
  Rxn<DateTime> selectedDay = Rxn<DateTime>();

  var kToday = DateTime.now();
  var kFirstDay = DateTime(
      DateTime.now().year, DateTime.now().month - 1, DateTime.now().day);
  var kLastDay = DateTime(
      DateTime.now().year, DateTime.now().month + 200, DateTime.now().day);

  Rxn<DateTime> selectedMonthYear = Rxn<DateTime>();
  Rxn<TimeOfDay> selectedTime = Rxn<TimeOfDay>();


  @override
  void onInit() {
    focusedDay.value = DateTime.now();
    selectedTime.value  = TimeOfDay.now();
    selectedMonthYear.value = DateTime.now();
    calendarFormat.value = CalendarFormat.month;
    super.onInit();
  }
}
