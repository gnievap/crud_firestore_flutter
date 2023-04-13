import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase con flutter'),
      ),
      body: FutureBuilder(
        future: getPets(),
        builder: ((context, snapshot){
          if ( snapshot.hasData ){
            return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index){
              return Center(child: Text(snapshot.data?[index]['name']));
            },
            );
          }
          else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          
        }),),
    );
  }
}