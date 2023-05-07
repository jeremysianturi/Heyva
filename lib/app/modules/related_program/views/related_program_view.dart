import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/related_program/widget/program_tab.dart';
import 'package:heyva/app/modules/related_program/widget/row_item.dart';
import 'package:heyva/app/modules/related_program/widget/stagged_item.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

import '../controllers/related_program_controller.dart';

class RelatedProgramView extends GetView<RelatedProgramController> {
  const RelatedProgramView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: Get.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_heyva.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: const Header(
                      rightText: Strings.skip,
                      centerTitle: Strings.related_program,
                      showCenterTitle: true,
                      showIcon: true)),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 30,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.tagList.length,
                  itemBuilder: (context, index) => ProgramTab(
                    index: index,
                    data: controller.tagList[index],
                    ontap: () {
                      controller.ontapProgramsTab(index: index);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${controller.programLength} Programs",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: ColorApp.black_article_title),
                    ),
                    FlutterSwitch(
                      width: 56.0,
                      height: 31.0,
                      toggleSize: 28.0,
                      value: controller.switchbutton.value,
                      borderRadius: 15.0,
                      padding: 1.5,
                      activeToggleColor: ColorApp.white,
                      inactiveToggleColor: ColorApp.white,
                      activeColor: ColorApp.btn_pink,
                      inactiveColor: ColorApp.btn_pink,
                      activeIcon: Container(
                        margin: const EdgeInsets.only(
                            left: 5, right: 3, top: 5, bottom: 3),
                        child: Center(
                            child: SvgPicture.asset(
                          "assets/icons/ic_square_float.svg",
                          color: Colors.black,
                        )),
                      ),
                      inactiveIcon: Center(
                          child: SvgPicture.asset(
                        "assets/icons/ic_list.svg",
                        color: Colors.black,
                      )),
                      onToggle: (val) {
                        controller.switchbutton.value = val;
                      },
                    ),
                  ],
                ),
              ),
              controller.switchbutton.isTrue
                  ? Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          child: MasonryGridView.count(
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 11,
                            crossAxisCount: 2,
                            itemCount: controller.programLength,
                            padding: EdgeInsets.zero,
                            itemBuilder: (BuildContext context, int index) {
                              var data = controller
                                  .contentListResponse.value.data?[index];
                              return Staggered(
                                index: index,
                                data: data,
                              );
                            },
                          )),
                    )
                  : Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(controller.programLength,
                              (index) {
                            var data = controller
                                .contentListResponse.value.data?[index];
                            return RowItem(
                              index: index,
                              data: data,
                            );
                          }),
                        ),
                      ),
                    )
            ],
          ),
        )));
  }
}
