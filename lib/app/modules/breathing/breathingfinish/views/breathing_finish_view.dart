import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:heyva/app/widgets/nav_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../../constant/colors.dart';
import '../../../../../constant/strings.dart';
import '../controllers/breathing_finish_controller.dart';

class BreathingFinishView extends GetView<BreathingFinishController> {
  const BreathingFinishView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        color: ColorApp.btn_pink,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    GestureDetector(
                      onTap: (){
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: NavScreen(
                            menuScreenContext: context,
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 67),
                        child: Text(
                          Strings.done,
                          style: TextStyle(
                              color: ColorApp.txt_white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      Strings.remember_blue_sky,
                      style: TextStyle(
                          color: ColorApp.txt_white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Container(),
              ]),
        ),
      ),
    );
  }
}

