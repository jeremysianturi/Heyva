import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../../constant/strings.dart';

class ArticleContainer extends StatelessWidget {
  const ArticleContainer({
    Key? key,
    required this.tag,
    required this.containerColor,
    required this.title,
    required this.tagIcon,
    required this.desc,
  }) : super(key: key);

  final Color containerColor;
  final String title;
  final String tag;
  final String tagIcon;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: containerColor,
              ),
              color: containerColor,
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
              color: ColorApp.black_font_underline),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          width: 70,
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
                    color: ColorApp.black_font_underline),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        SizedBox(
          width: 130,
          child: Text(
            desc,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: ColorApp.grey_font),
          ),
        ),
      ],
    );
  }
}
