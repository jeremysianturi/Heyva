import 'package:easy_stepper/easy_stepper.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/detaildoctor/model/service_model.dart';
import 'package:heyva/constant/strings.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../model/tag.dart';

class DetailDoctorController extends GetxController {
  List<Tag> list = [
    Tag(tag: "Phycologist"),
    Tag(tag: "Articles"),
  ];

  var listService = <ServiceModel>[
    ServiceModel(
        title: "Tele-Consultation",
        imgUrl: "assets/icons/ic_whatsapp_doctor.svg",
        isSelected: RxBool(false)),
    ServiceModel(
        title: "Zoom Meet",
        imgUrl: "assets/icons/ic_zoom_doctor.svg",
        isSelected: RxBool(false))
  ].obs;

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
    selectedTime.value = TimeOfDay.now();
    selectedMonthYear.value = DateTime.now();
    calendarFormat.value = CalendarFormat.week;
    super.onInit();
  }

  String get buttonTitle {
    if (listService[0].isSelected.isTrue) {
      return Strings.gotoWhatsapp;
    }

    if (listService[1].isSelected.isTrue) {
      return Strings.lets_go;
    }
    return "";
  }
}
