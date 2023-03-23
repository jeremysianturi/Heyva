import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/constant/colors.dart';

class FeelingItem extends StatelessWidget {
  const FeelingItem({
    super.key,
    required this.name,
    required this.ontap,
    required this.isSelected,
  });

  final String name;
  final Function ontap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
            color: isSelected ? ColorApp.btn_pink : ColorApp.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: isSelected ? Colors.transparent : ColorApp.btn_orange)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/smile.png"),
            SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: isSelected ? ColorApp.white : ColorApp.black,
                  fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
