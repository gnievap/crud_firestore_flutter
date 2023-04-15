import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class EditPetScreen extends StatefulWidget {
  const EditPetScreen({super.key});

  @override
  State<EditPetScreen> createState() => _EditPetScreenState();
}

class _EditPetScreenState extends State<EditPetScreen> {

  TextEditingController newPetController = TextEditingController(text: '');
  TextEditingController newSpecieController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    newPetController.text = arguments['name'];
    newSpecieController.text = arguments['specie'];
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Editar mascota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
             TextField(
              controller: newPetController,
              decoration:  const InputDecoration(
                hintText: 'Actualiza el nombre de la mascota',
              ),
            ),
            TextField(
              controller: newSpecieController,
              decoration:  const InputDecoration(
                hintText: 'Actualiza la especie de la mascota',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                //print(arguments['petId']);
                await updatePet(arguments['petId'], newPetController.text, newSpecieController.text).then((_) {
                  Navigator.pop(context);
                });
                },
              child: const Text('Actualizar'),
              ),
          ],
        ),
      ), 
    );
  }
}