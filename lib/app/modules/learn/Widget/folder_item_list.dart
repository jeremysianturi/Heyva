import 'package:flutter/material.dart';
import 'package:heyva/app/modules/learn/Widget/folder_item.dart';

import '../controllers/learn_controller.dart';

class FolderItemList extends StatelessWidget {
  const FolderItemList({
    super.key,
    required this.controller,
  });

  final LearnController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 162 / 60,
      crossAxisSpacing: 11,
      mainAxisSpacing: 12,
      children: List.generate(controller.folderList.length, (index) {
        return Container(
            child: FolderItem(
              title: controller.folderList[index],
            ));
      }),
    );
  }
}
