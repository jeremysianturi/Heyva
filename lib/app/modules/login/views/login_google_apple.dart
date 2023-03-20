import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/login/controllers/login_google_apple_controller.dart';
import 'package:heyva/app/modules/onboarding/views/onboarding_one_view.dart';
import '../../../../constant/colors.dart';
import '../../../../constant/strings.dart';
import '../../../widgets/reusable_orange_button_with_trailing_icon.dart';

class LoginGoogleAppleView extends GetView<LoginGoogleAppleController> {
  const LoginGoogleAppleView({Key? key}) : super(key: key);

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
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 43),
              child: Column(
                children: [
                  const SizedBox(height: 141,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        Strings.name_ques_text,
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: ColorApp.black_font_underline ),
                      )
                    ],
                  ),
                  const SizedBox(height: 40,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: Strings.full_name,
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      filled: true,
                      fillColor: ColorApp.text_input_bg,
                      hintStyle:
                      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      labelStyle:
                      const TextStyle(fontSize: 13, color: Colors.redAccent),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          color: ColorApp.text_input_bg,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          color: ColorApp.text_input_bg,
                          width: 2.0,
                        ),
                      ),
                      // border:
                      // OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(14),
                      //   borderSide: BorderSide(
                      //     color: Colors.red,
                      //     width: 0.0,
                      //   ),
                      // ),
                    ),
                  ),
                ],
              ),
            ),
            OrangeButtonWTrailingIcon(determineAction: "from_login", text: Strings.next,),
          ],
        ),
      ),
    );
  }
}


