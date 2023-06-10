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
import 'package:loading_overlay/loading_overlay.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/related_program_controller.dart';

class RelatedProgramView extends GetView<RelatedProgramController> {
  const RelatedProgramView({Key? key}) : super(key: key);

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
                  image: AssetImage("assets/images/bg_heyva.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: const Header(
                          rightText: "",
                          // rightText: Strings.skip,
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
                      controller: controller.scrollController,
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
                          "${controller.programCount} Programs",
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
                  const SizedBox(
                    height: 10,
                  ),
                  controller.switchbutton.isTrue
                      ? Expanded(
                          child: SmartRefresher(
                              header: const ClassicHeader(
                                canTwoLevelText: Strings.txtTwoLevel,
                                idleText: Strings.txtIdle,
                                refreshingText: Strings.txtRefreshing,
                              ),
                              enablePullDown: true,
                              enablePullUp: true,
                              controller: controller.staggertRefreshC,
                              onRefresh: () {
                                controller.onRefresh();
                              },
                              onLoading: () {
                                controller.onLoad();
                              },
                              footer: const ClassicFooter(
                                loadStyle: LoadStyle.ShowWhenLoading,
                              ),
                              child: MasonryGridView.count(
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 11,
                                crossAxisCount: 2,
                                itemCount: controller.listContent.length,
                                padding: const EdgeInsets.only(
                                    top: 10, left: 20, right: 20),
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  var data = controller.listContent[index];
                                  return Staggered(
                                    index: index,
                                    data: data,
                                  );
                                },
                              )),
                        )
                      : Expanded(
                          child: SmartRefresher(
                          header: const ClassicHeader(
                            canTwoLevelText: Strings.txtTwoLevel,
                            idleText: Strings.txtIdle,
                            refreshingText: Strings.txtRefreshing,
                          ),
                          enablePullDown: true,
                          enablePullUp: true,
                          controller: controller.refreshC,
                          onRefresh: () {
                            controller.onRefresh();
                          },
                          onLoading: () {
                            controller.onLoad();
                          },
                          footer: const ClassicFooter(
                            loadStyle: LoadStyle.ShowWhenLoading,
                          ),
                          child: ListView(
                            children: List.generate(
                                controller.listContent.length, (index) {
                              var data = controller.listContent[index];
                              return RowItem(
                                index: index,
                                data: data,
                              );
                            }),
                          ),
                        ))
                ],
              ),
            ))));
  }
}
