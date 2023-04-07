import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/profile/controllers/profile_controller.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/colors.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({
    super.key,
    required this.controller,
  });

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.EDIT_PROFILE);
      },
      child: Container(
        height: 80,
        width: Get.width,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            ProfileAvatar(
              imgUrl: controller.profileAvatar,
              ontap: () {
                Get.toNamed(Routes.EDIT_PROFILE);
              },
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.profileName,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: ColorApp.black_font_underline),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "+62 87785191978",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ColorApp.black_font_underline),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "priscilla@gmail.com",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ColorApp.black_font_underline),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.imgUrl,
    this.ontap,
  });

  final String imgUrl;
  final Function? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap!();
      },
      child: Stack(
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: CircleAvatar(
              backgroundImage: NetworkImage(imgUrl),
            ),
          ),
          Positioned(
              right: 0,
              child: SizedBox(
                  width: 16,
                  height: 16,
                  child: SvgPicture.asset("assets/icons/ic_edit.svg")))
        ],
      ),
    );
  }
}
