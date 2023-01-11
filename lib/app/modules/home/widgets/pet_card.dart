import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petadopt_app/app/custom/colors/custom_app_colors.dart';

import '../../../models/pet/pet_model.dart';
import '../../../widgets/custom_chip/custom_app_chip.dart';
import '../../pet_details/bindings/pet_details_binding.dart';
import '../../pet_details/views/pet_details_view.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  const PetCard({
    Key? key,
    required this.pet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => PetDetailsView(pet: pet), binding: PetDetailsBinding());
      },
      child: Stack(
        children: [
          Container(
              margin: EdgeInsets.all(10),
              clipBehavior: Clip.hardEdge,
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: pet.isAdoptedAlready == true
                    ? Get.isDarkMode == true
                        ? Colors.black.withOpacity(0.5)
                        : Colors.white.withOpacity(0.4)
                    : null,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Hero(
                      tag: pet.id,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Image.network(
                          pet.image,
                          semanticLabel: "Pet Image",
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 120,
                              width: double.infinity,
                              color: Colors.grey[200],
                              child: Center(
                                child: Text(
                                  "Image not found",
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${pet.name}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text("(${pet.breedName})",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.grey[400])),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          CustomAppChip(
                            text:
                                "${pet.isMale ? 'Male' : 'Female'}, ${pet.age} yrs",
                            color: Get.isDarkMode
                                ? Colors.white
                                : CustomAppColor.primaryColor,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
          pet.isAdoptedAlready == true
              ? Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Adopted",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
