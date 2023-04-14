import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/keys.dart';

import '../../constant/colors.dart';

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
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: containerColor,
                ),
                color: containerColor,
                image: DecorationImage(
                    image: NetworkImage(thumbnailUrl), fit: BoxFit.cover),
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            height: 120,
            width: (MediaQuery.of(context).size.width - 51) / 2,
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
          Container(
            height: 30,
            width: Get.width,
            padding: const EdgeInsets.only(right: 20),
            child: desc.contains("<")
                ? Html(data: desc)
                : SizedBox(
                    width: Get.width,
                    child: Text(
                      desc,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorApp.grey_font),
                      maxLines: 2,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
