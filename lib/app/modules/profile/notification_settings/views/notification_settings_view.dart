import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_settings_controller.dart';

class NotificationSettingsView extends GetView<NotificationSettingsController> {
  const NotificationSettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotificationSettingsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NotificationSettingsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
