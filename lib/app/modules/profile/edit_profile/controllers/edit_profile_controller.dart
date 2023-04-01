import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';
import 'dart:math' as math;

class EditProfileController extends GetxController {
  TextEditingController fullnameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  var errorMessage = "".obs;

  changePicture() {
    Get.bottomSheet(
      Container(
          padding: const EdgeInsets.all(20),
          height: 218,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    Strings.changeProfilePicture,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: ColorApp.black_font_underline),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: CircleAvatar(
                      backgroundColor: ColorApp.btn_orange,
                      child: Transform.rotate(
                        angle: 180 * math.pi / 100,
                        child: const Icon(
                          Icons.add,
                          color: ColorApp.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        backgroundColor: ColorApp.btn_orange),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/ic_gallery.svg"),
                        const SizedBox(
                          width: 32,
                        ),
                        const Expanded(
                          child: Text(
                            Strings.chooseFromGallery,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: ColorApp.arrow_white),
                          ),
                        ),
                        Image.asset("assets/icons/ic_arrow_right.png"),
                      ],
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              )
            ],
          )),
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      ),
      backgroundColor: ColorApp.white,
      enableDrag: false,
    );
  }
}
