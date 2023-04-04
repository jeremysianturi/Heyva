import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/recomendation2_controller.dart';

class Recomendation2View extends GetView<Recomendation2Controller> {
  const Recomendation2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  margin: const EdgeInsets.only(top: 14),
                  child: const Header(
                      showCenterTitle: true,
                      centerTitle: Strings.recomendation,
                      rightText: Strings.skip,
                      showIcon: true)),
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  Strings.thankyouMood,
                  style: TextStyle(
                      color: ColorApp.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 28),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  Strings.notice,
                  style: TextStyle(
                      color: ColorApp.grey_font,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: Get.width,
                height: 1,
                color: ColorApp.black.withOpacity(0.3),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                Strings.recomendation,
                style: TextStyle(
                    color: ColorApp.black_article_title,
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              RecomendationWidget(
                bg: ColorApp.blue_container,
                height: 140,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: RecomendationWidget(
                      bg: ColorApp.btn_pink,
                      height: 200,
                      marRight: 5,
                    ),
                  ),
                  Expanded(
                    child: RecomendationWidget(
                      bg: ColorApp.btn_maroon,
                      height: 200,
                      marleft: 5,
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              OrangeButtonWTrailingIcon(
                determineAction: "ontap",
                text: Strings.thankYou,
                ontap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RecomendationWidget extends StatelessWidget {
  RecomendationWidget({
    super.key,
    required this.bg,
    required this.height,
    this.marRight = 20.0,
    this.marleft = 20.0,
  });

  final Color bg;
  final double height;
  double marRight = 20.0, marleft = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(left: marleft, right: marRight),
      width: Get.width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: bg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recent article title",
            style: TextStyle(
                color: ColorApp.white,
                fontWeight: FontWeight.w700,
                fontSize: 20),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Short text description",
            style: TextStyle(
                color: ColorApp.white,
                fontWeight: FontWeight.w400,
                fontSize: 14),
          ),
          const Expanded(child: SizedBox()),
          Row(
            children: [
              SvgPicture.asset('assets/icons/ic_sound.svg'),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "Program",
                style: TextStyle(
                    color: ColorApp.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
            ],
          )
        ],
      ),
    );
  }
}
