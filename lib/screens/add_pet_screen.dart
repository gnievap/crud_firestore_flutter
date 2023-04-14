import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({super.key});

  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {

  TextEditingController newPetController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Agregar mascota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
             TextField(
              controller: newPetController,
              decoration:  const InputDecoration(
                hintText: 'Escribe nombre de mascota',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await addPet(newPetController.text).then((_) {
                  Navigator.pop(context);
                });
              }, 
              child: const Text('Guardar'),
              ),
          ],
        ),
      ), 
    );
  }
}