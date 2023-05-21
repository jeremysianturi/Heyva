import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyva/app/modules/learn/controllers/learn_controller.dart';
import 'package:heyva/constant/colors.dart';

class FolderItem extends StatelessWidget {
  const FolderItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {

    Image? iconset(String title)  {
      switch (title) {
        case "Newborn":
        return Image.asset(
          'assets/icons/ic_newborn.png',
          fit: BoxFit.fill,
          color: ColorApp.blue_container,
          alignment: Alignment.centerLeft,
          width: 40,
          height: 40,
        );
        break;
        case "Postpartum":
          return Image.asset(
            'assets/icons/ic_postpartum.png',
            fit: BoxFit.fill,
            color: ColorApp.blue_container,
            alignment: Alignment.centerLeft,
            width: 40,
            height: 40,
          );
          break;
        case "Feeding":
          return Image.asset(
            'assets/icons/ic_feeding.png',
            fit: BoxFit.fill,
            color: ColorApp.blue_container,
            alignment: Alignment.centerLeft,
            width: 40,
            height: 40,
          );
          break;
        case "Pelvic Health":
          return Image.asset(
            'assets/icons/ic_pelvic_health.png',
            fit: BoxFit.fill,
            color: ColorApp.blue_container,
            alignment: Alignment.centerLeft,
            width: 40,
            height: 40,
          );
          break;
        case "Mental Health":
          return Image.asset(
            'assets/icons/ic_mental_health.png',
            fit: BoxFit.fill,
            color: ColorApp.blue_container,
            alignment: Alignment.centerLeft,
            width: 40,
            height: 40,
          );
          break;
        case "Body Recovery":
          return Image.asset(
            'assets/icons/ic_body_recovery.png',
            fit: BoxFit.fill,
            color: ColorApp.blue_container,
            alignment: Alignment.centerLeft,
            width: 40,
            height: 40,
          );
          break;
      }
    }
    return Container(
      padding: const EdgeInsets.only(left: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorApp.text_input_bg),
      height: 60,
      child: Row(
        children: [
          iconset(title)!,
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: ColorApp.blue_container),
          )
        ],
      ),
    );
  }
}
