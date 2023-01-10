import 'package:get/get.dart';
import 'package:petadopt_app/app/models/pet/pet_model.dart';
import 'package:petadopt_app/app/repository/pet/pet_repository.dart';

class PetsHistoryController extends GetxController {
  PetRepository petRepository = PetRepository();
  final RxList<Pet> adoptedPets = <Pet>[].obs;
  @override
  void onInit() {
    super.onInit();
    getAdoptedPets();
  }

  // get adopted pets history
  Future<void> getAdoptedPets() async {
    try {
      adoptedPets.value = await petRepository.getAdoptedPets();
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong!",
      );
    }
    update(["adoptedPets"], true);
  }
}
