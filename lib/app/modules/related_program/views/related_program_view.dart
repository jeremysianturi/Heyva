import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/related_program/model/program_model.dart';
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
        body: SafeArea(
          child: Container(
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
                    margin: const EdgeInsets.only(top: 14),
                    child: const Header(
                        rightText: Strings.skip,
                        centerTitle: Strings.related_program,
                        showCenterTitle: true,
                        showIcon: true)),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 26,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.listProgram.length,
                    itemBuilder: (context, index) => ProgramTab(
                      index: index,
                      data: controller.listProgram[index],
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
                      const Text(
                        "18 Programs",
                        style: TextStyle(
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
                            margin:
                                EdgeInsets.only(top: 10, left: 20, right: 20),
                            child: MasonryGridView.count(
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 11,
                              crossAxisCount: 2,
                              itemCount: 10,
                              padding: EdgeInsets.zero,
                              itemBuilder: (BuildContext context, int index) {
                                return Staggered(index: index);
                              },
                            )),
                      )
                    : Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: List.generate(
                                20,
                                (index) => RowItem(
                                      index: index,
                                    )),
                          ),
                        ),
                      )
              ],
            ),
          ),
        )));
  }
}

class Staggered extends StatelessWidget {
  const Staggered({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        margin: EdgeInsets.only(top: index == 0 ? 20 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              height: index % 2 == 0 ? 200 : 100,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://png.pngtree.com/background/20210714/original/pngtree-solid-dark-blue-background-picture-image_1219005.jpg"),
                  fit: BoxFit.fill,
                  alignment: Alignment.centerLeft,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(child: SizedBox()),
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: ColorApp.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/ic_article.svg",
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      Text("Articles",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: ColorApp.white)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Managing anxiety",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: ColorApp.black_font_underline),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text("Etiam tristique urna pulvinar aliquet elit",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: ColorApp.grey_font)),
            ),
          ],
        ));
  }
}

class RowItem extends StatelessWidget {
  const RowItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: index == 0 ? 20 : 16),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              "https://i.pinimg.com/564x/14/a0/10/14a0109b597cee31ce9980b35f62f837.jpg",
              fit: BoxFit.fill,
              alignment: Alignment.centerLeft,
              width: 104,
              height: 104,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Managing anxiety",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: ColorApp.black_font_underline),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/ic_article.svg",
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Text("Articles",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: ColorApp.black_font_underline)),
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Text("Etiam tristique urna pulvinar aliquet elit",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: ColorApp.grey_font)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProgramTab extends StatelessWidget {
  const ProgramTab({
    super.key,
    required this.data,
    required this.index,
    required this.ontap,
  });

  final ProgramModel data;
  final int index;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        margin: EdgeInsets.only(left: index == 0 ? 20 : 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: data.isSelected.isTrue
                ? ColorApp.btn_orange
                : Colors.transparent),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Text(
          data.name,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: data.isSelected.isTrue
                  ? ColorApp.white
                  : ColorApp.grey_tab_title),
        ),
      ),
    );
  }
}
