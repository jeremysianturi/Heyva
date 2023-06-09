import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/related_program/model/content_list_model.dart'
    as content;
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/keys.dart';
import 'package:html/parser.dart';

class RowItem extends StatelessWidget {
  const RowItem({
    super.key,
    required this.index,
    this.data,
  });

  final int index;
  final content.Data? data;

  @override
  Widget build(BuildContext context) {
    String parseHtmlString(String htmlString) {
      final document = parse(htmlString);
      final String? parsedString =
          parse(document.body?.text).documentElement?.text;

      return parsedString ?? "";
    }

    var desc = parseHtmlString(data?.contents?.body.toString() ?? "");

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
        var title = data?.contents?.title ?? "";
        if (data?.contentType?.name?.toLowerCase() == "program" &&
            title.toLowerCase().contains("breathin")) {
          var box = GetStorage();
          box.remove(Keys.programIdStorage);
          box.remove(Keys.programIdChildStorage);
          Get.toNamed(Routes.BREATHING_EXERCISE);
        }
        if (data?.contentType?.name?.toLowerCase() == "program" &&
            title.toLowerCase().contains("pelvic")) {
          Get.toNamed(Routes.BREATHING_ONE);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: index == 0 ? 20 : 16),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 104,
              height: 104,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(data?.contents?.thumbnail ?? ""),
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
                  ),
                  color: ColorApp.blue_container),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data?.contents?.title ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: ColorApp.blue_container),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/ic_article.svg",
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      Text(data?.contentType?.name ?? "",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: ColorApp.blue_container)),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
