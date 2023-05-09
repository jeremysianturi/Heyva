import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/register/controllers/register_controller.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_regular_textfield.dart';
import 'package:heyva/constant/keys.dart';
import 'package:loading_overlay/loading_overlay.dart';

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
    return Obx(() => LoadingOverlay(
        isLoading: controller.isLoading.value,
        color: Colors.grey,
        progressIndicator: const CircularProgressIndicator(
          color: ColorApp.btn_orange,
        ),
        opacity: 0.3,
        child: Scaffold(
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
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Header(
                      rightText: Strings.login,
                      ontapIcon: () {
                        Get.toNamed(Routes.LOGIN);
                      },
                    ),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          Strings.register,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: ColorApp.blue_container),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 42.5),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Obx(
                                  () => RegularTextField(
                                    controller: registerController.fullname,
                                    isObsecure: false,
                                    isError: controller.isFullnameError.isTrue,
                                    hint: Strings.full_name,
                                    ontap: () {},
                                    isPassword: false,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Obx(
                                  () => RegularTextField(
                                    controller: registerController.email,
                                    isObsecure: false,
                                    isError: controller.isEmailError.isTrue,
                                    hint: Strings.email_adress,
                                    ontap: () {},
                                    isPassword: false,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Obx(
                                  () => RegularTextField(
                                    controller: registerController.pass,
                                    isObsecure:
                                        registerController.isObscure.value,
                                    isError: controller.isPassError.isTrue,
                                    hint: Strings.password,
                                    ontap: () {
                                      registerController.isObscure.value =
                                          !registerController.isObscure.value;
                                    },
                                    isPassword: true,
                                  ),
                                ),
                                if (controller.errorMessage.value.isNotEmpty)
                                  Container(
                                    margin: const EdgeInsets.only(top: 8),
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
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            if (controller.validateData) {
                              controller.cekVerified();
                            }
                          },
                        ),
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(bottom: 40),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(fontSize: 14),
                        children: [
                          const TextSpan(
                            text: Strings.privacy_policy_text1,
                            style: TextStyle(
                              color: ColorApp.grey_font,
                            ),
                          ),
                          TextSpan(
                            text: Strings.terms_service_underline,
                            style: const TextStyle(
                                color: ColorApp.blue_container,
                                decoration: TextDecoration.underline,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(Routes.IN_APP_WEB_VIEW, arguments: {
                                  Keys.arUrl:
                                      "http://54.169.131.201/#/termsofservice"
                                });
                              },
                          ),
                          const TextSpan(
                            text: Strings.privacy_policy_text2,
                            style: TextStyle(color: ColorApp.grey_font),
                          ),
                          const TextSpan(
                            text: Strings.privacy_policy_text3,
                            style: TextStyle(color: ColorApp.grey_font),
                          ),
                          TextSpan(
                            text: Strings.privacy_policy_underline,
                            style: const TextStyle(
                                color: ColorApp.blue_container,
                                decoration: TextDecoration.underline,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(Routes.IN_APP_WEB_VIEW, arguments: {
                                  Keys.arUrl:
                                      "http://54.169.131.201/#/privacypolicy"
                                });
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
