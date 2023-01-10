import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:petadopt_app/app/models/pet/pet_model.dart';
import 'package:intl/intl.dart';
import '../../pet_details/bindings/pet_details_binding.dart';
import '../../pet_details/views/pet_details_view.dart';
import '../controllers/pets_history_controller.dart';

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
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              "Adopted Pets",
              style: TextStyle(color: Colors.black),
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
                          ? Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(top: 5),
                              child: ListView.builder(
                                  itemCount: controller.adoptedPets.length,
                                  itemBuilder: (context, index) {
                                    return AdoptedPetTile(
                                      pet: controller.adoptedPets[index],
                                    );
                                  }),
                            )
                          : Center(
                              child: Text(
                                "No pets found!",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w400),
                              ),
                            ))),
            ),
          )),
    );
  }
}

class AdoptedPetTile extends StatelessWidget {
  final Pet pet;
  const AdoptedPetTile({
    Key? key,
    required this.pet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(pet.image),
          radius: 30,
        ),
        onTap: () {
          Get.to(() => PetDetailsView(pet: pet), binding: PetDetailsBinding());
        },
        title: Text(pet.name, style: TextStyle(fontSize: 20)),
        subtitle: Text(pet.breedName ?? '', style: TextStyle(fontSize: 15)),
        trailing: pet.adoptedDate != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Adopted at",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
                  SizedBox(height: 3),
                  Text(
                      "${DateFormat('MMM, dd hh:mm aa').format(pet.adoptedDate!)}",
                      style: TextStyle(fontSize: 15)),
                ],
              )
            : Text(''),
      ),
    );
  }
}
