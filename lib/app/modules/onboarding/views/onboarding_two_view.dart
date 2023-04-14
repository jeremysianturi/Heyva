import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/constant/strings.dart';

import '../../../../constant/colors.dart';
import '../../../widgets/reusable_onboarding_header.dart';
import '../../../widgets/reusable_orange_button_with_trailing_icon.dart';
import '../controllers/onboarding_two_controller.dart';

class OnBoardingTwoView extends GetView<OnBoardingTwoController> {
  OnBoardingTwoView({Key? key}) : super(key: key);
  final onBoardingTwoController = Get.put(OnBoardingTwoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_heyva.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Padding(
              padding: EdgeInsets.only(top: 48),
              child: OnBoardingHeader(
                indicatorColor1: ColorApp.btn_orange,
                indicatorColor2: ColorApp.grey_divider,
                indicatorColor3: ColorApp.grey_divider,
                title: Strings.birthday_ques_text,
                subtitle: Strings.relevant_text,
                showBackIcon: false,
              ),
            ),
            Column(
              children: [
                Container(
                  width: Get.width,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      _openDatePicker(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ColorApp.text_input_bg),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          side: BorderSide(color: ColorApp.text_input_bg),
                        ),
                      ),
                    ),
                    child: Obx(
                      () => Container(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        child: Text(
                          "${onBoardingTwoController.dateChosen.value}",
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: ColorApp.blue_container),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: OrangeButtonWTrailingIcon(
                    determineAction: "from_onboarding_two",
                    text: Strings.next,
                    ontap: () {
                      controller.onTap();
                    },
                  ),
                ),
              ],
            ),
            Container(),
          ],
        ),
      ),
    );
  }

  void _openDatePicker(BuildContext context) {
    BottomPicker.date(
      title: 'Set your Birthday',
      dateOrder: DatePickerDateOrder.dmy,
      pickerTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.blue,
      ),
      onChange: (dateChosen) {},
      onSubmit: (dateChosen) {
        var parsedDate = DateTime.tryParse(dateChosen.toString());
        print("Check value parsedDate: $parsedDate");
        onBoardingTwoController.setDate(dateChosen);
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }
}
