import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petadopt_app/app/custom/colors/custom_app_colors.dart';

import '../../../models/pet/pet_model.dart';
import '../../../widgets/custom_chip/custom_app_chip.dart';

class PetDetailCard extends StatelessWidget {
  const PetDetailCard({
    Key? key,
    required this.pet,
  }) : super(key: key);

  final Pet? pet;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: EdgeInsets.all(20),
              height: 140,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor, //? card color
                borderRadius: BorderRadius.all(Radius.circular(14)),
                boxShadow: [
                  BoxShadow(
                    color: Get.isDarkMode
                        ? Colors.grey[800]!
                        : Colors.white
                            .withOpacity(0.4), // changes position of shadow
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
                              fontSize: 24, fontWeight: FontWeight.bold)),
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
                        text: "${pet?.isMale == true ? 'Male' : 'Female'}",
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
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
    );
  }
}
