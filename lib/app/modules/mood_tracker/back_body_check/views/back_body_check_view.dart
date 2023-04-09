import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/mood_tracker/physical_check/model/tracker_type_physical_model.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/back_body_check_controller.dart';

class BackBodyCheckView extends GetView<BackBodyCheckController> {
  const BackBodyCheckView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: Stack(
        children: [
          MoodCheckForm1(
            controller: controller,
            data: controller.frontList[controller.pagePosition.value],
            index: controller.pagePosition.value,
          ),
          Container(
              height: 2,
              margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: GridView.count(
                crossAxisCount: controller.frontList.length,
                childAspectRatio: 165 / 2,
                crossAxisSpacing: 5,
                padding: EdgeInsets.zero,
                children:
                List.generate(controller.frontList.length, (index) {
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

  final BackBodyCheckController controller;
  final TrackerDetail data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    margin: const EdgeInsets.only(top: 14),
                    child: Header(
                        showCenterTitle: true,
                        centerTitle: Strings.frontBodyCheckin,
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
                  height: 100,
                ),
                Column(
                  children: List.generate(data.jsonContent?.length ?? 0, (i) {
                    var item = data.jsonContent?[i];
                    return GestureDetector(
                      onTap: () {
                        controller.frontList[index].jsonContent
                            ?.firstWhereOrNull((e) => e.isSelected == true)
                            ?.isSelected = false;
                        controller.frontList[index].jsonContent?[i].isSelected =
                        true;
                        if (controller.frontList.length !=
                            controller.pagePosition.value + 1) {
                          controller.pagePosition.value =
                              controller.pagePosition.value + 1;
                        } else {
                          Get.back(result: {Keys.backResult: "reload"});
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: Get.width,
                        margin: const EdgeInsets.only(
                            bottom: 10, left: 20, right: 20),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                            border: Border.all(
                                color: ColorApp.btn_orange, width: 1)),
                        child: Text(
                          item?.name ?? "",
                          style: const TextStyle(
                              fontSize: 14,
                              color: ColorApp.black_font_underline,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
