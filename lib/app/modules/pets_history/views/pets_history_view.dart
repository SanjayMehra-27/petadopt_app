import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petadopt_app/app/widgets/not_found/not_found_widget.dart';
import '../controllers/pets_history_controller.dart';
import '../widgets/pet_history_builder.dart';

class PetsHistoryView extends GetView<PetsHistoryController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.dialog(
          AlertDialog(
            title: Text("Are you sure?"),
            content: Text("Do you want to exit the app?"),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("No"),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  Get.back();
                },
                child: Text("Yes"),
              ),
            ],
          ),
        );
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.4,
            title: Text(
              "Adopted Pets".toUpperCase(),
              style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).textTheme.bodyText1?.color ??
                      Colors.black),
            ),
            centerTitle: true,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              await controller.getAdoptedPets();
            },
            child: SafeArea(
              child: GetBuilder<PetsHistoryController>(
                  assignId: true,
                  init: controller,
                  id: "adoptedPets",
                  builder: ((PetsHistoryController controller) =>
                      controller.adoptedPets.length > 0
                          ? PetHistoryBuilder()
                          : NotFoundWidget(
                              title: "Ohh! You've not adopted any pet yet!",
                              style: TextStyle(fontSize: 18)))),
            ),
          )),
    );
  }
}
