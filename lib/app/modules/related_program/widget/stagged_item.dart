import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/related_program/model/content_list_model.dart'
    as content;
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/keys.dart';

class Staggered extends StatelessWidget {
  const Staggered({
    super.key,
    required this.index,
    required this.data,
  });

  final int index;
  final content.Data? data;

  @override
  Widget build(BuildContext context) {
    var desc = data?.contents?.body.toString() == "null"
        ? data?.contents?.body ?? ""
        : data?.contents?.body ?? "";
    return GestureDetector(
      onTap: () {
        if (data?.contentType?.name?.toLowerCase() == "video") {
          Get.toNamed(Routes.BREAST_FEEDING, arguments: {
            Keys.videoIdBreastFeedingArgumets: data?.contents?.id
          });
        }
        if (data?.contentType?.name?.toLowerCase() == "article") {
          Get.toNamed(Routes.ARTICLE,
              arguments: {Keys.contentIDArticleArguments: data?.contents?.id});
        }
      },
      child: Container(
          width: Get.width,
          margin: EdgeInsets.only(top: index == 0 ? 20 : 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width,
                height: index % 2 == 0 ? 200 : 100,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(data?.contents?.thumbnail ?? ""),
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
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
                        Text(data?.contentType?.name ?? "",
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: ColorApp.white)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                data?.contents?.title ?? "",
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: ColorApp.blue_container),
              ),
              const SizedBox(
                height: 10,
              ),
              desc.contains("<")
                  ? SizedBox(height: 30, child: Html(data: desc))
                  : Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Text(
                        desc,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: ColorApp.grey_font),
                        maxLines: 2,
                      ),
                    ),
            ],
          )),
    );
  }
}
