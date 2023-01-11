import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petadopt_app/app/modules/pets_history/widgets/adopted_pet_tile.dart';
import '../controllers/pets_history_controller.dart';

class PetHistoryBuilder extends GetView<PetsHistoryController> {
  const PetHistoryBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 5),
      child: ListView.builder(
          itemCount: controller.adoptedPets.length,
          itemBuilder: (context, index) {
            return AdoptedPetTile(
              pet: controller.adoptedPets[index],
            );
          }),
    );
  }
}
