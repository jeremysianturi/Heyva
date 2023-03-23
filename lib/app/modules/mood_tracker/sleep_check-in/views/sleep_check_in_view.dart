import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sleep_check_in_controller.dart';

class SleepCheckInView extends GetView<SleepCheckInController> {
  const SleepCheckInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SleepCheckInView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SleepCheckInView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
