import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/profile/controllers/profile_controller.dart';
import 'package:heyva/constant/colors.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({
    super.key,
    required this.controller,
    required this.ontap,
  });

  final ProfileController controller;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: () {
            ontap();
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
                    ontap();
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
                          color: ColorApp.blue_container),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      controller.phone,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorApp.blue_container),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      controller.email,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorApp.blue_container),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
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
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                placeholder: (context, url) => const Padding(
                  padding: EdgeInsets.all(10),
                  child: CircularProgressIndicator(
                    color: ColorApp.btn_orange,
                  ),
                ),
                imageBuilder: (context, image) => CircleAvatar(
                  backgroundImage: image,
                  radius: 150,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )),
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
