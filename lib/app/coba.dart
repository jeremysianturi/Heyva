import 'dart:developer';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:heyva/app/widgets/text_animation_countdown.dart';
import 'package:timelines/timelines.dart';
import '../constant/colors.dart';
import '../constant/strings.dart';

class Coba extends StatefulWidget {
  const Coba({Key? key}) : super(key: key);

  @override
  State<Coba> createState() => _CobaState();
}

class _CobaState extends State<Coba> {
  var percentage = 0.0;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      setState(() {
        percentage = scrollController.position.pixels / scrollController.position.maxScrollExtent;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scrollbar Article"),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: percentage,
            backgroundColor: Colors.white,
            color: Colors.black,
          ),
          Expanded(child: SingleChildScrollView(
            controller: scrollController,
            child:
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ...content.map((e) => Text(e,style: Theme.of(context).textTheme.headlineMedium,)).toList()
            //   ],
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/dummy_article_one.png"),
                const SizedBox(height: 14,),
                Image.asset("assets/images/dummy_article_two.png"),
                const SizedBox(height: 14,),
                Image.asset("assets/images/dummy_article_three.png"),
                const TextAnimationCountdown()
              ],
            ),
          ),),
        ],
      ),
    );
  }
}