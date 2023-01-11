import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/pet/pet_model.dart';
import '../../pet_details/bindings/pet_details_binding.dart';
import '../../pet_details/views/pet_details_view.dart';

class AdoptedPetTile extends StatelessWidget {
  final Pet pet;
  const AdoptedPetTile({
    Key? key,
    required this.pet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: Hero(
          tag: "history-${pet.id}",
          child: CircleAvatar(
            backgroundImage: NetworkImage(pet.image),
            radius: 30,
          ),
        ),
        onTap: () {
          Get.to(
              () => PetDetailsView(
                    pet: pet,
                    fromHistoryPage: true,
                  ),
              binding: PetDetailsBinding());
        },
        title: Text(pet.name, style: TextStyle(fontSize: 20)),
        subtitle: Text(pet.breedName ?? '', style: TextStyle(fontSize: 15)),
        trailing: pet.adoptedDate != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Adopted at",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
                  SizedBox(height: 3),
                  Text(
                      "${DateFormat('MMM, dd hh:mm aa').format(pet.adoptedDate!)}",
                      style: TextStyle(fontSize: 15)),
                ],
              )
            : Text(''),
      ),
    );
  }
}
