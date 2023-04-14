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
                    child: SingleChildScrollView(
                      controller: controller.scrollController,
                      child: Column(
                        children: [
                          AppBar(
                            backgroundColor: ColorApp.white,
                            elevation: 0,
                            leading: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: IconButton(
                                  icon: const ImageIcon(
                                    AssetImage(
                                        "assets/images/ic_arrow_back.png"),
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

                            // FadeInImage.assetNetwork(
                            //   placeholder:
                            //       "assets/images/dummy_article_image.png",
                            //   image: controller.imgUrl,
                            //   fit: BoxFit.cover,
                            // ),

                            // Image.asset(
                            //   "assets/images/dummy_article_image.png",
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      spacing: 8,
                                      children: controller.tagsList
                                          .map(
                                            (e) => _buildChip(
                                                controller.tagsList[0].tag
                                                        ?.name ??
                                                    "",
                                                ColorApp.btn_pink),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
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
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      Strings.created_by,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: ColorApp.black_font_30),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      Strings.dr_name,
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
                                Html(data: controller.renderedBody),
                                // Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Image.asset(
                                //         "assets/images/dummy_article_one.png"),
                                //     const SizedBox(
                                //       height: 14,
                                //     ),
                                //     Image.asset(
                                //         "assets/images/dummy_article_two.png"),
                                //     const SizedBox(
                                //       height: 14,
                                //     ),
                                //     Image.asset(
                                //         "assets/images/dummy_article_three.png"),
                                //   ],
                                // ),
                                Row(
                                  children: [
                                    const Text(
                                      Strings.article_helpfull_ques,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: ColorApp.black_font_30),
                                    ),
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.thumb_up,
                                        color: ColorApp.yellow_icon,
                                      ),
                                      label: const Text(
                                        Strings.yes,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                ColorApp.blue_container),
                                      ),
                                    ),
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.thumb_down,
                                        color: ColorApp.yellow_icon,
                                      ),
                                      label: const Text(
                                        Strings.no,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                ColorApp.blue_container),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
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
