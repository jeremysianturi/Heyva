import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/mood_tracker/mood_tracker_form/widget/feeling_item.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/function.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/sleep_check_in_controller.dart';
import '../model/tracker_type_sleep_model.dart';

class SleepCheckInView extends GetView<SleepCheckInController> {
  const SleepCheckInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Stack(
            children: [
              (controller.pagePosition.value == 0)
                  ? MoodCheckForm2(
                      controller: controller,
                      data: controller.sleepList[controller.pagePosition.value],
                      index: controller.pagePosition.value,
                    )
                  : MoodCheckForm1(
                      controller: controller,
                      data: controller.sleepList[controller.pagePosition.value],
                      index: controller.pagePosition.value,
                    ),
              Container(
                  height: 2,
                  margin: const EdgeInsets.only(top: 60, left: 20, right: 20),
                  child: GridView.count(
                    crossAxisCount: controller.sleepList.length,
                    childAspectRatio: 165 / 2,
                    crossAxisSpacing: 5,
                    padding: EdgeInsets.zero,
                    children:
                        List.generate(controller.sleepList.length, (index) {
                      return Container(
                        height: 20,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: controller.pagePosition.value >= index
                                ? ColorApp.btn_orange
                                : ColorApp.black.withOpacity(0.3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      );
                    }),
                  )),
            ],
          ),
        ));
  }
}

class MoodCheckForm1 extends StatelessWidget {
  const MoodCheckForm1({
    super.key,
    required this.controller,
    required this.data,
    required this.index,
  });

  final SleepCheckInController controller;
  final TrackerDetail data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          Keyboard.dismiss();
        },
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_heyva.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 80),
                      child: Header(
                          showCenterTitle: true,
                          centerTitle: Strings.sleepCheckIn,
                          rightText: "",
                          // rightText: Strings.skip,
                          isCostomBackFucntion: true,
                          onBack: () {
                            if (controller.pagePosition.value != 0) {
                              controller.pagePosition.value =
                                  controller.pagePosition.value - 1;
                            } else {
                              Get.back();
                            }
                          },
                          showIcon: false)),
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      data.title ?? "",
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          color: ColorApp.blue_container),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      data.body ?? "",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: ColorApp.black.withOpacity(0.3)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Obx(() {
                    var item =
                        controller.sleepList[controller.pagePosition.value];
                    var itemLength = item.jsonContent?.length ?? 0;
                    return Column(
                      children: [
                        item.jsonContent.toString() != "null"
                            ? Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: GridView.builder(
                                  physics: const ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: itemLength - 1,
                                  itemBuilder: (context, index) => FeelingItem(
                                    ontap: () {
                                      controller.onSelectFeeling(index);
                                    },
                                    name: item.jsonContent?[index].name ?? "",
                                    isSelected:
                                        item.jsonContent?[index].isSelected ??
                                            false,
                                    emoji: item.jsonContent?[index].emoji ?? "",
                                  ),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 162 / 46,
                                          crossAxisSpacing: 11,
                                          mainAxisSpacing: 10),
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            maxLines:
                                item.jsonContent.toString() != "null" ? 1 : 9,
                            minLines:
                                item.jsonContent.toString() != "null" ? 1 : 9,
                            controller: controller.otherC,
                            decoration: InputDecoration(
                              hintText: Strings.other,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 20),
                              filled: true,
                              fillColor: ColorApp.white,
                              hintStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: ColorApp.grey_font),
                              labelStyle: const TextStyle(
                                  fontSize: 16,
                                  color: ColorApp.blue_container,
                                  fontWeight: FontWeight.w400),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14.0),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 0.8,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14.0),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 0.8,
                                ),
                              ),
                            ),
                            onChanged: (val) {
                              controller.onOther(val);
                            },
                          ),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  if (controller.isShowButton)
                    OrangeButtonWTrailingIcon(
                      determineAction: "ontap",
                      text: Strings.continue_text,
                      ontap: () {
                        if (controller.sleepList.length !=
                            controller.pagePosition.value + 1) {
                          controller.otherC.text = "";
                          FocusScope.of(context).requestFocus(FocusNode());
                          controller.pagePosition.value =
                              controller.pagePosition.value + 1;
                        } else {
                          controller.sleepList[index].notes =
                              controller.otherC.text;
                          controller.sleepList.refresh();
                          // controller.generateRawJson();
                          Get.toNamed(Routes.RECOMENDATION);
                        }
                      },
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MoodCheckForm2 extends StatelessWidget {
  const MoodCheckForm2({
    super.key,
    required this.controller,
    required this.data,
    required this.index,
  });

  final SleepCheckInController controller;
  final TrackerDetail data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          Keyboard.dismiss();
        },
        child: Container(
          height: Get.height - 50,
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_heyva.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 80),
                      child: Header(
                          showCenterTitle: true,
                          centerTitle: Strings.sleepCheckIn,
                          rightText: Strings.skip,
                          isCostomBackFucntion: true,
                          onBack: () {
                            if (controller.pagePosition.value != 0) {
                              controller.pagePosition.value =
                                  controller.pagePosition.value - 1;
                            } else {
                              Get.back();
                            }
                          },
                          showIcon: false)),
                  const SizedBox(
                    height: 34,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      data.title ?? "",
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          color: ColorApp.blue_container),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      data.body ?? "",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: ColorApp.black.withOpacity(0.3)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Column(
                    children: List.generate(data.jsonContent?.length ?? 0, (i) {
                      var item = data.jsonContent?[i];
                      return GestureDetector(
                        onTap: () {
                          controller.sleepList[index].jsonContent
                              ?.firstWhereOrNull((e) => e.isSelected == true)
                              ?.isSelected = false;
                          controller.sleepList[index].jsonContent?[i]
                              .isSelected = true;
                          controller.sleepList.refresh();
                        },
                        child: Container(
                          width: Get.width,
                          margin: const EdgeInsets.only(
                              bottom: 24, left: 20, right: 20),
                          padding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 20),
                          decoration: BoxDecoration(
                              color: item?.isSelected == true
                                  ? ColorApp.btn_orange
                                  : Colors.transparent,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(14)),
                              border: Border.all(
                                  color: ColorApp.btn_orange, width: 1)),
                          child: Text(
                            item?.name ?? "",
                            style: TextStyle(
                                fontSize: 14,
                                color: item?.isSelected == true
                                    ? ColorApp.white_font
                                    : ColorApp.blue_container,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (controller.isShowButton)
                    OrangeButtonWTrailingIcon(
                      determineAction: "ontap",
                      text: Strings.continue_text,
                      ontap: () {
                        if (controller.sleepList.length !=
                            controller.pagePosition.value + 1) {
                          controller.otherC.text = "";
                          FocusScope.of(context).requestFocus(FocusNode());
                          controller.pagePosition.value =
                              controller.pagePosition.value + 1;
                        } else {
                          Get.toNamed(Routes.SLEEP_CHECK_IN);
                        }
                      },
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
