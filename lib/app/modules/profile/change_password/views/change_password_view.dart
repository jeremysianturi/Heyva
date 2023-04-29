import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/app/widgets/reusable_regular_textfield.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);

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
              height: Get.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg_heyva2.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: const Header(rightText: "", showIcon: false)),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    Strings.changePassword,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        color: ColorApp.blue_container),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 42),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => RegularTextField(
                            controller: controller.oldPassC,
                            isObsecure: controller.isObscureOld.value,
                            isError: controller.errorMessage.isNotEmpty,
                            hint: Strings.typeYourOldPass,
                            ontap: () {
                              controller.isObscureOld.value =
                                  !controller.isObscureOld.value;
                            },
                            isPassword: true,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
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
                        Obx(() {
                          return (controller.errorMessage.value.isNotEmpty)
                              ? Container(
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
                              : SizedBox();
                        }),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: OrangeButtonWTrailingIcon(
                            padding: 0,
                            determineAction: "from_onplanning_one",
                            text: Strings.changePassword,
                            ontap: () {
                              if (controller.validation) {
                                controller.postChangePassword();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
                  const Text(
                    Strings.forgotPassword,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: ColorApp.blue_container),
                  ),
                  const SizedBox(
                    height: 60,
                  )
                ],
              ),
            ))));
  }
}
