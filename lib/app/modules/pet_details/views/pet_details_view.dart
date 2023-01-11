import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:petadopt_app/app/custom/colors/custom_app_colors.dart';
import 'package:petadopt_app/app/widgets/full_image_viewer/full_image_viewer.dart';
import '../../../models/pet/pet_model.dart';
import '../../../widgets/custom_chip/custom_app_chip.dart';
import '../controllers/pet_details_controller.dart';

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
            Positioned(
              top: 0,
              left: 0,
              child: GestureDetector(
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
                    tag: fromHistoryPage == true
                        ? "history-${pet?.id}"
                        : pet!.id,
                    flightShuttleBuilder: (flightContext, animation,
                        flightDirection, fromHeroContext, toHeroContext) {
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
              ),
            ),
          // create top rounded card
          if (pet != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: Get.height * 0.45,
                width: Get.width,
                child: Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  color: Get.isDarkMode ? Colors.grey[900] : Color(0xFFF0F0F0),
                  elevation: 2.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        padding: EdgeInsets.all(20),
                        height: 140,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .scaffoldBackgroundColor, //? card color
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          boxShadow: [
                            BoxShadow(
                              color: Get.isDarkMode
                                  ? Colors.grey[800]!
                                  : Colors.white.withOpacity(
                                      0.4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            //? pet name and breed
                            Row(
                              children: [
                                Text(pet?.name ?? "",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(width: 10),
                                Text("(${pet?.breedName})",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[400],
                                      fontStyle: FontStyle.italic,
                                    )),
                                Spacer(),
                                Container(
                                  child: Text("₹ ${pet?.price}",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            //? Gender, age and weight
                            Row(
                              children: [
                                CustomAppChip(
                                  text:
                                      "${pet?.isMale == true ? 'Male' : 'Female'}",
                                  color: CustomAppColor.successColor,
                                ),
                                SizedBox(width: 10),
                                CustomAppChip(
                                  text: "${pet?.age} years old",
                                  color: CustomAppColor.primaryColor,
                                ),
                                SizedBox(width: 10),
                                CustomAppChip(
                                  text: "${pet?.weight} kg",
                                  color: CustomAppColor.warningColor,
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            //? Location
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.redAccent,
                                ),
                                SizedBox(width: 10),
                                Text(pet?.location ?? "",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //? Description
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "What's special about ${pet?.name}?",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              pet?.description ?? "",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          // create back button on top left
          Positioned(
            top: 40,
            left: 20,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Align(
                alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Get.back(),
                ),
              ),
            ),
          ),
          // create Adopt Me button on bottom center
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Obx(() => Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                width: Get.width,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: controller.isAlreadyAdopted.value ||
                              pet?.isAdoptedAlready == true
                          ? Colors.grey
                          : CustomAppColor.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? Container(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            controller.isAlreadyAdopted.value ||
                                    pet?.isAdoptedAlready == true
                                ? "Already Adopted"
                                : "Adopt Me",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                    onPressed: () async =>
                        await controller.onAdoptMeButtonPressed(pet)))),
          ),
          //? view full image icon on top right
          if (pet != null)
            Positioned(
              top: 40,
              right: 20,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(Icons.fullscreen),
                    onPressed: () => Get.to(
                      () => FullImageViewer(
                        imageUrl: pet?.image ?? "",
                        title: pet?.name,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    ));
  }
}
