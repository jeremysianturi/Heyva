import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:heyva/app/modules/onboarding/controllers/onboarding_one_controller.dart';
import '../../../../constant/colors.dart';
import '../../../../constant/strings.dart';
import '../../../widgets/reusable_orange_button_with_trailing_icon.dart';

class OnBoardingOneView extends GetView<OnBoardingOneController> {
  const OnBoardingOneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String name = "Priscilla";
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_heyva.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width,
                      child: Text(
                        Strings.glad_text + controller.fullName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: ColorApp.black_font_underline),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      Strings.begin_journey_text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorApp.grey_font),
                    ),
                  ],
                ),
              ],
            ),
             OrangeButtonWTrailingIcon(
              determineAction: "from_onboarding_one",
              text: Strings.next,
            ),
          ],
        ),
      ),
    );
  }
}
