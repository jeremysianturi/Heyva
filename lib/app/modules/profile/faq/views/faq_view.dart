import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/widgets/requsable_privacy_policy_item.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/faq_controller.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            height: Get.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_heyva2.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 14),
                      child: const Header(
                        rightText: "",
                        showIcon: false,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          Strings.faq,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 28,
                              color: ColorApp.black_font_underline),
                        ),
                        const SizedBox(
                          height: 23,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            Strings.privacyPolicyDesc,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: ColorApp.black_font_underline),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Column(
                          children: List.generate(
                              controller.list.length,
                              (index) => PrivacyPolicyItem(
                                    data: controller.list[index],
                                    index: index,
                                    onChange: () {
                                      controller.list[index].isSelected.value =
                                          !controller
                                              .list[index].isSelected.value;
                                      print(
                                          "onchange ${controller.list[index].isSelected.value}");
                                    },
                                  )),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          width: Get.width,
                          child: const Text(
                            "Effective from March 2023",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: ColorApp.black_font_underline),
                            textAlign: TextAlign.start,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
