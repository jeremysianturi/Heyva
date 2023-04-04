import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/mood_tracker/mood_tracker_form/widget/mood_check_form.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/colors.dart';

import '../controllers/mood_tracker_form_controller.dart';

class MoodTrackerFormView extends GetView<MoodTrackerFormController> {
  const MoodTrackerFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Stack(
            children: [
              if (controller.pagePosition.value == 0)
                MoodCheckForm1(
                  controller: controller,
                  ontap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    controller.pagePosition.value = 1;
                  },
                  title: 'How are you \nfeeling today ?',
                  subtitle: '',
                ),
              if (controller.pagePosition.value == 1)
                MoodCheckForm1(
                  controller: controller,
                  ontap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    controller.pagePosition.value = 2;
                  },
                  title: 'What caused this ?',
                  subtitle: 'choose as many as you want',
                ),
              if (controller.pagePosition.value == 2)
                MoodCheckForm1(
                  controller: controller,
                  ontap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    Get.toNamed(Routes.SLEEP_CHECK_IN);
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
