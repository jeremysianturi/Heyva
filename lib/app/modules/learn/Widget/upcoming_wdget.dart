import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/bg_blue_container_medal.png"),
              ),
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
                        "Dui massa malesuada",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: ColorApp.white_font),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Ut ultricies augue quam eu eu eros quis justo. Sed ut scelerisque.",
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
        const SizedBox(
          height: 10,
        ),
        Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/bg_blue_container_medal.png"),
              ),
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
                        "Dui massa malesuada",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: ColorApp.white_font),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Ut ultricies augue quam eu eu eros quis justo. Sed ut scelerisque.",
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
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
