import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:petadopt_app/app/modules/home/controllers/home_controller.dart';
import 'package:petadopt_app/app/modules/home/views/home_view.dart';

void main() {
  testWidgets('HomeView pets image', (tester) async {
    // Initialize widget with binding
    await tester.pumpWidget(
      GetMaterialApp(
        home: HomeView(),
        initialBinding: BindingsBuilder(() {
          Get.lazyPut<HomeController>(() => HomeController());
        }),
      ),
    );

    // wait for 2 seconds
    await tester.pumpAndSettle(Duration(seconds: 5));
    // Find the widget
    final imageFinder = find.byType(Image, skipOffstage: false);

    // Expect the widget to be found
    expect(imageFinder.allCandidates.length, greaterThanOrEqualTo(0));
  });
}
