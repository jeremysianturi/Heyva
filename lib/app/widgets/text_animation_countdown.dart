import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';

import '../../constant/colors.dart';

class TextAnimationCountdown extends StatelessWidget {
  const TextAnimationCountdown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: DefaultTextStyle(
        // yang 1 2 3
        style: const TextStyle(
            fontSize: 70.0,
            fontFamily: 'Canterbury',
            color: ColorApp.black),
        child: AnimatedTextKit(
          animatedTexts: [
            ScaleAnimatedText("1"),
            ScaleAnimatedText("2"),
            ScaleAnimatedText("3"),
          ],
          onTap: () {},
        ),
      ),
    );
  }
}