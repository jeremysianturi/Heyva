import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyva/app/modules/related_program/model/content_list_model.dart'
as content;
import 'package:heyva/constant/colors.dart';

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
    var desc = data?.contents?.body.toString() == "null"
        ? data?.contents?.renderedBody ?? ""
        : data?.contents?.body ?? "";
    return Container(
      margin: EdgeInsets.only(top: index == 0 ? 20 : 16),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              "https://i.pinimg.com/564x/14/a0/10/14a0109b597cee31ce9980b35f62f837.jpg",
              fit: BoxFit.fill,
              alignment: Alignment.centerLeft,
              width: 104,
              height: 104,
            ),
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
                      color: ColorApp.black_font_underline),
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
                            color: ColorApp.black_font_underline)),
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
    );
  }
}
