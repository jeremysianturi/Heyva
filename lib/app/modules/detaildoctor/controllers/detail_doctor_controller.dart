import 'package:easy_stepper/easy_stepper.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/detaildoctor/model/detail_doctor_model.dart'
    as doctor;
import 'package:heyva/app/modules/detaildoctor/model/service_model.dart';
import 'package:heyva/app/modules/detaildoctor/provider/doctor_provider.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';
import 'package:heyva/services/dio_services.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../model/tag.dart';

class DetailDoctorController extends GetxController {
  var list = <Tag>[].obs;

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

  var isLoading = false.obs;
  late DioClient _client;
  late DoctorProvider _provider;
  var errorMessage = ''.obs;
  var isEmailError = false.obs;
  var isPasserror = false.obs;
  dynamic argumentData = Get.arguments;

  String get id {
    return argumentData[Keys.doctorIdArguments].toString();
  }

  List<Tag> get listTag {
    var data = detailDoctorResponse.value.data?[0].tags;
    var list = <Tag>[];
    data?.forEach((e) {
      list.add(Tag(tag: e.tag?.name ?? ""));
    });
    return list;
  }

  @override
  void onInit() {
    focusedDay.value = DateTime.now();
    selectedTime.value = TimeOfDay.now();
    selectedMonthYear.value = DateTime.now();
    calendarFormat.value = CalendarFormat.week;

    _client = DioClient();
    _provider = DoctorProvider(_client.init());
    getDetailDoctor();

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

  var detailDoctorResponse =
      doctor.DetailDoctorModel(success: "", data: null, message: "", error: "")
          .obs;

  getDetailDoctor() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      detailDoctorResponse.value = (await _provider.getDetailDoctor(id: id))!;
      isLoading.value = false;

      if (detailDoctorResponse.value.success == "Success") {
      } else {
        errorMessage.value =
            detailDoctorResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }
}
