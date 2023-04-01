import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/profile/privacy_policy/model/privacy_policy_model.dart';
import 'package:heyva/constant/colors.dart';

class PrivacyPolicyItem extends StatelessWidget {
  const PrivacyPolicyItem({
    super.key,
    required this.data,
    required this.index,
    required this.onChange,
  });

  final PrivacyPolicyModel data;
  final int index;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          margin: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              border: Border.all(color: ColorApp.btn_pink)),
          child: Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: ColorApp.white,
            ),
            child: ExpansionTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: ColorApp.btn_pink,
              collapsedBackgroundColor: ColorApp.btn_pink,
              onExpansionChanged: (value) {
                onChange();
              },
              iconColor: ColorApp.white,
              trailing: AnimatedRotation(
                turns: data.isSelected.isTrue ? .5 : 0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(
                  Icons.add,
                  color: ColorApp.white,
                ),
              ),
              tilePadding:
                  const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              title: Text(
                data.title,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              textColor: ColorApp.white,
              collapsedTextColor: ColorApp.white,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    color: ColorApp.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(9),
                        bottomRight: Radius.circular(9)),
                  ),
                  child: ListTile(
                    title: Text(data.subTitle),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
