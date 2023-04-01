import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:heyva/constant/colors.dart';

class NotifSettingItem extends StatelessWidget {
  const NotifSettingItem({
    super.key,
    required this.status,
    required this.ontap,
    required this.title,
  });

  final bool status;
  final Function ontap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: ColorApp.black_font_underline),
            ),
            FlutterSwitch(
              value: status,
              width: 51,
              activeColor: ColorApp.btn_switch_green,
              onToggle: (val) {
                ontap();
              },
            ),
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        Container(
          height: 1,
          width: Get.width,
          color: ColorApp.black.withOpacity(0.3),
        )
      ],
    );
  }
}
