import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/function.dart';
import 'package:heyva/constant/strings.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../controllers/physical_check_controller.dart';

class PhysicalCheckView extends GetView<PhysicalCheckController> {
  const PhysicalCheckView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => LoadingOverlay(
        isLoading: controller.isLoading.value,
        color: Colors.grey,
        progressIndicator: const CircularProgressIndicator(
          color: ColorApp.btn_orange,
        ),
        opacity: 0.3,
        child: Scaffold(
          body: Stack(
            children: [
              MoodCheckForm1(
                controller: controller,
              ),
            ],
          ),
        )));
  }
}

class MoodCheckForm1 extends StatelessWidget {
  const MoodCheckForm1({
    super.key,
    required this.controller,
  });

  final PhysicalCheckController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  margin: const EdgeInsets.only(top: 60),
                  child: const Header(
                      showCenterTitle: true,
                      centerTitle: Strings.physicalCheckIn,
                      rightText: "",
                      // rightText: Strings.skip,
                      titleColor: ColorApp.blue_container,
                      showIcon: false)),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 250,
                height: 250,
                child: Image.asset("assets/images/img_orange_woman.png"),
              ),
              const SizedBox(
                height: 100,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: CarouselSlider(
                    carouselController: controller.carouselC,
                    options: CarouselOptions(
                      height: 136,
                      aspectRatio: 327 / 136,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      enlargeFactor: 0.3,
                      onPageChanged: (index, reason) {
                        controller.currentIndex.value = index;
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                    items: List.generate(
                        controller.trackerResponse.value.data?.length ?? 0,
                        (index) {
                      return Obx(() => PhysicalCheckSlideItem(
                            index: index,
                            controller: controller,
                            ontap: () async {
                              controller.ontapPhysical(index);
                            },
                            opacity: controller.currentIndex.value == index
                                ? 1
                                : 0.5,
                          ));
                    }),
                  ),
                ),
              ),
              Obx(() {
                return (controller.showButton)
                    ? OrangeButtonWTrailingIcon(
                        determineAction: "ontap",
                        text: Strings.continue_text,
                        ontap: () {
                          // controller.pagePosition + 1;

                          FocusScope.of(context).requestFocus(new FocusNode());
                          Get.toNamed(Routes.MOOD_TRACKER_FORM);
                        },
                      )
                    : SizedBox();
              })
            ],
          ),
        ],
      ),
    );
  }
}

class PhysicalCheckSlideItem extends StatelessWidget {
  const PhysicalCheckSlideItem({
    super.key,
    required this.controller,
    required this.index,
    required this.ontap,
    required this.opacity,
  });

  final PhysicalCheckController controller;
  final int index;
  final Function ontap;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var data = controller.trackerResponse.value.data?[index];

      return GestureDetector(
        onTap: () {
          ontap();
        },
        child: Opacity(
            opacity: opacity,
            child: Container(
              padding: const EdgeInsets.all(18),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  color: data?.isDone == true
                      ? ColorApp.btn_maroon
                      : ColorApp.btn_orange),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data?.title ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: ColorApp.txt_white),
                  ),
                  Text(
                    data?.description ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: ColorApp.txt_white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )),
      );
    });
  }
}

class InputForm extends StatelessWidget {
  const InputForm({
    super.key,
    required this.ontap,
    required this.title,
    required this.subtitle,
    required this.controller,
  });

  final Function ontap;
  final String title;
  final String subtitle;
  final PhysicalCheckController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                    margin: const EdgeInsets.only(top: 60),
                    child: Header(
                        showCenterTitle: true,
                        centerTitle: Strings.physicalCheckIn,
                        rightText: Strings.skip,
                        isCostomBackFucntion: true,
                        onBack: () {
                          controller.pagePosition--;
                        },
                        showIcon: false)),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                if (subtitle != "")
                  Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: ColorApp.grey_font),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                Expanded(child: Container()),
                OrangeButtonWTrailingIcon(
                  determineAction: "ontap",
                  text: Strings.lets_go,
                  ontap: () {
                    ontap();
                  },
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    maxLines: 9,
                    minLines: 9,
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
