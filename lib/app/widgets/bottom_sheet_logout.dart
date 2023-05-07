import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';
import 'package:heyva/constant/variabels.dart';

logout() {
  Get.bottomSheet(
    Container(
        padding: const EdgeInsets.all(20),
        height: 218,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  Strings.doYouWanttoLogout,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: ColorApp.blue_container),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: CircleAvatar(
                    backgroundColor: ColorApp.btn_orange,
                    child: Transform.rotate(
                      angle: 180 * math.pi / 103.5,
                      child: const Icon(
                        Icons.add,
                        color: ColorApp.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          backgroundColor: ColorApp.btn_orange),
                      child: const Text(
                        Strings.noTakeMeBack,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: ColorApp.arrow_white),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(18),
                          side: const BorderSide(
                              width: 2, color: ColorApp.btn_orange),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          backgroundColor: ColorApp.white),
                      child: const Text(
                        Strings.yeSure,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: ColorApp.btn_orange),
                      ),
                      onPressed: () {
                        var box = GetStorage();
                        box.remove(Keys.loginAccessToken);
                        box.remove(Keys.loginRefreshToken);
                        box.remove(Keys.loginID);
                        box.remove(Keys.profileName);
                        box.remove(Keys.profileImgUrl);
                        box.erase();
                        authToken = "";
                        refreshToken = "";
                        Future.delayed(800.seconds);
                        Get.offNamed(Routes.SIGNUP);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        )),
    isDismissible: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(15), topLeft: Radius.circular(15)),
    ),
    backgroundColor: ColorApp.white,
    enableDrag: false,
  );
}
