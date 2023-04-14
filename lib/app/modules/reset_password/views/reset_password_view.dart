import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/app/widgets/reusable_regular_textfield.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.only(top: 56),
                  child: Header(
                    centerTitle: Strings.resetPassword,
                    showCenterTitle: true,
                    ontapIcon: () {},
                  ),
                ),
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
                          Strings.enterYourEmailResetPass,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: ColorApp.blue_container),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 55,
                      ),
                      Obx(
                        () => RegularTextField(
                          controller: controller.emailC,
                          isObsecure: false,
                          isError: controller.isEmailError.isTrue,
                          hint: Strings.email_adress,
                          ontap: () {},
                          isPassword: false,
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
                    FocusScope.of(context).requestFocus(new FocusNode());
                    if (controller.validateData) {
                      controller.postResetPassword();
                    }
                  },
                ),
              ],
            ),
          ),
        )));
  }
}
