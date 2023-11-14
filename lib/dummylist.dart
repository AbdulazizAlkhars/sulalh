// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hathera_demo/Animal_Information/OviparousGeneralInfo.dart';
// import 'package:hathera_demo/CreateAnimals/ListOfAnimals.dart';
// import 'package:hathera_demo/Riverpod/Globalvariables.dart';

// class OvigeninfoPagew extends StatelessWidget {
//   final OviVariables oviDetails;

//   OvigeninfoPagew({required this.oviDetails});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(oviDetails.animalName),
//       ),
//       body: Column(
//         children: [
//           // ... (other details)
//           Text('Breeding Events:'),
//           Expanded(
//             child: ListView.builder(
//               itemCount: oviDetails.breedingEvents.length,
//               itemBuilder: (context, index) {
//                 final breedingEvent = oviDetails.breedingEvents[index];
//                 return ListTile(
//                   title: Text(breedingEvent.eventNumber),
//                   // ... (other details)
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
