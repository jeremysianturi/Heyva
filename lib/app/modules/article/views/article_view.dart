import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../constant/colors.dart';
import '../../../../constant/strings.dart';
import '../controllers/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  ArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return LoadingOverlay(
          isLoading: controller.isLoading.value,
          color: Colors.grey,
          progressIndicator: const CircularProgressIndicator(
            color: ColorApp.btn_orange,
          ),
          opacity: 0.3,
          child: Scaffold(
            body: Center(
              child: Column(
                children: [
                  Obx(
                    () => LinearProgressIndicator(
                      value: controller.percentage.value,
                      backgroundColor: Colors.white,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
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
                                  // Get.to(Coba());
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
                        Expanded(
                          child: SingleChildScrollView(
                            controller: controller.scrollController,
                            child: Column(
                              children: [
                                Container(
                                  color: ColorApp.purple_article_dummy,
                                  width: MediaQuery.of(context).size.width,
                                  height: 320,
                                  child: controller.imgUrl != ""
                                      ? Image.network(
                                          controller.imgUrl,
                                          fit: BoxFit.cover,
                                        )
                                      : const SizedBox(),
                                ),
                                const SizedBox(
                                  height: 22,
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    SizedBox(
                                      height: 48,
                                      child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          children: [
                                            Wrap(
                                              spacing: 8,
                                              children: controller.tagsList
                                                  .asMap()
                                                  .map(
                                                    (i, element) => MapEntry(
                                                      i,
                                                      _buildChipCleaner(
                                                        element.tag?.name ?? "",
                                                        ColorApp.btn_pink,
                                                        i,
                                                        controller
                                                            .tagsList.length,
                                                      ),
                                                    ),
                                                  )
                                                  .values
                                                  .toList(),
                                            )
                                          ]),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              controller.title,
                                              style: const TextStyle(
                                                color: ColorApp.blue_container,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            Strings.created_by,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: ColorApp.black_font_30),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            controller.creator,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: ColorApp.black_font_30),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Html(
                                        data: controller.renderedBody,
                                        style: {
                                          "body": Style(
                                              // fontSize: FontSize(12.0),
                                              ),
                                        },
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: EdgeInsets.symmetric(horizontal: 20),
                                    //   child: Row(
                                    //     children: [
                                    //       const Text(
                                    //         Strings.article_helpfull_ques,
                                    //         style: TextStyle(
                                    //             fontSize: 14,
                                    //             fontWeight: FontWeight.w400,
                                    //             color: ColorApp.black_font_30),
                                    //       ),
                                    //       TextButton.icon(
                                    //         onPressed: () {},
                                    //         icon: const Icon(
                                    //           Icons.thumb_up,
                                    //           color: ColorApp.yellow_icon,
                                    //         ),
                                    //         label: const Text(
                                    //           Strings.yes,
                                    //           style: TextStyle(
                                    //               fontSize: 14,
                                    //               fontWeight: FontWeight.w600,
                                    //               color: ColorApp.blue_container),
                                    //         ),
                                    //       ),
                                    //       TextButton.icon(
                                    //         onPressed: () {},
                                    //         icon: const Icon(
                                    //           Icons.thumb_down,
                                    //           color: ColorApp.yellow_icon,
                                    //         ),
                                    //         label: const Text(
                                    //           Strings.no,
                                    //           style: TextStyle(
                                    //               fontSize: 14,
                                    //               fontWeight: FontWeight.w600,
                                    //               color: ColorApp.blue_container),
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}

Widget _buildChipCleaner(String label, Color color, int index, int? listSize) {
  if (listSize != 0) {
    return Padding(
      // padding: const EdgeInsets.only(left: 20),
      padding: setPadding(index, listSize!),
      child: Chip(
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
      ),
    );
  } else
    return Container();
}

EdgeInsets setPadding(int index, int listSize) {
  if (index == 0) {
    return const EdgeInsets.only(left: 20);
  } else if (index == (listSize - 1)) {
    return const EdgeInsets.only(right: 20);
  } else {
    return const EdgeInsets.only(right: 0);
  }
}
