import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constant/colors.dart';
import '../../../../../constant/strings.dart';
import '../../../../widgets/reusable_header.dart';
import '../../../../widgets/reusable_orange_button_with_trailing_icon.dart';
import '../../../../widgets/reusable_switchbtn_group.dart';
import '../../controllers/turnon_notif/turnon_notif_controller.dart';

class TurnOnNotifView extends GetView<TurnOnNotifController> {
  TurnOnNotifView({Key? key}) : super(key: key);
  final turnOnController = Get.put(TurnOnNotifController());

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
            const Padding(
              padding: EdgeInsets.only(top: 67),
              child: Header(
                rightText: "",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  Strings.turn_on_notif_text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorApp.black_font_underline,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            Column(
              children: [
                ReusableSwitchButton(
                  controller: turnOnController,
                  title: Strings.we_care,
                  desc: Strings.proactive_support,
                  switchCount: 1,
                ),
                const SizedBox(height: 20,),
                ReusableSwitchButton(
                  controller: turnOnController,
                  title: Strings.you_first,
                  desc: Strings.exclusive_events_promotion,
                  switchCount: 2,
                ),
              ],
            ),
             OrangeButtonWTrailingIcon(
              determineAction: "from_turnon_notif",
              text: Strings.lets_go,
            ),
          ],
        ),
      ),
    );
  }
}
