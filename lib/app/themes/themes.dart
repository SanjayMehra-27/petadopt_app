import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    iconTheme: IconThemeData(color: Colors.black),
  );
  static final dark = ThemeData.dark().copyWith(
    iconTheme: IconThemeData(color: Colors.white),
  );
}
