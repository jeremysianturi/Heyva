import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/keys.dart';

class FolderItem extends StatelessWidget {
  const FolderItem(
      {super.key, required this.title, required this.iconPath, required this.tagId});

  final String title, iconPath, tagId;

  @override
  Widget build(BuildContext context) {
    return

      GestureDetector(
        onTap: () {
          Get.toNamed(Routes.RELATED_PROGRAM, arguments: {
            Keys.learnTagId: tagId
          });
        },
        child: Container(
          padding: const EdgeInsets.only(left: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorApp.text_input_bg),
          height: 60,
          child: Row(
            children: [
              SvgPicture.asset(
                iconPath,
                // fit: BoxFit.cover,
                // color: ColorApp.blue_container,
                // alignment: Alignment.centerLeft,
                // width: 60,
                // height: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: ColorApp.blue_container),
              )
            ],
          ),
        ),
      );
  }
}
