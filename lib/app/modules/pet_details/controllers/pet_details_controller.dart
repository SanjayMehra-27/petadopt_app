import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petadopt_app/app/models/pet/pet_model.dart';
import 'package:petadopt_app/app/modules/home/controllers/home_controller.dart';
import 'package:petadopt_app/app/repository/pet/pet_repository.dart';

class PetDetailsController extends GetxController {
  final PetRepository petRepository = PetRepository();
  late ConfettiController confettiController;
  final RxBool isAlreadyAdopted = false.obs;
  final RxBool isLoading = false.obs;
  @override
  void onInit() {
    confettiController =
        ConfettiController(duration: const Duration(seconds: 10));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> onAdoptMeButtonPressed(Pet? pet) async {
    if (isAlreadyAdopted.value || pet?.isAdoptedAlready == true) return;
    // update pets list | database | api for adopted pet
    try {
      isLoading.value = true;
      isAlreadyAdopted.value = await petRepository.adoptPet(pet?.id ?? 0);
      if (isAlreadyAdopted.value) {
        confettiController.play(); // show confetti
        isLoading.value = false;
        // success pop-up
        _openAdoptMeSuccessDialog(pet?.name);
        // update home page pets list
        final HomeController homeController = Get.find<HomeController>();
        await homeController.getPets();
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong!",
      );
    } finally {
      isLoading.value = false;
      // hide confetti
      Future.delayed(const Duration(seconds: 10), () {
        confettiController.stop();
      });
    }
  }

  void _openAdoptMeSuccessDialog(String? name) {
    Get.dialog(
      AlertDialog(
        title: Text("Thank you!"),
        content: Text("You've now adopted ${name}!"),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("OKAY"),
          ),
        ],
      ),
      barrierColor: Colors.black.withOpacity(0.1),
      barrierDismissible: true,
      useSafeArea: false,
    );
  }
}
