import 'package:get/get.dart';
import 'package:petadopt_app/app/data/pets/pets_data_list.dart';
import 'package:petadopt_app/app/repository/pet/pet_repository.dart';

import '../../../models/pet/pet_model.dart';

class HomeController extends GetxController {
  final PetRepository petRepository = PetRepository();
  final RxList<Pet> petList = pets.obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getPets();
  }

  Future<void> getPets() async {
    petList.assignAll(await petRepository.getPets());
    update(["petsList"], true);
  }

  Future<void> getPetsByName(String name) async {
    try {
      isLoading.value = true;
      List<Pet> pets = await petRepository.getPetsByName(name);
      petList.assignAll(pets);
      update(["petsList"], true);
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong!",
      );
    } finally {
      isLoading.value = false;
    }
  }
}
