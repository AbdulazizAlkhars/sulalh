import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hathera_demo/Animal_Information/OviparousGeneralInfo.dart';
import 'package:hathera_demo/CreateAnimals/ListOfAnimals.dart';
import 'package:hathera_demo/Riverpod/Globalvariables.dart';

class ListPage extends StatelessWidget {
  final List<OviVariables> oviDetailsList;

  ListPage({required this.oviDetailsList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details List'),
      ),
      body: ListView.builder(
        itemCount: oviDetailsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(oviDetailsList[index].animalName),
            // Add other details as needed
            // ...
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => AddDetailsPage(),
          //   ),
          // );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
