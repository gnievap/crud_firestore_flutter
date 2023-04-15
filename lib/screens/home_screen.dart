import 'package:flutter/material.dart';
import 'package:crud_firebase/services/firebase_service.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis mascotas'),
      ),
      body: FutureBuilder(
        future: getPets(),
        builder: ((context, snapshot){
          if ( snapshot.hasData ){
            return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(snapshot.data?[index]['name']),
                subtitle: Text(snapshot.data?[index]['especie']),
                leading: const  Icon(Icons.pets),
                onTap: ( () async {
                  await Navigator.pushNamed(context, '/edit', arguments: {
                    'name'  : snapshot.data?[index]['name'],
                    'specie': snapshot.data?[index]['especie'],
                    'petId' : snapshot.data?[index]['petId'],
                  });
                  setState(() {
                    
                  });
                }),
              );
              
              //return Center(child: Text(snapshot.data?[index]['name']));
            },
            );
          }
          else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.pushNamed(context, '/add');
            setState(() {} );
          },
          child: const Icon(Icons.add),
          ),
    );
  }
}