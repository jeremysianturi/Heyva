import 'package:flutter/material.dart';

class Keyboard {
  static dismiss() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
