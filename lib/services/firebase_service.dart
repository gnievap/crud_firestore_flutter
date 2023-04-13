import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getPets() async{
  List pets = [];
  CollectionReference collectionReferencePets = db.collection('pets');

  //Recuperar los datos
  QuerySnapshot queryPets = await collectionReferencePets.get();
  queryPets.docs.forEach((documento) { 
    pets.add(documento.data());
  });

  return pets;
}