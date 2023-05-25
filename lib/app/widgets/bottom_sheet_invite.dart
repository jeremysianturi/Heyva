import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

inviteFriends() {
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
                  Strings.inviteYourFriends,
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
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      backgroundColor: ColorApp.btn_orange),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/ic_whatsapp.svg"),
                      const SizedBox(
                        width: 32,
                      ),
                      const Expanded(
                        child: Text(
                          Strings.whatsapp,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: ColorApp.arrow_white),
                        ),
                      ),
                      Image.asset("assets/icons/ic_arrow_right.png"),
                    ],
                  ),
                  onPressed: () async {
                    var message =
                        "Hey, let’s try Heyva together. It really helps me as a woman. I think you should try it. Click the link to install the app:  https://heyva.page.link/referral";

                    final link = WhatsAppUnilink(
                        phoneNumber: '+6584313869', text: message);
                    await launchUrlString('$link',
                        mode: LaunchMode.externalApplication);

                    Get.back();
                  },
                ),
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
