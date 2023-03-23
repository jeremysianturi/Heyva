import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/recomendation_controller.dart';

class RecomendationView extends GetView<RecomendationController> {
  const RecomendationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_heyva.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 38),
                child: const Header(
                    showCenterTitle: true,
                    centerTitle: Strings.recomendation,
                    rightText: Strings.skip,
                    showIcon: false)),
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                Strings.recomendationSelftCare,
                style: TextStyle(
                    color: ColorApp.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: 4,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: index % 2 == 0
                        ? ColorApp.blue_container
                        : ColorApp.btn_maroon,
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 162 / 120,
                    crossAxisSpacing: 11,
                    mainAxisSpacing: 10),
              ),
            ),
            Expanded(child: Container()),
            OrangeButtonWTrailingIcon(
              determineAction: "ontap",
              text: Strings.lets_go,
              ontap: () {
                Get.toNamed(Routes.RECOMENDATION2);
              },
            )
          ],
        ),
      ),
    );
  }
}
