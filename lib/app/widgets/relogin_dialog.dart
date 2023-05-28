import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';
import 'package:heyva/constant/variabels.dart';

import 'reusable_orange_button_with_trailing_icon.dart';

class ReloginDialog {
  static show() {
    Get.defaultDialog(
      title: '',
      backgroundColor: ColorApp.white.withOpacity(0.8),
      content: Container(
        width: 400,
        child: Column(
          children: [
            const Text(
              Strings.yourSessionExpired,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: ColorApp.black,
                  fontSize: 25),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              Strings.pleaseLogin,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: ColorApp.black,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 30.0,
            ),
            OrangeButtonWTrailingIcon(
              padding: 0,
              determineAction: "from_onplanning_one",
              text: Strings.continue_text,
              ontap: () {
                // if (controller.filePath.value != "" ||
                //     controller.fullnameC.text !=
                //         controller.box.read(Keys.profileName)) {
                //   controller.updateProfile();
                // } else {
                //   bottomSheetMessage(
                //       color: "heyva",
                //       desc: "There is no changes to your profile");
                // }
                var box = GetStorage();
                box.remove(Keys.loginAccessToken);
                box.remove(Keys.loginRefreshToken);
                box.remove(Keys.loginID);
                authToken = "";
                refreshToken = "";
                Future.delayed(800.seconds);
                Get.offNamed(Routes.SIGNUP);
              },
            )
          ],
        ),
      ),
      radius: 10.0,
    );
  }
}
