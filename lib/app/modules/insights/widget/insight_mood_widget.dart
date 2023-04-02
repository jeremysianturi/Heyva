import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

class InsightMoodWidget extends StatelessWidget {
  const InsightMoodWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: Get.width - 65,
      decoration: const BoxDecoration(
          color: ColorApp.white,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: Get.width,
            decoration: const BoxDecoration(
                color: ColorApp.btn_orange,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            child: const Text(
              "Sleep",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: ColorApp.white),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  Strings.youFelt,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: ColorApp.black_font_underline),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 11),
                    decoration: const BoxDecoration(
                        color: ColorApp.text_input_bg,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/smile.png"),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Joy",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: ColorApp.black_font_underline,
                              fontSize: 14),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  Strings.thisImpactedYou,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: ColorApp.black_font_underline),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 11),
                    decoration: const BoxDecoration(
                        color: ColorApp.text_input_bg,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/smile.png"),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Joy",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: ColorApp.black_font_underline,
                              fontSize: 14),
                        )
                      ],
                    )),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              Strings.yourNotes,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: ColorApp.black_font_underline),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border: Border.all(color: ColorApp.btn_orange, width: 1)),
            child: const Text(
              "This Your Notes",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: ColorApp.black_font_underline),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
