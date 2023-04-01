import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:heyva/app/modules/profile/widget/profile_detail.dart';
import 'package:heyva/app/modules/profile/widget/profile_header.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/profile_controller.dart';

class ProfileSettingsItem extends StatelessWidget {
  const ProfileSettingsItem({
    required this.ontap,
    required this.title,
  });

  final String title;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: ColorApp.black),
                ),
                SvgPicture.asset("assets/icons/ic_chevron_right.svg")
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: Get.width,
              height: 1,
              color: ColorApp.black.withOpacity(0.3),
            )
          ],
        ),
      ),
    );
  }
}
