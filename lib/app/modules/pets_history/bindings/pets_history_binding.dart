import 'package:get/get.dart';

import '../controllers/pets_history_controller.dart';

class PetsHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PetsHistoryController>(
      () => PetsHistoryController(),
    );
  }
}
