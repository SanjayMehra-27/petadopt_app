import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/app_bindings/app_bindings.dart';
import 'app/routes/app_pages.dart';
import 'app/themes/themes.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
        title: "Pet Adoption App",
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        darkTheme: Themes.dark,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        initialBinding: AppBindings()),
  );
}
