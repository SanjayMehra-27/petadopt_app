class Pet {
  final int id;
  final String name;
  final String age;
  final String price;
  final String image;
  final String? breedName;
  final int? weight;
  final String? description;
  final String? location;
  final bool isMale;
  bool? isAdoptedAlready;

  Pet({
    required this.id,
    required this.name,
    required this.age,
    required this.price,
    required this.image,
    required this.isMale,
    this.weight,
    this.description,
    this.location,
    this.breedName,
    this.isAdoptedAlready,
  });
}
