import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:petadopt_app/app/widgets/full_image_viewer/full_image_viewer.dart';
import '../../../models/pet/pet_model.dart';
import '../controllers/pet_details_controller.dart';
import '../widgets/adopt_me_button.dart';
import '../widgets/pet_detail_card.dart';
import '../widgets/pet_image_widget.dart';
import '../widgets/square_icon_widget.dart';

class PetDetailsView extends GetView<PetDetailsController> {
  final Pet? pet;
  final bool? fromHistoryPage;
  const PetDetailsView({Key? key, this.pet, this.fromHistoryPage = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConfettiWidget(
      confettiController: controller.confettiController,
      blastDirectionality: BlastDirectionality.explosive,
      numberOfParticles: 250,
      shouldLoop: true,
      blastDirection: 50,
      child: Stack(
        children: [
          if (pet != null)
            //? Pet Image
            Positioned(
              top: 0,
              left: 0,
              child: PetImageWidget(pet: pet, fromHistoryPage: fromHistoryPage),
            ),
          //? Pet Details Card
          if (pet != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: PetDetailCard(pet: pet),
            ),
          //? Adopt Me button on bottom center
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: AdoptMeButton(pet: pet),
          ),
          //? Back button on top left
          Positioned(
            top: 40,
            left: 20,
            child: SquareIconWidget(
              icon: Icons.arrow_back,
              onTab: () => Get.back(),
            ),
          ),
          //? Full image icon on top right
          if (pet != null)
            Positioned(
              top: 40,
              right: 20,
              child: SquareIconWidget(
                icon: Icons.fullscreen,
                onTab: () => Get.to(
                  () => FullImageViewer(
                    imageUrl: pet?.image ?? "",
                    title: pet?.name,
                  ),
                ),
              ),
            ),
        ],
      ),
    ));
  }
}
