import 'package:flutter/material.dart';
import '../../constant/colors.dart';

class OnBoardingHeader extends StatelessWidget {
  const OnBoardingHeader({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.indicatorColor1,
    required this.indicatorColor2,
    required this.indicatorColor3,
  }) : super(key: key);

  final Color indicatorColor1;
  final Color indicatorColor2;
  final Color indicatorColor3;
  final String title;
  final String subtitle;

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
              Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  color: ColorApp.black_font_underline,
                  fontWeight: FontWeight.w700,
                ),
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
