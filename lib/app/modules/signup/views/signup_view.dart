import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/signup/controllers/signup_controller.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';
import '../../../widgets/reusable_btnlogin_group.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 64,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/images/heyva_text_logo.svg"),
                      const Text(
                        Strings.login,
                        style: TextStyle(
                            color: ColorApp.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      Strings.new_acc_text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorApp.black_font_underline,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                ReusableBtnLoginGroup(
                  orangeBtnText: Strings.continue_email,
                  detemineAction: Strings.continue_email,
                ),
                const SizedBox(
                  height: 109,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(fontSize: 14),
                    children: [
                      TextSpan(
                        text: Strings.privacy_policy_text1,
                        style: TextStyle(
                          color: ColorApp.grey_font,
                        ),
                      ),
                      TextSpan(
                        text: Strings.terms_service_underline,
                        style: TextStyle(
                            color: ColorApp.black_font_underline,
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: Strings.privacy_policy_text2,
                        style: TextStyle(color: ColorApp.grey_font),
                      ),
                      TextSpan(
                        text: Strings.privacy_policy_text3,
                        style: TextStyle(color: ColorApp.grey_font),
                      ),
                      TextSpan(
                        text: Strings.privacy_policy_underline,
                        style: TextStyle(
                            color: ColorApp.black_font_underline,
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
