import '../../data/pets/pets_data_list.dart';
import '../../models/pet/pet_model.dart';

class PetRepository {
  // 1. Get pets list
  Future<List<Pet>> getPets() async {
    return await Future.delayed(Duration.zero, () => pets);
  }

  // 2. Get pet by id
  Future<Pet> getPetById(int id) async {
    return await Future.delayed(
        Duration(seconds: 2), () => pets.firstWhere((pet) => pet.id == id));
  }

  // 3. Get pets by name (search)
  Future<List<Pet>> getPetsByName(String name) async {
    return await Future.delayed(
        Duration(microseconds: 500),
        () => pets
            .where((pet) => pet.name.toLowerCase().contains(name.toLowerCase()))
            .toList());
  }

  // 4. Adopt Pet
  Future<bool> adoptPet(int id) async {
    bool isUpdated = false;
    await Future.delayed(Duration(milliseconds: 500), () {
      pets.firstWhere((pet) => pet.id == id)
        ..isAdoptedAlready = true
        ..adoptedDate = DateTime.now();
      isUpdated = true;
    });
    return isUpdated;
  }

  // 5. Get adopted pets list with chronological order
  Future<List<Pet>> getAdoptedPets() async {
    return await Future.delayed(
        Duration(milliseconds: 300),
        () => pets.where((pet) => pet.isAdoptedAlready == true).toList()
          ..sort((a, b) => b.adoptedDate!.compareTo(a.adoptedDate!)));
  }
}
