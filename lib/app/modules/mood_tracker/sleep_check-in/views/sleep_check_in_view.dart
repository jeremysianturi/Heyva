import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/mood_tracker/sleep_check-in/widget/sleep_check_form.dart';
import 'package:heyva/constant/colors.dart';

import '../controllers/sleep_check_in_controller.dart';

class SleepCheckInView extends GetView<SleepCheckInController> {
  const SleepCheckInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Scaffold(
          body: Stack(
            children: [
              if (controller.pagePosition.value == 0)
                SleepCheckForm1(
                  controller: controller,
                  ontap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    controller.pagePosition.value = 1;
                  },
                  title: 'How are you \nfeeling today ?',
                  subtitle: '',
                ),
              if (controller.pagePosition.value == 1)
                SleepCheckForm1(
                  controller: controller,
                  ontap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    controller.pagePosition.value = 2;
                  },
                  title: 'What caused this ?',
                  subtitle: 'choose as many as you want',
                ),
              if (controller.pagePosition.value == 2)
                SleepCheckForm1(
                  controller: controller,
                  ontap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                  title: 'Want to tell us \nmore about it?',
                  subtitle: '',
                ),
              Container(
                margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 2,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: controller.pagePosition.value >= 0
                                ? ColorApp.btn_orange
                                : ColorApp.black.withOpacity(0.3),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      width: 2.5,
                    ),
                    Expanded(
                      child: Container(
                        height: 2,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: controller.pagePosition.value >= 1
                                ? ColorApp.btn_orange
                                : ColorApp.black.withOpacity(0.3),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      width: 2.5,
                    ),
                    Expanded(
                      child: Container(
                        height: 2,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: controller.pagePosition.value == 2
                                ? ColorApp.btn_orange
                                : ColorApp.black.withOpacity(0.3),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
    }
}
