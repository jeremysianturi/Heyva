import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/detaildoctor/widget/month_time_select_Widget.dart';
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
                    controller.focusedDay.value = date;
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
                  );
                  controller.selectedTime.value = selectedTime;
                },
                text:
                    "${controller.selectedTime.value?.hour} : ${controller.selectedTime.value?.minute}",
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
              },
              onFormatChanged: (format) {
                debugPrint("format change $format");
                if (controller.calendarFormat.value != format) {
                  controller.calendarFormat.value = format;
                }
              },
              onPageChanged: (focusedDay) {
                // No need to call `setState()` here
                debugPrint("focused day $focusedDay");
                controller.selectedMonthYear.value = focusedDay;
                focusedDay = focusedDay;
              },
            )),
      ],
    );
  }
}
