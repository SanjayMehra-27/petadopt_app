// generate fake data
import 'package:petadopt_app/app/models/pet/pet_model.dart';

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
    weight: 30,
    location: 'Kathmandu',
    description:
        'Jenny, likes to eat a lot and is very playful. She is a very good dog and is very friendly with kids. She is very active and loves to play with other dogs.',
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
      weight: 20,
      location: "Jaipur",
      description:
          "Your Labrador puppy's diet should be based around a high quality, nutritionally complete puppy food. You may also wish to introduce them to fresh, lean raw meat"),
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
    weight: 10,
    location: 'Bangalore',
    description:
        'Pugs are very affectionate and loyal dogs. They are very playful and love to be around people. They are very intelligent and can be trained easily. They are very good with children and other pets.',
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
      weight: 40,
      location: 'Indore',
      description:
          "Dobermans love to use their brains, so giving them a job to do like agility or scent work will make your Dobie very happy. It will also keep him mentally healthy and less likely to be destructive."),
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
    weight: 5,
    location: 'Mumbai',
    description:
        'Pomeranians are very playful and energetic dogs. They are very intelligent and can be trained easily. They are very good with children and other pets.',
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
    weight: 30,
    location: 'Delhi',
    description:
        'German Shepherds are very loyal and protective dogs. They are very intelligent and can be trained easily. They are very good with children and other pets.',
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
      weight: 14,
      location: "Kolkata",
      description:
          "Taking a cue from their history as duck hunters, Poodle owners should give their dogs lots of exercise. They're excellent retrievers and enjoy a good game of fetch, as well as jogging and long walks. As superb water dogs, swimming is another great option."),
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
    weight: 20,
    location: 'Chennai',
    description:
        'French Bulldogs are very affectionate and loyal dogs. They are very playful and love to be around people. They are very intelligent and can be trained easily. They are very good with children and other pets.',
  ),
  Pet(
      id: 9,
      name: 'Lucky',
      age: '3',
      price: '10000',
      image:
          'https://images.unsplash.com/photo-1587402092301-725e37c70fd8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
      isMale: true,
      breedName: 'Pomeranian',
      isAdoptedAlready: false,
      weight: 5,
      location: "Vadodara",
      description:
          "These dogs are typically very active and love to bark. Giving them chew toys or treat-filled puzzle toys can help focus their energy and quiet them down. Make sure they exercise"),
  Pet(
    id: 10,
    name: 'Tiger',
    age: '10',
    price: '20000',
    image:
        'https://images.unsplash.com/photo-1568564321589-3e581d074f9b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    isMale: true,
    breedName: 'Alaskan Malamute',
    isAdoptedAlready: false,
    weight: 30,
    location: 'Jammu',
    description:
        'Alaskan Malamutes are very loyal and protective dogs. They are very intelligent and can be trained easily. They are very good with children and other pets.',
  ),
  Pet(
    id: 11,
    name: 'Ginu',
    age: '8',
    price: '12000',
    image:
        'https://images.unsplash.com/photo-1588269845464-8993565cac3a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8QWZnaGFuJTIwSG91bmR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    isMale: false,
    breedName: 'Afghan Hound',
    isAdoptedAlready: false,
    weight: 20,
    location: 'Kolkata',
    description:
        'Afghan Hounds are very affectionate and loyal dogs. They are very playful and love to be around people. They are very intelligent and can be trained easily. They are very good with children and other pets.',
  ),
  Pet(
    id: 12,
    name: 'Chameli',
    age: '5',
    price: '6000',
    image:
        'https://images.unsplash.com/photo-1576179737106-6516b006362b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    isMale: false,
    breedName: 'Chow Chow',
    isAdoptedAlready: false,
    weight: 10,
    location: 'Pune',
    description:
        "The Chow Chow is a spitz-type of dog breed originally from northern China. The Chow Chow is a sturdily built dog, square in profile, with a broad skull.",
  ),
];
