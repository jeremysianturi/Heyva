import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/routes/app_pages.dart';
import '../../constant/colors.dart';
import '../../constant/strings.dart';
import '../modules/onboarding/views/onboarding_one_view.dart';
import '../modules/onboarding/views/onboarding_three_view.dart';
import '../modules/onboarding/views/onboarding_two_view.dart';
import '../modules/onboarding/views/turnon_notif/turnon_notif_view.dart';

class OrangeButtonWTrailingIcon extends StatelessWidget {
  OrangeButtonWTrailingIcon({
    Key? key,
    required this.determineAction,
    required this.text,
    this.ontap,
    this.padding = 20,
  }) : super(key: key);

  final String determineAction;
  final String text;
  final Function? ontap;
  double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              if (determineAction == "from_login") {
                Get.to(const OnBoardingOneView());
              } else if (determineAction == "from_onboarding_one") {
                Get.to(OnBoardingTwoView());
              } else if (determineAction == "from_onboarding_two") {
                // Get.to(const OnBoardingThreeView());
                // Get.toNamed(Routes.ONBOARDING_THREE);
                ontap!();
              } else if (determineAction == "from_onplanning_one") {
                ontap!();
              } else if (determineAction == "ontap") {
                ontap!();
              }
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(ColorApp.btn_orange),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  side: BorderSide(color: ColorApp.btn_orange),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        color: ColorApp.arrow_white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  const ImageIcon(
                    AssetImage("assets/icons/ic_arrow_right.png"),
                    color: ColorApp.arrow_white,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          )
        ],
      ),
    );
  }
}
