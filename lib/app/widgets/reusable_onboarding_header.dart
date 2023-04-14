import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class OnBoardingHeader extends StatelessWidget {
  OnBoardingHeader(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.indicatorColor1,
      required this.indicatorColor2,
      required this.indicatorColor3,
      this.showBackIcon = true})
      : super(key: key);

  final Color indicatorColor1;
  final Color indicatorColor2;
  final Color indicatorColor3;
  final String title;
  final String subtitle;
  bool showBackIcon = false;

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
              )
            ],
          ),
        ),
        if (showBackIcon)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(11),
                    minimumSize: Size.zero,
                    primary: ColorApp.white,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 18,
                    color: ColorApp.black_arrow_back,
                  ),
                ),
                Container()
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  color: ColorApp.blue_container,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 16,
                  color: ColorApp.grey_font,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
