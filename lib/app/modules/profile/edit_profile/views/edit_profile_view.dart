import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/profile/widget/profile_header.dart';
import 'package:heyva/app/widgets/bottom_sheet_logout.dart';
import 'package:heyva/app/widgets/reusable_bottomSheet_message.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/app/widgets/reusable_regular_textfield.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/strings.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => LoadingOverlay(
        isLoading: controller.isLoading.value,
        color: Colors.grey,
        progressIndicator: const CircularProgressIndicator(
          color: ColorApp.btn_orange,
        ),
        opacity: 0.3,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              height: Get.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg_heyva2.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Container(
                      margin: const EdgeInsets.only(top: 14),
                      child: ProfileHeader(
                        centerTitle: Strings.profile,
                        showIcon: true,
                        isCostomBackFucntion: true,
                        showCenterTitle: true,
                        onBack: () {
                          Get.back();
                        },
                        ontapIcon: () {
                          logout();
                        },
                      )),
                  const SizedBox(
                    height: 36,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.changePicture();
                    },
                    child: Stack(
                      children: [
                        SizedBox(
                            height: 80,
                            width: 80,
                            child: controller.filePath.value == ""
                                ? CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      controller.profileAvatar,
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundImage: FileImage(
                                        File(controller.filePath.value)),
                                  )),
                        Positioned(
                            right: 0,
                            child: SizedBox(
                                width: 16,
                                height: 16,
                                child: SvgPicture.asset(
                                    "assets/icons/ic_edit.svg")))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 88,
                        ),
                        Obx(
                          () => RegularTextField(
                            controller: controller.fullnameC,
                            isObsecure: false,
                            isError: controller.errorMessage.isNotEmpty,
                            hint: Strings.full_name,
                            ontap: () {},
                            isPassword: false,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Obx(
                          () => RegularTextField(
                            controller: controller.phoneC,
                            isObsecure: false,
                            isError: controller.errorMessage.isNotEmpty,
                            hint: Strings.phone_number,
                            ontap: () {},
                            isPassword: false,
                            isNumber: true,
                            isEnable: false,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Obx(
                          () => RegularTextField(
                            controller: controller.emailC,
                            isObsecure: false,
                            isError: controller.errorMessage.isNotEmpty,
                            hint: Strings.email_adress,
                            ontap: () {},
                            isPassword: false,
                            isEnable: false,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: OrangeButtonWTrailingIcon(
                            padding: 0,
                            determineAction: "from_onplanning_one",
                            text: Strings.save,
                            ontap: () {
                              if (controller.filePath.value != "" ||
                                  controller.fullnameC.text !=
                                      controller.box.read(Keys.profileName)) {
                                controller.updateProfile();
                              } else {
                                bottomSheetMessage(
                                    color: "red",
                                    desc: "no data has been changed");
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))));
  }
}
