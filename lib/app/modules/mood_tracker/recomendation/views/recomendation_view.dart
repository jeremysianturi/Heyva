import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../controllers/recomendation_controller.dart';

class RecomendationView extends GetView<RecomendationController> {
  const RecomendationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => LoadingOverlay(
        isLoading: controller.isLoading.value,
        color: Colors.grey,
        progressIndicator: const CircularProgressIndicator(
          color: ColorApp.btn_orange,
        ),
        opacity: 0.3,
        child: SafeArea(
          child: Scaffold(
            body: Container(
              height: Get.height,
              width: Get.width,
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
                          showCenterTitle: true,
                          centerTitle: Strings.recomendation,
                          rightText: Strings.skip,
                          showIcon: false)),
                  const SizedBox(
                    height: 24,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      Strings.recomendationSelftCare,
                      style: TextStyle(
                          color: ColorApp.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Obx(() {
                    var data = controller.recomendationList[0].jsonContent;
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: data?.length ?? 0,
                        itemBuilder: (context, index) {
                          var item = data?[index];
                          return GestureDetector(
                            onTap: () {
                              controller.recomendationList[0].jsonContent
                                  ?.firstWhereOrNull(
                                      (e) => e.isSelected == true)
                                  ?.isSelected = false;
                              controller.recomendationList[0]
                                      .jsonContent?[index].isSelected =
                                  !controller.recomendationList[0]
                                      .jsonContent![index].isSelected;
                              controller.recomendationList.refresh();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(
                                          item?.isSelected == true ? 1 : 0.2),
                                      BlendMode.dstATop),
                                  image: AssetImage(
                                    index == 0
                                        ? "assets/images/recommend.png"
                                        : index == 1
                                            ? "assets/images/recommend-1.png"
                                            : index == 2
                                                ? "assets/images/recommend-2.png"
                                                : "assets/images/recommend-3.png",
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  item?.name ?? "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: ColorApp.white),
                                ),
                              ),
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 162 / 120,
                                crossAxisSpacing: 11,
                                mainAxisSpacing: 10),
                      ),
                    );
                  }),
                  Expanded(child: Container()),
                  if (controller.isShowButton)
                    OrangeButtonWTrailingIcon(
                      determineAction: "ontap",
                      text: Strings.lets_go,
                      ontap: () {
                        // Get.toNamed(Routes.RECOMENDATION2);
                        controller.generateRawJson();
                      },
                    )
                ],
              ),
            ),
          ),
        )));
  }
}
