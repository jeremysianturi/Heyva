import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/app/widgets/reusable_regular_textfield.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../controllers/reset_password_input_controller.dart';

class ResetPasswordInputView extends GetView<ResetPasswordInputController> {
  const ResetPasswordInputView({Key? key}) : super(key: key);

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
            height: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_heyva.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 43),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 63,
                      ),
                      Container(
                        width: Get.width,
                        child: const Text(
                          Strings.resetYourPassword,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: ColorApp.blue_container),
                        ),
                      ),
                      const SizedBox(
                        height: 55,
                      ),
                      Obx(
                        () => RegularTextField(
                          controller: controller.pass1C,
                          isObsecure: controller.isObscure1.value,
                          isError: controller.errorMessage.isNotEmpty,
                          hint: Strings.typeYourNewPass,
                          ontap: () {
                            controller.isObscure1.value =
                                !controller.isObscure1.value;
                          },
                          isPassword: true,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Obx(
                        () => RegularTextField(
                          controller: controller.pass2C,
                          isObsecure: controller.isObscure2.value,
                          isError: controller.errorMessage.isNotEmpty,
                          hint: Strings.newPassConfrim,
                          ontap: () {
                            controller.isObscure2.value =
                                !controller.isObscure2.value;
                          },
                          isPassword: true,
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
                const Expanded(child: SizedBox()),
                OrangeButtonWTrailingIcon(
                  determineAction: "ontap",
                  text: Strings.next,
                  ontap: () {
                    if (controller.validation) {
                      // controller.postChangePassword();
                    }
                  },
                ),
              ],
            ),
          ),
        )));
  }
}
