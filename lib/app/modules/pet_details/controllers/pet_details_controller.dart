import 'package:confetti/confetti.dart';
import 'package:get/get.dart';

class PetDetailsController extends GetxController {
  late ConfettiController confettiController;
  @override
  void onInit() {
    confettiController =
        ConfettiController(duration: const Duration(seconds: 10));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  showConfetti() {
    // show confetti
    confettiController.play();
    // hide confetti after 3 seconds
    Future.delayed(Duration(seconds: 2), () {
      confettiController.stop();
    });
  }
}
