import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/onboarding/views/onplanning/onplanning_one_view.dart';
import '../../constant/colors.dart';

class reusable_btn_wo_icon extends StatelessWidget {
  const reusable_btn_wo_icon({
    Key? key, required this.text, required this.color
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Get.to(OnPlanningOneView());
            },
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  side: BorderSide(color: color),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 17,horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        color: ColorApp.arrow_white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}