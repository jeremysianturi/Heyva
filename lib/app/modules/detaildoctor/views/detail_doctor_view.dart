import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import '../../../../constant/colors.dart';
import '../../../../constant/strings.dart';
import '../controllers/detail_doctor_controller.dart';

class DetailDoctorView extends GetView<DetailDoctorController> {
  DetailDoctorView({Key? key}) : super(key: key);
  final detailDoctorController = Get.put(DetailDoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        // height: 500,
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
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Wrap(
                                    spacing: 8,
                                    children: detailDoctorController.list
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    Strings.dr_name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorApp.black_font_underline,
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
                                            MaterialTapTargetSize.shrinkWrap,
                                        alignment: Alignment.centerRight),
                                    icon: const Icon(
                                      Icons.star_outlined,
                                      color: ColorApp.yellow_icon,
                                    ),
                                    label: const Text(
                                      Strings.four_point_five,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: ColorApp.black_font_underline),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    Strings.senopati,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: ColorApp.black_font_30),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    Strings.strip,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: ColorApp.black_font_30),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    Strings.south_jakarta,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: ColorApp.black_font_30),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: const [
                                  Flexible(
                                    child: ReadMoreText(
                                      Strings.dummy_doctordetail_text,
                                      trimLines: 4,
                                      colorClickableText: ColorApp.btn_orange,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText: '\n\nRead more',
                                      trimExpandedText: '\nRead less',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: ColorApp.black_font_underline),
                                      moreStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: ColorApp.btn_orange),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    Strings.select_schedule,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: ColorApp.black_font_underline),
                                  ),
                                  Container()
                                ],
                              )
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
    );
  }
}

Widget _buildChip(String label, Color color) {
  return Chip(
    labelPadding: EdgeInsets.all(2.0),
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
