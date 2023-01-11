import 'package:get/get.dart';
import '../services/theme_service/theme_service.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ThemeService>(ThemeService(), permanent: true);
  }
}
