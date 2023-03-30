import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

class PelvicSessionItem extends StatelessWidget {
  const PelvicSessionItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: Get.width / 2,
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorApp.container_pink),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Pelvic Session",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: ColorApp.black),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "The quick brown fox jumps over the lazy dog.",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: ColorApp.black.withOpacity(0.6)),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/ic_sound.svg',
                fit: BoxFit.fill,
                alignment: Alignment.centerLeft,
                width: 15,
                height: 12,
                color: ColorApp.black,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                Strings.program,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: ColorApp.black_font_underline),
              ),
            ],
          )
        ],
      ),
    );
  }
}
