import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyva/constant/colors.dart';

class FolderItem extends StatelessWidget {
  const FolderItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorApp.text_input_bg),
      height: 60,
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/ic_folder.svg',
            fit: BoxFit.fill,
            color: ColorApp.blue_container,
            alignment: Alignment.centerLeft,
            width: 60,
            height: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: ColorApp.blue_container),
          )
        ],
      ),
    );
  }
}
