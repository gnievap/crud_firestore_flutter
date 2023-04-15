import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getPets() async{
  List pets = [];
  CollectionReference collectionReferencePets = db.collection('pets');

  //Recuperar los datos
  QuerySnapshot querySnapshot = await collectionReferencePets.get();
  for ( var documento in querySnapshot.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final pet = {
      'name'    : data['name'],
      'especie' : data['especie'],
      'petId'   : documento.id
    };
    pets.add(pet);
  }
  return pets;
}

Future<void> updatePet( String petId, String newName, String newSpecie) async {
  await db.collection('pets').doc(petId).set({'name': newName, 'especie': newSpecie});

}

// Guardar una nueva mascota en la base de datos
Future<void> addPet(String newPet, String newSpecie) async {
  await db.collection('pets').add({'name': newPet, 'especie': newSpecie});
  
}



// Ejemplo de la estructura de la colección pets
// {
//   'pets':[
//     {
//       'name': 'Blackie'
//     },
//     {
//       'name': 'Ginger'
//     },
//   ]
// }
