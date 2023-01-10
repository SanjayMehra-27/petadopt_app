import 'package:get/get.dart';
import 'package:petadopt_app/app/modules/home/controllers/home_controller.dart';
import 'package:petadopt_app/app/modules/pets_history/controllers/pets_history_controller.dart';

import '../controllers/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(
      () => BaseController(),
    );
    Get.put(HomeController(), permanent: true);
    Get.put(PetsHistoryController(), permanent: true);
  }
}
