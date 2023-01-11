import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:petadopt_app/app/services/theme_service/theme_service.dart';
import '../controllers/home_controller.dart';
import '../widgets/pet_card.dart';
import '../widgets/search_bar.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await controller.getPets();
      },
      child: Scaffold(
          appBar: AppBar(
            title: SearchBar(),
            actions: [
              // switch theme icon
              GestureDetector(
                onTap: () {
                  Get.find<ThemeService>().switchTheme();
                },
                child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Get.isDarkMode
                          ? Icons.lightbulb_outline
                          : Icons.lightbulb,
                      color: IconTheme.of(context).color,
                    )),
              ),
            ],
            toolbarHeight: 100,
            elevation: 0,
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
            ),
          ),
          body: GetBuilder<HomeController>(
              assignId: true,
              init: controller,
              id: "petsList",
              builder: ((HomeController controller) =>
                  controller.petList.length > 0
                      ? GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                          key: PageStorageKey("petsList"),
                          children:
                              List.generate(controller.petList.length, (index) {
                            return PetCard(pet: controller.petList[index]);
                          }))
                      : Center(
                          child: Text(
                            "No pets found!",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w400),
                          ),
                        )))),
    );
  }
}
