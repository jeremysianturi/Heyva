import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/recomendation2_controller.dart';

class Recomendation2View extends GetView<Recomendation2Controller> {
  const Recomendation2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recomendation2View'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Recomendation2View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
