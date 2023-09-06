import 'package:flutter/material.dart';

class AnotherPage extends StatelessWidget {
  final String selectedAnimalType;
  final String selectedAnimalSpecies;
  final String selectedAnimalBreed;

  AnotherPage({
    required this.selectedAnimalType,
    required this.selectedAnimalSpecies,
    required this.selectedAnimalBreed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Selected Animal Type: $selectedAnimalType'),
          Text('Selected Animal Species: $selectedAnimalSpecies'),
          Text('Selected Animal Breed: $selectedAnimalBreed'),
          // Add more widgets as needed to display the variables
        ],
      ),
    );
  }
}
