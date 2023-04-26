import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../constant/colors.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    this.rightText,
    this.showIcon = false,
    this.ontapIcon,
    this.showCenterTitle = false,
    this.centerTitle,
    this.titleColor = ColorApp.blue_container,
    this.onBack,
    this.isCostomBackFucntion = false,
  }) : super(key: key);

  final String? rightText;
  final bool showIcon;
  final Function? ontapIcon;
  final bool showCenterTitle;
  final String? centerTitle;
  final Color titleColor;
  final Function? onBack;
  final bool isCostomBackFucntion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              if (isCostomBackFucntion) {
                onBack!();
              } else {
                Navigator.of(context).pop();
              }
            },
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(11),
                minimumSize: Size.zero,
                primary: ColorApp.white,
                elevation: 0),
            child: InkWell(
              onTap: () {
                if (isCostomBackFucntion) {
                  onBack!();
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: const Icon(
                Icons.arrow_back,
                size: 18,
                color: ColorApp.black_arrow_back,
              ),
            ),
          ),
          if (showCenterTitle)
            Text(
              centerTitle ?? "",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: titleColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          showIcon
              ? ElevatedButton(
                  onPressed: () {
                    ontapIcon!();
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(11),
                      minimumSize: Size.zero,
                      primary: ColorApp.white,
                      elevation: 0),
                  child: SvgPicture.asset(
                    'assets/icons/ic_option_header.svg',
                    fit: BoxFit.fill,
                    alignment: Alignment.centerLeft,
                    width: 18,
                    height: 18,
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    ontapIcon!();
                  },
                  child: Text(
                    rightText ?? "",
                    style: const TextStyle(
                        color: ColorApp.blue_container,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
        ],
      ),
    );
  }
}
