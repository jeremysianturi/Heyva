import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/coba.dart';

import '../../../../constant/colors.dart';
import '../../../../constant/strings.dart';
import '../controllers/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  ArticleView({Key? key}) : super(key: key);
  final articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Obx(
                  () => LinearProgressIndicator(
                value: articleController.percentage.value,
                backgroundColor: Colors.white,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  controller: articleController.scrollController,
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
                                // Navigator.of(context).pop();
                                Get.to(Coba());
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
                        child: Image.asset(
                          "assets/images/dummy_article_image.png",
                          fit: BoxFit.cover,
                        ),
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
                                  children: articleController.list
                                      .map(
                                        (e) => _buildChip(e.tag, ColorApp.btn_pink),
                                  )
                                      .toList(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: const [
                                Flexible(
                                  child: Text(
                                    Strings.tiga_nutrisi_ibu,
                                    style: TextStyle(
                                      color: ColorApp.black_font_underline,
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("assets/images/dummy_article_one.png"),
                                const SizedBox(
                                  height: 14,
                                ),
                                Image.asset("assets/images/dummy_article_two.png"),
                                const SizedBox(
                                  height: 14,
                                ),
                                Image.asset("assets/images/dummy_article_three.png"),
                              ],
                            ),
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
                                  icon: const Icon(Icons.thumb_up,color: ColorApp.yellow_icon,),
                                  label: const Text(
                                    Strings.yes,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: ColorApp.black_font_underline),
                                  ),
                                ),
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.thumb_down,color: ColorApp.yellow_icon,),
                                  label: const Text(
                                    Strings.no,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: ColorApp.black_font_underline),
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
