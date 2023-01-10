class Pet {
  final int id;
  final String name;
  final String age;
  final String price;
  final String image;
  final String? breedName;
  final bool isMale;
  final bool? isAdoptedAlready;

  Pet({
    required this.id,
    required this.name,
    required this.age,
    required this.price,
    required this.image,
    required this.isMale,
    this.breedName,
    this.isAdoptedAlready,
  });
}

// generate fake data
List<Pet> pets = [
  Pet(
    id: 1,
    name: 'Jenny',
    age: '6',
    price: '25000',
    image:
        'https://images.unsplash.com/photo-1602241628512-459cdd3234fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8R29sZGVuJTIwUmV0cmlldmVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    isMale: false,
    breedName: 'Golden Retriever',
    isAdoptedAlready: false,
  ),
  Pet(
    id: 2,
    name: 'Sassy',
    age: '6',
    price: '16000',
    image:
        'https://images.unsplash.com/photo-1586671267731-da2cf3ceeb80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bGFicmFkb3J8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    isMale: false,
    breedName: 'Labrador',
    isAdoptedAlready: false,
  ),
  Pet(
    id: 3,
    name: 'Bolt',
    age: '1',
    price: '8000',
    image:
        'https://images.unsplash.com/photo-1523626797181-8c5ae80d40c2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cHVnfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    isMale: true,
    breedName: 'Pug',
    isAdoptedAlready: false,
  ),
  Pet(
    id: 4,
    name: 'Hoffy',
    age: '2',
    price: '20000',
    image:
        'https://images.unsplash.com/photo-1536677412572-c277de11e458?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8RG9iZXJtYW58ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    isMale: true,
    breedName: 'Doberman',
    isAdoptedAlready: false,
  ),
  Pet(
    id: 5,
    name: 'Bella',
    age: '5',
    price: '7000',
    image:
        'https://images.unsplash.com/photo-1546447147-3fc2b8181a74?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    isMale: false,
    breedName: 'Pomeranian',
    isAdoptedAlready: false,
  ),
  Pet(
    id: 6,
    name: 'Lona',
    age: '8',
    price: '4000',
    image:
        'https://images.unsplash.com/photo-1553882809-a4f57e59501d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8R2VybWFuJTIwc2hlcGhlcmR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    isMale: true,
    breedName: 'German Shepherd',
    isAdoptedAlready: false,
  ),
  Pet(
    id: 7,
    name: 'Luna',
    age: '4',
    price: '30000',
    image:
        'https://images.unsplash.com/photo-1555596873-1916fae19257?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1112&q=80',
    isMale: false,
    breedName: 'Poodle',
    isAdoptedAlready: false,
  ),
  Pet(
    id: 8,
    name: 'Kitto',
    age: '14',
    price: '18000',
    image:
        'https://images.unsplash.com/photo-1521907554502-7440e4702fc3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8RnJlbmNoJTIwYnVsbGRvZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    isMale: false,
    breedName: 'French bulldog',
    isAdoptedAlready: false,
  ),
  Pet(
    id: 9,
    name: 'Lucky',
    age: '3',
    price: '10000',
    image:
        'https://images.unsplash.com/photo-1546447147-3fc2b8181a74?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    isMale: true,
    breedName: 'Pomeranian',
    isAdoptedAlready: false,
  ),
  Pet(
    id: 10,
    name: 'Luna',
    age: '4',
    price: '30000',
    image:
        'https://images.unsplash.com/photo-1555596873-1916fae19257?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1112&q=80',
    isMale: false,
    breedName: 'Poodle',
    isAdoptedAlready: false,
  ),
  Pet(
    id: 11,
    name: 'Kitto',
    age: '14',
    price: '18000',
    image:
        'https://images.unsplash.com/photo-1521907554502-7440e4702fc3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8RnJlbmNoJTIwYnVsbGRvZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    isMale: false,
    breedName: 'French bulldog',
    isAdoptedAlready: false,
  ),
  Pet(
    id: 9,
    name: 'Lucky',
    age: '3',
    price: '10000',
    image:
        'https://images.unsplash.com/photo-1546447147-3fc2b8181a74?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    isMale: true,
    breedName: 'Pomeranian',
    isAdoptedAlready: false,
  ),
  Pet(
    id: 10,
    name: 'Luna',
    age: '4',
    price: '30000',
    image:
        'https://images.unsplash.com/photo-1555596873-1916fae19257?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1112&q=80',
    isMale: false,
    breedName: 'Poodle',
    isAdoptedAlready: false,
  ),
  Pet(
    id: 11,
    name: 'Kitto',
    age: '14',
    price: '18000',
    image:
        'https://images.unsplash.com/photo-1521907554502-7440e4702fc3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8RnJlbmNoJTIwYnVsbGRvZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    isMale: false,
    breedName: 'French bulldog',
    isAdoptedAlready: false,
  ),
];
