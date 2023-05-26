
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/detaildoctor/widget/month_time_select_Widget.dart';
import 'package:heyva/app/widgets/reusable_bottomSheet_message.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../constant/colors.dart';
import '../../../../constant/strings.dart';
import '../controllers/detail_doctor_controller.dart';

class SelectScheduleWidget extends StatelessWidget {
  const SelectScheduleWidget({
    super.key,
    required this.controller,
  });

  final DetailDoctorController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          Strings.select_schedule,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: ColorApp.blue_container),
        ),
        const SizedBox(
          height: 16,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SelectMothTimeWidget(
                ontap: () {
                  showMonthPicker(
                    context: context,
                    firstDate: controller.kToday,
                    lastDate: controller.kLastDay,
                    initialDate: controller.selectedMonthYear.value,
                  ).then((date) {
                    controller.selectedMonthYear.value =
                        date ?? controller.selectedMonthYear.value;
                    // controller.focusedDay.value = date;
                    debugPrint(
                        "month picker  ${(date?.month == DateTime.now().month)}");

                    if (date?.month == DateTime.now().month) {
                      controller.selectedDay.value = DateTime.now();
                      controller.focusedDay.value = DateTime.now();
                    } else {
                      controller.selectedDay.value = date;
                      controller.focusedDay.value = date;
                    }
                  });
                },
                text: DateFormat.yMMMM()
                    .format(controller.selectedMonthYear.value!)
                    .replaceAll(" ", ", "),
              ),
              SelectMothTimeWidget(
                ontap: () async {
                  var selectedTime = await showTimePicker(
                    context: context,
                    initialTime: controller.selectedTime.value!,
                    builder: (context, childWidget) {
                      return MediaQuery(
                        data:
                            MediaQuery.of(context).copyWith(textScaleFactor: 1),
                        child: childWidget!,
                      );
                    },
                  );
                  var selectedToInt = int.parse(
                      "${controller.toDoubleDigit(selectedTime?.hour.toString() ?? "")}${controller.toDoubleDigit(selectedTime?.minute.toString() ?? "")}");
                  var dateNowToInt = int.parse(
                      "${controller.toDoubleDigit(controller.selectedTime.value?.hour.toString() ?? "")}${controller.toDoubleDigit(controller.selectedTime.value?.minute.toString() ?? "")}");
                    var selectedDay =
                      "${controller.selectedDay.value?.day}${controller.selectedDay.value?.month}${controller.selectedDay.value?.year}";
                  var dateNow =
                      "${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}";
                  debugPrint(selectedDay);
                  debugPrint(dateNow);
                  if (selectedTime != null) {
                    if (selectedDay == dateNow &&
                        selectedToInt > dateNowToInt) {
                      controller.selectedTime.value = selectedTime;
                    } else if (selectedDay != dateNow) {
                      controller.selectedTime.value = selectedTime;
                    } else {
                      bottomSheetMessage(
                          color: "heyva", desc: "Time that has passed could not be selected.");
                    }
                  }
                },
                text:
                    "${controller.selectedHour} : ${controller.selectedMinutes}",
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Obx(() => TableCalendar(
              firstDay: controller.kFirstDay,
              lastDay: controller.kLastDay,
              headerVisible: false,
              currentDay: null,
              focusedDay: controller.focusedDay.value ?? controller.kToday,
              calendarFormat:
                  controller.calendarFormat.value ?? CalendarFormat.month,
              selectedDayPredicate: (day) {
                return isSameDay(controller.selectedDay.value, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(controller.selectedDay.value, selectedDay)) {
                  controller.selectedDay.value = selectedDay;
                  controller.focusedDay.value = focusedDay;
                }

                if (isSameDay(controller.selectedDay.value, selectedDay)) {
                  controller.selectedTime.value = TimeOfDay.now();
                }
              },
              onFormatChanged: (format) {
                debugPrint("format change $format");
                if (controller.calendarFormat.value != format) {
                  controller.calendarFormat.value = format;
                }
              },
              onPageChanged: (focusedDay) {
                // No need to call `setState()` here
                controller.selectedMonthYear.value = focusedDay;
              },
            )),
      ],
    );
  }
}
