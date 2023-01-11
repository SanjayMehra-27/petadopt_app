import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petadopt_app/app/modules/pet_details/controllers/pet_details_controller.dart';

import '../../../custom/colors/custom_app_colors.dart';
import '../../../models/pet/pet_model.dart';

class AdoptMeButton extends GetView<PetDetailsController> {
  const AdoptMeButton({
    Key? key,
    required this.pet,
  }) : super(key: key);

  final Pet? pet;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        width: Get.width,
        child: Obx(() => ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: controller.isAlreadyAdopted.value ||
                      pet?.isAdoptedAlready == true
                  ? Colors.grey
                  : CustomAppColor.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            child: controller.isLoading.value
                ? Container(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Text(
                    controller.isAlreadyAdopted.value ||
                            pet?.isAdoptedAlready == true
                        ? "Already Adopted"
                        : "Adopt Me",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
            onPressed: () async =>
                await controller.onAdoptMeButtonPressed(pet))));
  }
}
