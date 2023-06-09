import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../controllers/onplanning/onplanning_one_controller.dart';

class OnPlanningOneView extends GetView<OnPlanningOneController> {
  OnPlanningOneView({Key? key}) : super(key: key);
  final onPlanningOneController = Get.put(OnPlanningOneController());

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
            body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_heyva.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              // const OnBoardingHeader(
              //   indicatorColor1: ColorApp.btn_orange,
              //   indicatorColor2: ColorApp.btn_orange,
              //   indicatorColor3: ColorApp.btn_orange,
              //   title: Strings.interest_ques_text,
              //   subtitle: Strings.choose_as_many,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Expanded(
                      child: Divider(
                        color: ColorApp.btn_orange,
                        height: 2,
                      ),
                    ),
                    SizedBox(
                      width: 2.5,
                    ),
                    Expanded(
                      child: Divider(
                        color: ColorApp.btn_orange,
                        height: 2,
                      ),
                    ),
                    SizedBox(
                      width: 2.5,
                    ),
                    Expanded(
                      child: Divider(
                        color: ColorApp.btn_orange,
                        height: 2,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(11),
                        minimumSize: Size.zero,
                        primary: ColorApp.white,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 18,
                        color: ColorApp.black_arrow_back,
                      ),
                    ),
                    Container()
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            Strings.interest_ques_text,
                            style: TextStyle(
                              fontSize: 28,
                              color: ColorApp.blue_container,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            Strings.choose_as_many,
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorApp.grey_font,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                          child: Column(
                        children: List.generate(
                            onPlanningOneController.list.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    children: [
                                      Obx(
                                        () => ElevatedButton(
                                          onPressed: () {
                                            onPlanningOneController.list[index]
                                                    .isSelected.value =
                                                !onPlanningOneController
                                                    .list[index]
                                                    .isSelected
                                                    .value;
                                            if (onPlanningOneController
                                                    .list[index]
                                                    .isSelected
                                                    .value ==
                                                true) {
                                              onPlanningOneController
                                                  .anyButtonStillSelected(
                                                      "plus");
                                            } else {
                                              onPlanningOneController
                                                  .anyButtonStillSelected(
                                                      "minus");
                                            }
                                            print(
                                                "check current value button selected remaining: ${onPlanningOneController.selectedBtnRemaining}");
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                        Color>(
                                                    onPlanningOneController
                                                            .list[index]
                                                            .isSelected
                                                            .value
                                                        ? ColorApp.btn_pink
                                                        : ColorApp.white),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(14)),
                                                side: BorderSide(
                                                    color:
                                                        onPlanningOneController
                                                                .list[index]
                                                                .isSelected
                                                                .value
                                                            ? ColorApp.btn_pink
                                                            : ColorApp
                                                                .btn_orange),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 17, horizontal: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  onPlanningOneController
                                                      .list[index].subject,
                                                  style: TextStyle(
                                                      color:
                                                          onPlanningOneController
                                                                  .list[index]
                                                                  .isSelected
                                                                  .value
                                                              ? ColorApp.white
                                                              : ColorApp
                                                                  .blue_container,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                    ],
                                  ),
                                )),
                      )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => Visibility(
                    visible: onPlanningOneController.selectedBtnRemaining > 0
                        ? true
                        : false,
                    child: OrangeButtonWTrailingIcon(
                      determineAction: "from_onplanning_one",
                      text: Strings.lets_go,
                      ontap: () {
                        controller.onTap();
                      },
                    )),
              ),
            ],
          ),
          // Container(
          //   color: Colors.red,
          // )
        ))));
  }
}
