import 'package:flutter/material.dart';
import 'package:heyva/app/modules/related_program/model/tags_model.dart'
    as tags;
import 'package:heyva/constant/colors.dart';

class ProgramTab extends StatelessWidget {
  const ProgramTab({
    super.key,
    required this.data,
    required this.index,
    required this.ontap,
  });

  final tags.Data? data;
  final int index;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        margin: EdgeInsets.only(left: index == 0 ? 20 : 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: data?.isSelected == true
                ? ColorApp.btn_orange
                : Colors.transparent),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Text(
          data?.name ?? "",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: data?.isSelected == true
                  ? ColorApp.white
                  : ColorApp.grey_tab_title),
        ),
      ),
    );
  }
}
