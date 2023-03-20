import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../../constant/strings.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.rightText,
  }) : super(key: key);

  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(11),
              minimumSize: Size.zero,
              primary: ColorApp.white,
              elevation: 0
            ),
            child: const Icon(
              Icons.arrow_back,
              size: 18,
              color: ColorApp.black_arrow_back,
            ),
          ),
          Text(
            rightText,
            style: const TextStyle(
                color: ColorApp.black,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
