import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/mood_tracker/mood_tracker_form/widget/feeling_item.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/mood_tracker_form_controller.dart';
import '../model/tracker_type_mood_model.dart';

class MoodTrackerFormView extends GetView<MoodTrackerFormController> {
  const MoodTrackerFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Stack(
            children: [
              MoodCheckForm1(
                controller: controller,
                data: controller.moodList[controller.pagePosition.value],
                index: controller.pagePosition.value,
              ),
              Container(
                  height: 2,
                  margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: GridView.count(
                    crossAxisCount: controller.moodList.length,
                    childAspectRatio: 165 / 2,
                    crossAxisSpacing: 5,
                    padding: EdgeInsets.zero,
                    children:
                        List.generate(controller.moodList.length, (index) {
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

  final MoodTrackerFormController controller;
  final TrackerDetail data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
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
                      margin: const EdgeInsets.only(top: 14),
                      child: Header(
                          showCenterTitle: true,
                          centerTitle: Strings.moodCheckIn,
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
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      data.title ?? "",
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          color: ColorApp.black_font_underline),
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
                    height: 50,
                  ),
                  Obx(() {
                    var item =
                        controller.moodList[controller.pagePosition.value];
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
                            maxLines: null,
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
                                  color: ColorApp.black_font_underline,
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
                        if (controller.moodList.length !=
                            controller.pagePosition.value + 1) {
                          controller.otherC.text = "";
                          FocusScope.of(context).requestFocus(FocusNode());
                          controller.pagePosition.value =
                              controller.pagePosition.value + 1;
                        } else {
                          controller.moodList[index].notes =
                              controller.otherC.text;
                          controller.moodList.refresh();
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
