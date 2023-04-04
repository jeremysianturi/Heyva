import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/register/controllers/register_controller.dart';

import '../../../../constant/colors.dart';
import '../../../../constant/strings.dart';
import '../../../controllers/auth_controller.dart';
import '../../../widgets/reusable_btnlogin_group.dart';
import '../../../widgets/reusable_header.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);
  final authC = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  final registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: false,
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
                  height: 56,
                ),
                const Header(
                  rightText: Strings.login,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      Strings.register,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 42.5),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: registerController.fullname,
                          decoration: InputDecoration(
                            hintText: Strings.full_name,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 17, horizontal: 20),
                            filled: true,
                            fillColor: ColorApp.text_input_bg,
                            hintStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: ColorApp.grey_font),
                            labelStyle: const TextStyle(
                                fontSize: 16,
                                color: ColorApp.black_font_underline,
                                fontWeight: FontWeight.w400),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                color: ColorApp.red_error,
                                width: 2.0,
                              ),
                            ),
                            errorText: controller.isFullnameError.isTrue
                                ? "error"
                                : null,
                            errorStyle: const TextStyle(fontSize: 0.01),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: registerController.email,
                          decoration: InputDecoration(
                            hintText: Strings.email_adress,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 17, horizontal: 20),
                            filled: true,
                            fillColor: ColorApp.text_input_bg,
                            hintStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: ColorApp.grey_font),
                            labelStyle: const TextStyle(
                                fontSize: 16,
                                color: ColorApp.black_font_underline,
                                fontWeight: FontWeight.w400),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                color: ColorApp.red_error,
                                width: 2.0,
                              ),
                            ),
                            errorText:
                                controller.isEmailError.isTrue ? "error" : null,
                            errorStyle: const TextStyle(fontSize: 0.01),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Obx(
                          () => TextField(
                            controller: registerController.pass,
                            obscureText: registerController.isObscure.value,
                            decoration: InputDecoration(
                                hintText: Strings.password,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 17, horizontal: 20),
                                filled: true,
                                fillColor: ColorApp.text_input_bg,
                                hintStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: ColorApp.grey_font),
                                labelStyle: const TextStyle(
                                    fontSize: 16,
                                    color: ColorApp.black_font_underline,
                                    fontWeight: FontWeight.w400),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(
                                    color: ColorApp.red_error,
                                    width: 2.0,
                                  ),
                                ),
                                errorText: controller.isPassError.isTrue
                                    ? "error"
                                    : null,
                                errorStyle: const TextStyle(fontSize: 0.01),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    registerController.isObscure.value =
                                        !registerController.isObscure.value;
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20.0),
                                        child: Text(
                                          registerController.isObscure.isTrue
                                              ? "Show"
                                              : "Hide",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: ColorApp
                                                  .black_font_underline),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        if (controller.errorMessage.value.isNotEmpty)
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            width: Get.width,
                            child: Text(
                              controller.errorMessage.value,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: ColorApp.red_error),
                              textAlign: TextAlign.center,
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                ReusableBtnLoginGroup(
                  orangeBtnText: Strings.continue_text,
                  detemineAction: Strings.register,
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    controller.saveToStorage();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: RichText(
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
                ),
              ],
            ),
          ),
        ));
  }
}
