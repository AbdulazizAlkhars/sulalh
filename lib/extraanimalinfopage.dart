// import 'package:flutter/material.dart';

// class AnimalsPage extends StatefulWidget {
//   @override
//   _AnimalsPageState createState() => _AnimalsPageState();
// }

// class _AnimalsPageState extends State<AnimalsPage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Center(
//           child: Text(
//             'Animals',
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             // Handle back button press
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.edit,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               // Handle edit button press
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Colors.blue,
//                 Colors.green
//               ], // Replace with your desired colors
//             ),
//           ),
//           child: Column(
//             children: [
//               SizedBox(
//                   height: 20), // Add spacing between app bar and circle avatar
//               Align(
//                 alignment: Alignment.topCenter,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     CircleAvatar(
//                       radius: 70,
//                       backgroundColor: Colors.grey[200],
//                       child: Icon(
//                         Icons.photo_library_outlined,
//                         size: 50,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     Positioned(
//                       bottom: -0,
//                       child: FractionalTranslation(
//                         translation: Offset(0.0, 0.5),
//                         child: Container(
//                           padding:
//                               EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 2,
//                                 blurRadius: 5,
//                                 offset: Offset(0, 3),
//                               ),
//                             ],
//                           ),
//                           child: Text(
//                             'Tag',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                   height:
//                       40), // Add spacing between the circle avatar and additional widgets
//               Column(
//                 children: [
//                   Text(
//                     'Animal Name',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 25,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Text(
//                     'ID: 12345',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20), // Add spacing for new widgets
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(16),
//                 margin: EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   children: [
//                     Text(
//                       'My Farm',
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20), // Add spacing between the boxes
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(16),
//                 margin: EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Column(
//                       children: [
//                         Text(
//                           'Mammals',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                             fontSize: 18,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           'Type',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.grey,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Text(
//                           '2 Years',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                             color: Colors.black,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           'Age',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.grey,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Text(
//                           'Female',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                             color: Colors.black,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           'Sex',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.grey,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),

//               SizedBox(height: 10),
//               // Tab Bar
//               Container(
//                 width: double.infinity,
//                 margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 8,
//                     vertical:
//                         8, // Reduce the vertical padding for the indicator box
//                   ),
//                   child: TabBar(
//                     controller: _tabController,
//                     indicator: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     indicatorSize: TabBarIndicatorSize.tab,
//                     indicatorColor: Colors.transparent,
//                     labelColor: Colors.black,
//                     unselectedLabelColor: Colors.grey,
//                     tabs: [
//                       Tab(
//                         text: 'General',
//                       ),
//                       Tab(
//                         text: 'Breeding',
//                       ),
//                       Tab(
//                         text: 'Medical Notes',
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               // Tab Bar View
//               // Tab Bar View
//               // Tab Bar View
//               Container(
//                 height: 200, // Adjust the height according to your requirement
//                 child: TabBarView(
//                   controller: _tabController,
//                   children: [
//                     SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               'General Information',
//                               style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black),
//                             ),
//                           ),
//                           SizedBox(height: 16),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   flex: 2,
//                                   child: Text(
//                                     'Date Of Birth',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 14,
//                                         color: Colors.black),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   flex: 0,
//                                   child: Text(
//                                     '12.02.2023',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 14,
//                                         color: Colors.black),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 12),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   flex: 2,
//                                   child: Text(
//                                     'Date Of Weaning',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 14,
//                                         color: Colors.black),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   flex: 0,
//                                   child: Text(
//                                     '12.05.2023',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 14,
//                                         color: Colors.black),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 12),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   flex: 2,
//                                   child: Text(
//                                     'Date Of Death',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 14,
//                                         color: Colors.black),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   flex: 3,
//                                   child: Text(
//                                     '',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 14,
//                                         color: Colors.black),
//                                   ), // Example date, replace with actual date or empty string
//                                 ),
//                                 Expanded(
//                                   flex: 0,
//                                   child: Text(
//                                     'Add',
//                                     style: TextStyle(
//                                         color: Colors.blue,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   flex: 2,
//                                   child: Text(
//                                     'Date Of Mating',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 14,
//                                         color: Colors.black),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   flex: 3,
//                                   child: Text(
//                                     '',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 14,
//                                         color: Colors.black),
//                                   ), // Example date, replace with actual date or empty string
//                                 ),
//                                 Expanded(
//                                   flex: 0,
//                                   child: Text(
//                                     'Add',
//                                     style: TextStyle(
//                                         color: Colors.blue,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   flex: 2,
//                                   child: Text(
//                                     'Date Of Sale',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 14,
//                                         color: Colors.black),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   flex: 0,
//                                   child: Text(
//                                     'Add',
//                                     style: TextStyle(
//                                       color: Colors.blue,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             // )
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       color: Colors
//                           .green, // Placeholder color for Breeding tab view
//                     ),
//                     Container(
//                       color: Colors
//                           .blue, // Placeholder color for Medical Notes tab view
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
