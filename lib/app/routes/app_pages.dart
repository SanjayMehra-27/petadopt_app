import 'package:get/get.dart';

import '../modules/pet_details/bindings/pet_details_binding.dart';
import '../modules/pet_details/views/pet_details_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PET_DETAILS,
      page: () => PetDetailsView(),
      binding: PetDetailsBinding(),
    ),
  ];
}
