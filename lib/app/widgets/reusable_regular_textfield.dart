import 'package:flutter/material.dart';
import 'package:heyva/constant/colors.dart';

class RegularTextField extends StatelessWidget {
  const RegularTextField({
    super.key,
    required this.controller,
    required this.isObsecure,
    required this.isError,
    required this.ontap,
    required this.hint,
    required this.isPassword,
    this.isNumber = false,
  });

  final TextEditingController controller;
  final bool isObsecure;
  final bool isError;
  final Function ontap;
  final String hint;
  final bool isNumber;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? isObsecure : false,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
          filled: true,
          fillColor: ColorApp.text_input_bg,
          hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorApp.grey_font),
          labelStyle: const TextStyle(
              fontSize: 16,
              color: ColorApp.black_font_underline,
              fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: ColorApp.text_input_bg,
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: ColorApp.red_error,
              width: 2.0,
            ),
          ),
          errorText: isError ? "error" : null,
          errorStyle: const TextStyle(fontSize: 0.01),
          suffixIcon: isPassword
              ? InkWell(
                  onTap: () {
                    ontap();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(
                          isObsecure ? "Show" : "Hide",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: ColorApp.black_font_underline),
                        ),
                      ),
                    ],
                  ),
                )
              : null),
    );
  }
}
