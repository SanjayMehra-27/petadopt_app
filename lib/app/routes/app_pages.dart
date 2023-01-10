import 'package:get/get.dart';

import '../modules/base/bindings/base_binding.dart';
import '../modules/base/views/base_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/pet_details/bindings/pet_details_binding.dart';
import '../modules/pet_details/views/pet_details_view.dart';
import '../modules/pets_history/bindings/pets_history_binding.dart';
import '../modules/pets_history/views/pets_history_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BASE;

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
    GetPage(
      name: _Paths.PETS_HISTORY,
      page: () => PetsHistoryView(),
      binding: PetsHistoryBinding(),
    ),
    GetPage(
      name: _Paths.BASE,
      page: () => BaseView(),
      binding: BaseBinding(),
    ),
  ];
}
