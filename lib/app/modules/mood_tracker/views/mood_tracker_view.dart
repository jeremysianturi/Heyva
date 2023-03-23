import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mood_tracker_controller.dart';

class MoodTrackerView extends GetView<MoodTrackerController> {
  const MoodTrackerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoodTrackerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MoodTrackerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
