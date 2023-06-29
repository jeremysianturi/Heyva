import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/widgets/reusable_bottomSheet_message.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

class UpcomingWidget extends StatelessWidget {
  const UpcomingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          Strings.upcomingProgram,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: ColorApp.blue_container),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            bottomSheetMessage(
                color: "heyva", desc: "This feature / content is coming soon!");
          },
          child: Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: const AssetImage(
                      "assets/images/upcoming1.png",
                    ),
                    colorFilter: ColorFilter.mode(
                        ColorApp.black.withOpacity(0.6), BlendMode.srcOver)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Breastfeeding position variations to try",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: ColorApp.white_font),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "This upcoming video will show you the importance of finding the right position to do breastfeed.",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorApp.grey_card_font.withOpacity(0.6)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   child: const Icon(
                  //     Icons.arrow_forward_ios,
                  //     color: ColorApp.white_font,
                  //   ),
                  // ),
                  const SizedBox(
                    width: 80,
                  )
                ],
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            bottomSheetMessage(
                color: "heyva", desc: "This feature / content is coming soon!");
          },
          child: Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/upcoming2.png"),
                    colorFilter: ColorFilter.mode(
                        ColorApp.black.withOpacity(0.6), BlendMode.srcOver)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "How to latch",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: ColorApp.white_font),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "This upcoming video will show you how important a proper latch is for a successful breastfeeding.",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorApp.grey_card_font.withOpacity(0.6)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   child: const Icon(
                  //     Icons.arrow_forward_ios,
                  //     color: ColorApp.white_font,
                  //   ),
                  // ),
                  const SizedBox(
                    width: 80,
                  )
                ],
              )),
        ),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
