import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/variabels.dart';

import '../../constant/colors.dart';

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

class ArticleContainer extends StatelessWidget {
  const ArticleContainer({
    Key? key,
    required this.tag,
    required this.containerColor,
    required this.title,
    required this.tagIcon,
    required this.desc,
    required this.contentId,
    required this.contentType,
    required this.thumbnailUrl,
  }) : super(key: key);

  final Color containerColor;
  final String title;
  final String tag;
  final String tagIcon;
  final String desc;
  final String contentId;
  final String contentType;
  final String thumbnailUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (contentType.toLowerCase() == "video") {
          Get.toNamed(Routes.BREAST_FEEDING,
              arguments: {Keys.videoIdBreastFeedingArgumets: contentId});
        }
        if (contentType.toLowerCase() == "article") {
          Get.toNamed(Routes.ARTICLE,
              arguments: {Keys.contentIDArticleArguments: contentId});
        }
        if (contentType.toLowerCase() == "program" &&
            title.toLowerCase().contains("breathin")) {
          var box = GetStorage();
          box.remove(Keys.programIdStorage);
          box.remove(Keys.programIdChildStorage);
          Get.toNamed(Routes.BREATHING_EXERCISE);
        }
        if (contentType.toLowerCase() == "program" &&
            title.toLowerCase().contains("pelvic")) {
          Get.toNamed(Routes.BREATHING_ONE);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: dyW(162) / dyH(121),
            child: Container(
              width: Get.width,
              height: Get.height,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: containerColor,
                  ),
                  color: containerColor,
                  image: DecorationImage(
                      image: NetworkImage(thumbnailUrl), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              alignment: Alignment.topRight,
              child: RawMaterialButton(
                constraints: BoxConstraints.tight(const Size(24, 24)),
                padding: EdgeInsets.zero,
                onPressed: () {},
                elevation: 0,
                fillColor: ColorApp.txt_white,
                shape: const CircleBorder(),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Image.asset("assets/images/ic_bookmark.png"),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: ColorApp.blue_container),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            // width: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Image.asset(tagIcon),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                ),
                Text(
                  tag,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ColorApp.blue_container),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
              width: Get.width,
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                removeAllHtmlTags(desc),
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ColorApp.grey_font),
                maxLines: 10000,
              ),
            ),
          )
        ],
      ),
    );
  }
}
