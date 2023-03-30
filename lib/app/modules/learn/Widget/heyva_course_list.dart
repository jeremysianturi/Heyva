import 'package:flutter/material.dart';
import 'package:heyva/app/modules/learn/Widget/pelvic_session_item.dart';
import 'package:heyva/constant/colors.dart';

class HeyvaCourseList extends StatelessWidget {
  const HeyvaCourseList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Heyva’s Course",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: ColorApp.homepage_name_color),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 180,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) => PelvicSessionItem(
              index: index,
            ),
          ),
        ),
      ],
    );
  }
}
