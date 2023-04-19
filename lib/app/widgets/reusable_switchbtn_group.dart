import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../constant/colors.dart';

class ReusableSwitchButton extends StatelessWidget {
  const ReusableSwitchButton({
    Key? key,
    required this.title,
    required this.desc,
    required this.index,
    required this.isActive,
    required this.onChange,
  }) : super(key: key);

  final String title;
  final String desc;
  final int index;
  final bool isActive;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: index == 0 ? 0 : 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: ColorApp.grey_font,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      desc,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: ColorApp.blue_container,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: FlutterSwitch(
                  value: isActive,
                  width: 51,
                  activeColor: ColorApp.btn_switch_green,
                  onToggle: (val) {
                    onChange(val);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: ColorApp.grey_divider,
            height: 2,
          ),
        ],
      ),
    );
  }
}
