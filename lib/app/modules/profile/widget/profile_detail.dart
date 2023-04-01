import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:heyva/app/modules/profile/widget/profile_header.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/profile_controller.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Stack(
            children: [
              const SizedBox(
                height: 80,
                width: 80,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn06.pramborsfm.com/storage/app/media/Prambors/cropped-images/SpongeBob%20SquarePants-20210329062638.jpg?tr=w-800"),
                ),
              ),
              Positioned(
                  right: 0,
                  child: SizedBox(
                      width: 16,
                      height: 16,
                      child: SvgPicture.asset(
                          "assets/icons/ic_edit.svg")))
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Priscilla",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: ColorApp.black_font_underline),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "+62 87785191978",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorApp.black_font_underline),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "priscilla@gmail.com",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorApp.black_font_underline),
              ),
            ],
          )
        ],
      ),
    );
  }
}
