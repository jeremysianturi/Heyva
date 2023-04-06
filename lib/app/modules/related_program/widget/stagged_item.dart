import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/related_program/model/content_list_model.dart'
as content;
import 'package:heyva/constant/colors.dart';

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
        ? data?.contents?.renderedBody ?? ""
        : data?.contents?.body ?? "";
    return Container(
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
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://png.pngtree.com/background/20210714/original/pngtree-solid-dark-blue-background-picture-image_1219005.jpg"),
                  fit: BoxFit.fill,
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
                  color: ColorApp.black_font_underline),
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
        ));
  }
}
