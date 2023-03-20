import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../controllers/learn_controller.dart';

class LearnView extends GetView<LearnController> {
  const LearnView(
      {Key? key,
        required this.menuScreenContext,
        required this.onScreenHideButtonPressed,
        this.hideStatus = false})
      : super(key: key);
  final BuildContext menuScreenContext;
  final VoidCallback onScreenHideButtonPressed;
  final bool hideStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [

        ],
      ),
    );
  }

}