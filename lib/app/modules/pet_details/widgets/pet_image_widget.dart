import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/pet/pet_model.dart';
import '../../../widgets/full_image_viewer/full_image_viewer.dart';

class PetImageWidget extends StatelessWidget {
  const PetImageWidget({
    Key? key,
    required this.pet,
    required this.fromHistoryPage,
  }) : super(key: key);

  final Pet? pet;
  final bool? fromHistoryPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Get.to(
          () => FullImageViewer(
            imageUrl: pet?.image ?? "",
            title: pet?.name ?? "",
          ),
        );
      },
      child: InteractiveViewer(
        child: Hero(
          tag: fromHistoryPage == true ? "history-${pet?.id}" : pet!.id,
          flightShuttleBuilder: (flightContext, animation, flightDirection,
              fromHeroContext, toHeroContext) {
            final Hero toHero = toHeroContext.widget as Hero;
            return fromHistoryPage == true
                ? FadeTransition(
                    opacity: animation,
                    child: toHero.child,
                  )
                : RotationTransition(
                    turns: animation,
                    child: toHero.child,
                  );
          },
          child: Container(
            height: Get.height * 0.6,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(pet!.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
