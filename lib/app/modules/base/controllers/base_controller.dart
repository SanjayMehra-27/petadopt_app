import 'package:get/get.dart';

import '../../pets_history/controllers/pets_history_controller.dart';

class BaseController extends GetxController {
  final currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> onChangeTab(int value) async {
    currentIndex.value = value;
    // if tab is pet-history then updatethe list
    if (value == 1) {
      await Get.find<PetsHistoryController>().getAdoptedPets();
    }
  }
}
