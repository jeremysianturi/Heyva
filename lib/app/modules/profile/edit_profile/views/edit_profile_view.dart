import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/profile/widget/profile_detail.dart';
import 'package:heyva/app/modules/profile/widget/profile_header.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/app/widgets/reusable_regular_textfield.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            height: Get.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_heyva2.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 14),
                    child: const ProfileHeader(
                      centerTitle: Strings.profile,
                      showIcon: true,
                      showCenterTitle: true,
                    )),
                const SizedBox(
                  height: 36,
                ),
                const ProfileAvatar(
                  imgUrl:
                      "https://cdn06.pramborsfm.com/storage/app/media/Prambors/cropped-images/SpongeBob%20SquarePants-20210329062638.jpg?tr=w-800",
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
                          ontap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
