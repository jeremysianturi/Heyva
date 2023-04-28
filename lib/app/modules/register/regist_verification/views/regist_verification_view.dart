import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:open_mail_app/open_mail_app.dart';

import '../controllers/regist_verification_controller.dart';

class RegistVerificationView extends GetView<RegistVerificationController> {
  const RegistVerificationView({Key? key}) : super(key: key);

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
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  Strings.registration,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 50, right: 50, top: 80),
                    child: Image.asset("assets/images/plane.png")),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  controller.isVerified
                      ? Strings.thankYou
                      : Strings.checkYourEnauk,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      color: ColorApp.blue_container),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    controller.isVerified
                        ? Strings.thankYoutForYourConfirm
                        : "${Strings.confirmEmail} ${controller.boxData.value.email}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: ColorApp.grey_font),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Expanded(child: SizedBox()),
                Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                  child: ElevatedButton(
                    onPressed: () async {
                      controller.cekVerified();
                      if (controller.isVerified) {
                        Future.delayed(200.milliseconds, () {
                          controller.postLogin();
                        });
                      } else {
                        var result = await OpenMailApp.openMailApp();
                        if (!result.didOpen && !result.canOpen) {
                          showNoMailAppsDialog(Get.context!);
                        } else if (!result.didOpen && result.canOpen) {
                          showDialog(
                            context: Get.context!,
                            builder: (_) {
                              return MailAppPickerDialog(
                                mailApps: result.options,
                              );
                            },
                          );
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(ColorApp.btn_orange),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          side: BorderSide(color: ColorApp.btn_orange),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 17, right: 20, bottom: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(controller.buttonTitle),
                          const ImageIcon(
                            AssetImage("assets/icons/ic_arrow_right.png"),
                            color: ColorApp.arrow_white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}

void showNoMailAppsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Open Mail App"),
        content: Text("No mail apps installed"),
        actions: <Widget>[
          ElevatedButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}
