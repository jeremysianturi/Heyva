import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../constant/colors.dart';
import '../modules/onboarding/controllers/turnon_notif/turnon_notif_controller.dart';

class ReusableSwitchButton extends StatelessWidget {
  const ReusableSwitchButton({
    Key? key,
    required this.controller,
    required this.title,
    required this.desc,
    required this.switchCount,
  }) : super(key: key);

  final TurnOnNotifController controller;
  final String title;
  final String desc;
  final int switchCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                        color: ColorApp.black,
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
                        color: ColorApp.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Obx(
                  () => Switch(
                    value: switchCount == 1
                        ? controller.on.value
                        : controller.on2.value,
                    onChanged: (value) {
                      switchCount == 1
                          ? controller.toggle()
                          : controller.toggle2();
                    },
                    activeTrackColor: ColorApp.btn_switch_green,
                    activeColor: ColorApp.white,
                  ),
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
