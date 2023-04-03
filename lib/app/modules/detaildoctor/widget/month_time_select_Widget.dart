import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../constant/colors.dart';

class SelectMothTimeWidget extends StatelessWidget {
  const SelectMothTimeWidget({
    super.key,
    required this.ontap,
    required this.text,
  });

  final Function ontap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            color: ColorApp.btn_orange,
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              width: 13,
            ),
            Transform.rotate(
              angle: 180 * math.pi / 360,
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorApp.black_font_40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
