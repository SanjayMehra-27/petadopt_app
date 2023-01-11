import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeService extends GetxService {
  final _box = GetStorage();
  final _key = 'isDarkMode';
  final isDarkModeEnable = false.obs;

  @override
  onInit() {
    if (_box.read(_key) != null) {
      isDarkModeEnable.value = _box.read(_key);
      Get.changeThemeMode(
          !isDarkModeEnable.value ? ThemeMode.light : ThemeMode.dark);
    } else {
      _box.write(_key, false);
    }
    super.onInit();
  }

  /// Get isDarkMode info from local storage and return ThemeMode
  ThemeMode get theme =>
      isDarkModeEnable.isTrue ? ThemeMode.dark : ThemeMode.light;

  /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  /// Save isDarkMode to local storage
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  /// Switch theme and save to local storage
  void switchTheme() {
    isDarkModeEnable(!isDarkModeEnable.isTrue);
    _saveThemeToBox(isDarkModeEnable.isTrue);
    Get.changeThemeMode(
        isDarkModeEnable.isTrue ? ThemeMode.dark : ThemeMode.light);
  }
}
