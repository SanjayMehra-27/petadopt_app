import 'package:get/get.dart';

import '../controllers/pet_details_controller.dart';

class PetDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PetDetailsController>(
      () => PetDetailsController(),
    );
  }
}
