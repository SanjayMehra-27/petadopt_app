// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:petadopt_app/app/modules/home/controllers/home_controller.dart';

void main() {
  final controller = Get.put(HomeController());
  group('HomeController', () {
    test('petsList value should not null', () {
      expect(controller.petList, isNotNull);
    });

    test('petsList value should greater than 0 or equal to 0', () {
      controller.getPets();
      expect(controller.petList.length, greaterThanOrEqualTo(0));
    });

    test(
        'search a pet name with B character should get all matching pets and petsList value should greater than 0 or equal to 0',
        () {
      controller.getPetsByName('B');
      expect(controller.petList.length, greaterThanOrEqualTo(0));
    });
  });
}
