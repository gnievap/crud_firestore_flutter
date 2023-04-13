import 'package:flutter/material.dart';
import 'package:crud_firebase/services/firebase_service.dart';


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