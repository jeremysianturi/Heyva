import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/detaildoctor/widget/select_schedule.dart';
import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:readmore/readmore.dart';

import '../../../../constant/colors.dart';
import '../../../../constant/strings.dart';
import '../controllers/detail_doctor_controller.dart';

class DetailDoctorView extends GetView<DetailDoctorController> {
  DetailDoctorView({Key? key}) : super(key: key);
  final detailDoctorController = Get.put(DetailDoctorController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var data = controller.detailDoctorResponse.value.data?[0];
      return LoadingOverlay(
          isLoading: controller.isLoading.value,
          color: Colors.grey,
          progressIndicator: const CircularProgressIndicator(
            color: ColorApp.btn_orange,
          ),
          opacity: 0.3,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: ColorApp.white,
                    elevation: 0,
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: IconButton(
                          icon: const ImageIcon(
                            AssetImage("assets/images/ic_arrow_back.png"),
                            color: ColorApp.black_arrow_back,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                    title: const Text(
                      Strings.article,
                      style: TextStyle(
                          color: ColorApp.black_article_title,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    centerTitle: false,
                  ),
                  Stack(
                    children: [
                      Row(
                        children: [
                          FittedBox(
                            child: Image.asset(
                              "assets/images/dummy_doctor_photo.png",
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 400),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorApp.white,
                                ),
                                color: ColorApp.white,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Wrap(
                                          spacing: 8,
                                          children: controller.listTag
                                              .map(
                                                (e) => _buildChip(
                                                    e.tag, ColorApp.btn_pink),
                                              )
                                              .toList(),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                         Text(
                                          data?.name ?? "",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color:
                                                ColorApp.black_font_underline,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextButton.icon(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              minimumSize: const Size(12, 12),
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              alignment: Alignment.centerRight),
                                          icon: const Icon(
                                            Icons.star_outlined,
                                            color: ColorApp.yellow_icon,
                                          ),
                                          label:  Text(
                                            data?.rate ?? "",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: ColorApp
                                                    .black_font_underline),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      data?.domicile ?? "",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: ColorApp.black_font_30),
                                    ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.start,
                                    //   children: const [
                                    //     Text(
                                    //       Strings.senopati,
                                    //       style: TextStyle(
                                    //           fontSize: 12,
                                    //           fontWeight: FontWeight.w400,
                                    //           color: ColorApp.black_font_30),
                                    //     ),
                                    //     SizedBox(
                                    //       width: 4,
                                    //     ),
                                    //     Text(
                                    //       Strings.strip,
                                    //       style: TextStyle(
                                    //           fontSize: 12,
                                    //           fontWeight: FontWeight.w600,
                                    //           color: ColorApp.black_font_30),
                                    //     ),
                                    //     SizedBox(
                                    //       width: 4,
                                    //     ),
                                    //     Text(
                                    //       Strings.south_jakarta,
                                    //       style: TextStyle(
                                    //           fontSize: 12,
                                    //           fontWeight: FontWeight.w600,
                                    //           color: ColorApp.black_font_30),
                                    //     ),
                                    //   ],
                                    // ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children:  [
                                        Flexible(
                                          child: ReadMoreText(
                                            data?.about ?? "",
                                            trimLines: 4,
                                            colorClickableText:
                                                ColorApp.btn_orange,
                                            trimMode: TrimMode.Line,
                                            trimCollapsedText: '\n\nRead more',
                                            trimExpandedText: '\nRead less',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: ColorApp
                                                    .black_font_underline),
                                            moreStyle: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: ColorApp.btn_orange),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SelectScheduleWidget(
                                      controller: controller,
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    const Text(
                                      Strings.service,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: ColorApp.black_font_underline,
                                          fontSize: 16),
                                    ),
                                    Obx(
                                      () => GridView.count(
                                        shrinkWrap: true,
                                        crossAxisCount: 2,
                                        childAspectRatio: 160 / 105,
                                        crossAxisSpacing: 12,
                                        mainAxisSpacing: 0,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        children: List.generate(
                                            controller.listService.length,
                                            (index) {
                                          var data =
                                              controller.listService[index];
                                          return ServiceWidget(
                                            imgUrl: data.imgUrl,
                                            isSelected: data.isSelected.value,
                                            title: data.title,
                                            index: index,
                                            ontap: () {
                                              controller.listService
                                                  .firstWhereOrNull((e) =>
                                                      e.isSelected.isTrue)
                                                  ?.isSelected
                                                  .value = false;

                                              controller.listService[index]
                                                  .isSelected.value = true;
                                            },
                                          );
                                        }),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 37,
                                    ),
                                    Obx(() => controller.buttonTitle != ""
                                        ? Container(
                                            alignment: Alignment.bottomCenter,
                                            child: OrangeButtonWTrailingIcon(
                                              padding: 0,
                                              determineAction:
                                                  "from_onplanning_one",
                                              text: controller.buttonTitle,
                                              ontap: () {},
                                            ),
                                          )
                                        : const SizedBox()),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ));
    });
  }
}

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.isSelected,
    required this.index,
    required this.ontap,
  });

  final String imgUrl, title;
  final bool isSelected;
  final int index;

  final Function ontap;

  Color get bg {
    if (index == 0 && !isSelected) {
      return ColorApp.btn_pink.withOpacity(0.5);
    }
    if (index == 0 && isSelected) {
      return ColorApp.btn_pink;
    }
    if (index == 1 && !isSelected) {
      return ColorApp.btn_maroon.withOpacity(0.5);
    }
    if (index == 1 && isSelected) {
      return ColorApp.btn_maroon;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            color: bg,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(imgUrl),
            SizedBox(
              width: Get.width,
              child: Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: ColorApp.white_font),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildChip(String label, Color color) {
  return Chip(
    labelPadding: const EdgeInsets.all(2.0),
    label: Text(
      label,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: color,
    elevation: 0,
    shadowColor: Colors.grey[60],
    padding: const EdgeInsets.all(8.0),
  );
}
