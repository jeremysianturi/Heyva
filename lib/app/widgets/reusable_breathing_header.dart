import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/strings.dart';

class BreathingHeader extends StatelessWidget {
  const BreathingHeader({
    Key? key,
    required this.indicatorColor1,
    required this.indicatorColor2,
    required this.indicatorColor3,
    required this.indicatorColor4,
    required this.indicatorColor5,
  }) : super(key: key);

  final Color indicatorColor1;
  final Color indicatorColor2;
  final Color indicatorColor3;
  final Color indicatorColor4;
  final Color indicatorColor5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Divider(
                  color: indicatorColor1,
                  height: 2,
                ),
              ),
              const SizedBox(
                width: 2.5,
              ),
              Expanded(
                child: Divider(
                  color: indicatorColor2,
                  height: 2,
                ),
              ),
              const SizedBox(
                width: 2.5,
              ),
              Expanded(
                child: Divider(
                  color: indicatorColor3,
                  height: 2,
                ),
              ),
              const SizedBox(
                width: 2.5,
              ),
              Expanded(
                child: Divider(
                  color: indicatorColor4,
                  height: 2,
                ),
              ),
              const SizedBox(
                width: 2.5,
              ),
              Expanded(
                child: Divider(
                  color: indicatorColor5,
                  height: 2,
                ),
              ),
              const SizedBox(
                width: 2.5,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              TextButton(
                onPressed: () {},
                child: const Text(Strings.skip, style: TextStyle(color: ColorApp.txt_white, fontSize: 16, fontWeight: FontWeight.w600),),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
