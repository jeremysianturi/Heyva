import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/login/controllers/login_controller.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/app/widgets/reusable_regular_textfield.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../constant/colors.dart';
import '../../../../constant/strings.dart';
import '../../../controllers/auth_controller.dart';
import '../../../widgets/reusable_btnlogin_group.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final loginController = Get.put(LoginController());
  final authC = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
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
                      padding: EdgeInsets.only(top: 50),
                      child: Header(
                        rightText: Strings.register,
                        ontapIcon: () {
                          Get.toNamed(Routes.REGISTER);
                          // Get.toNamed(Routes.TURNON_NOTIF);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              Strings.login,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: ColorApp.blue_container),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 42.5),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
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
                                const SizedBox(
                                  height: 12,
                                ),
                                Obx(
                                  () => RegularTextField(
                                    controller: controller.passC,
                                    isObsecure: loginController.isObscure.value,
                                    isError: controller.isPasserror.isTrue,
                                    hint: Strings.password,
                                    ontap: () {
                                      loginController.isObscure.value =
                                          !loginController.isObscure.value;
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
                        ),
                        ReusableBtnLoginGroup(
                          orangeBtnText: Strings.login,
                          detemineAction: Strings.login,
                          onTap: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            if (controller.validateData) {
                              controller.postLogin();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.RESET_PASSWORD);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 55),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              Strings.forgotPassword,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorApp.blue_container,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
