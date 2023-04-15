import 'package:crud_firebase/screens/edit_pet_screen.dart';
import 'package:flutter/material.dart';
import 'package:crud_firebase/screens/add_pet_screen.dart';
import 'package:crud_firebase/screens/home_screen.dart';


//importaciones de Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/add': (context) => const AddPetScreen(),
        '/edit': (context) => const EditPetScreen(),
      },
    );
  }
}

