import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:petadopt_app/app/modules/home/views/home_view.dart';
import 'package:petadopt_app/app/modules/pets_history/views/pets_history_view.dart';

import '../controllers/base_controller.dart';

class BaseView extends GetView<BaseController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => Container(
            height: 80,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 0,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              onTap: controller.onChangeTab,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 2.0,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: 'History',
                ),
              ],
              selectedItemColor:
                  Get.isDarkMode ? Colors.white : Colors.blue[900],
              selectedFontSize: 12,
              selectedIconTheme: IconThemeData(size: 35),
            ),
          ),
        ),
        body: Obx(
          () => IndexedStack(
            index: controller.currentIndex.value,
            children: [HomeView(), PetsHistoryView()],
          ),
        ),
      ),
    );
  }
}
