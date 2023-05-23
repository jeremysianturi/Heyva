import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyva/app/modules/learn/controllers/learn_controller.dart';
import 'package:heyva/constant/colors.dart';

class FolderItem extends StatelessWidget {
  const FolderItem({super.key, required this.title, required this.iconPath});

  final String title, iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
