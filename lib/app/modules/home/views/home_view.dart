import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:petadopt_app/app/custom/colors/custom_app_colors.dart';
import 'package:petadopt_app/app/modules/pet_details/bindings/pet_details_binding.dart';
import '../../../models/pet/pet_model.dart';
import '../../../widgets/custom_chip/custom_app_chip.dart';
import '../../pet_details/views/pet_details_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SearchBar(),
          toolbarHeight: 100,
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: GetBuilder<HomeController>(
            assignId: true,
            init: controller,
            id: "petsList",
            builder: ((HomeController controller) => controller.petList.length >
                    0
                ? GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: Get.width / (Get.height / 1.9),
                    children: List.generate(controller.petList.length, (index) {
                      return PetCard(pet: controller.petList[index]);
                    }))
                : Center(
                    child: Text(
                      "No pets found!",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                    ),
                  ))));
  }
}

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
                    ? Colors.grey.withOpacity(0.2)
                    : null,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Image.network(
                      pet.image,
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
                          color: CustomAppColor.primaryColor,
                        )
                      ],
                    ),
                  )
                ],
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

class SearchBar extends GetView<HomeController> {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: TextFormField(
        onChanged: (value) async {
          await controller.getPetsByName(value);
        },
        decoration: InputDecoration(
          hintText: 'Search for pets by name',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Colors.grey[200],
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}
