import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/in_app_web_view_controller.dart';

class InAppWebViewView extends GetView<InAppWebViewController> {
  const InAppWebViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 50,bottom: 20),
            child: const Header(rightText: "", showIcon: false)),
        Expanded(child: WebViewWidget(controller: controller.webviewC))
      ],
    ));
  }
}
