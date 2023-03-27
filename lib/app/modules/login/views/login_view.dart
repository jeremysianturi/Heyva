import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/breathing/breathingone/views/breathing_one_view.dart';
import 'package:heyva/app/modules/login/controllers/login_controller.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
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
                      padding: EdgeInsets.only(top: 56),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.REGISTER);
                        },
                        child: Header(
                          rightText: Strings.register,
                        ),
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
                                  controller: loginController.emailC,
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
                                    errorText: controller.isEmailError.isTrue
                                        ? "error"
                                        : null,
                                    errorStyle: const TextStyle(fontSize: 0.01),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Obx(
                                  () => TextField(
                                    controller: loginController.passC,
                                    obscureText:
                                        loginController.isObscure.value,
                                    decoration: InputDecoration(
                                        hintText: Strings.password,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 17, horizontal: 20),
                                        filled: true,
                                        fillColor: ColorApp.text_input_bg,
                                        hintStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: ColorApp.grey_font),
                                        labelStyle: const TextStyle(
                                            fontSize: 16,
                                            color:
                                                ColorApp.black_font_underline,
                                            fontWeight: FontWeight.w400),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          borderSide: const BorderSide(
                                            color: ColorApp.red_error,
                                            width: 2.0,
                                          ),
                                        ),
                                        errorText: controller.isPasserror.isTrue
                                            ? "error"
                                            : null,
                                        errorStyle:
                                            const TextStyle(fontSize: 0.01),
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            loginController.isObscure.value =
                                                !loginController
                                                    .isObscure.value;
                                          },
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(right: 20.0),
                                                child: Text(
                                                  loginController.isObscure.isTrue
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
                  GestureDetector(
                    child: const Text("data"),
                    onTap: () {
                      Get.to(BreathingOneView());
                    },
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 55),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            Strings.cant_login,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorApp.black_font_underline,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )
                        ],
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
