// import 'package:flutter/material.dart';
// import 'package:hathera_demo/demolines.dart';
// import 'package:hathera_demo/sadas.dart';

// class DemoFamilyTree extends StatefulWidget {
//   @override
//   _DemoFamilyTreeState createState() => _DemoFamilyTreeState();
// }

// class _DemoFamilyTreeState extends State<DemoFamilyTree> {
//   List<Widget> fatherParents = [
//     Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             AnimalCard(name: 'F1'),
//             SizedBox(width: 30),
//             AnimalCard(name: 'F2'),
//           ],
//         ),
//         LineDrawer(
//           lineConfigs: [
//             LineConfig(
//               60,
//               0,
//               drawArrow: false,
//               drawDot: false,
//             ),
//             LineConfig(
//               60,
//               -90,
//               drawArrow: true,
//               drawDot: false,
//             ),
//             LineConfig(60, 180, drawArrow: false, drawDot: false),
//             LineConfig(60, 90, drawArrow: false, drawDot: false),
//             LineConfig(60, -90, drawArrow: false, drawDot: true),
//             LineConfig(60, 180, drawArrow: false, drawDot: false),
//             LineConfig(60, -90, drawArrow: false, drawDot: false),
//             LineConfig(60, 90, drawArrow: true, drawDot: false),
//           ],
//           width: 200, // Adjust the size as needed
//           height: 200,
//         ),
//       ],
//     ),
//   ];

//   List<Widget> motherParents = [
//     Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             AnimalCard(name: 'M1'),
//             SizedBox(width: 30),
//             AnimalCard(name: 'M2'),
//           ],
//         ),
//         LineDrawer(
//           lineConfigs: [
//             LineConfig(
//               60,
//               0,
//               drawArrow: false,
//               drawDot: false,
//             ),
//             LineConfig(
//               60,
//               -90,
//               drawArrow: true,
//               drawDot: false,
//             ),
//             LineConfig(60, 180, drawArrow: false, drawDot: false),
//             LineConfig(60, 90, drawArrow: false, drawDot: false),
//             LineConfig(60, -90, drawArrow: false, drawDot: true),
//             LineConfig(60, 180, drawArrow: false, drawDot: false),
//             LineConfig(60, -90, drawArrow: false, drawDot: false),
//             LineConfig(60, 90, drawArrow: true, drawDot: false),
//           ],
//           width: 200, // Adjust the size as needed
//           height: 200,
//         ),
//       ],
//     ),
//   ];
//   List<Widget> parentList = [];

// // Define variables to control visibility
//   bool showFatherParents = false;
//   bool showMotherParents = false;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the fatherParents list with the initial visibility settings
//     parentList = [
//       Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       showFatherParents = !showFatherParents;
//                     });
//                   },
//                   child: AnimalCard(name: 'Father')),
//               SizedBox(width: 135),
//               GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       showMotherParents = !showMotherParents;
//                     });
//                   },
//                   child: AnimalCard(name: 'Mother')),
//             ],
//           ),
//           LineDrawer(
//             lineConfigs: [
//               LineConfig(
//                 120,
//                 0,
//                 drawArrow: false,
//                 drawDot: false,
//               ),
//               LineConfig(
//                 60,
//                 -90,
//                 drawArrow: true,
//                 drawDot: false,
//               ),
//               LineConfig(60, 180, drawArrow: false, drawDot: false),
//               LineConfig(120, 90, drawArrow: false, drawDot: false),
//               LineConfig(60, -90, drawArrow: false, drawDot: true),
//               LineConfig(60, 180, drawArrow: false, drawDot: false),
//               LineConfig(120, -90, drawArrow: false, drawDot: false),
//               LineConfig(60, 90, drawArrow: true, drawDot: false),
//             ],
//             width: 200, // Adjust the size as needed
//             height: 200,
//           ),
//         ],
//       ),
//     ];
//   }

//   List<Widget> animalList = [
//     AnimalCard(name: 'Animal'),
//     LineDrawer(
//       lineConfigs: [
//         LineConfig(
//           20,
//           -90,
//           drawArrow: false,
//           drawDot: true,
//         ),
//         LineConfig(
//           50,
//           180,
//           drawArrow: true,
//           drawDot: false,
//         ),
//       ],
//       width: 100, // Adjust the size as needed
//       height: 100,
//     ),
//   ];

//   List<Widget> childrenList = [
//     AnimalCard(name: 'Child 1'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Harry's Family Tree"),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//             // Handle back button press
//             // Add your code here
//           },
//         ),
//       ),
//       body: InteractiveViewer(
//         boundaryMargin: EdgeInsets.all(double.infinity),
//         minScale: 0.5,
//         maxScale: 10.0,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Center(
//             child: FittedBox(
//               fit: BoxFit.contain,
//               child: Column(
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       if (showFatherParents)
//                         Row(
//                           children: fatherParents,
//                         )
//                       else if (showMotherParents)
//                         Container(
//                           width: 230,
//                           height: 230,
//                         ), // Empty container if showMotherParents is true
//                       SizedBox(
//                         width: 20,
//                       ),
//                       if (showMotherParents)
//                         Row(
//                           children: motherParents,
//                         )
//                       else if (showFatherParents)
//                         Container(
//                           width: 230,
//                           height: 230,
//                         ), // Empty container if showFatherParents is true
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: parentList,
//                   ),
//                   ...animalList,
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         for (var i = 0; i < childrenList.length; i++) ...[
//                           if (i > 0) CustomConnectorLine(),
//                           childrenList[i],
//                           if (i < childrenList.length - 1)
//                             CustomConnectorLine(),
//                         ],
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.grey[350],
//         onPressed: () {
//           // Add a new child when the button is pressed
//           setState(() {
//             childrenList
//                 .add(AnimalCard(name: 'Child ${childrenList.length + 1}'));
//           });
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class AnimalCard extends StatelessWidget {
//   final String name;

//   AnimalCard({required this.name});

//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       radius: 50, // Adjust the radius as needed
//       backgroundColor: Colors.grey[350],
//       child: Text(
//         name,
//         style: TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }

// class CustomConnectorLine extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       size: Size(30, 2), // Adjust the size as needed
//       painter: CustomLinePainter(),
//     );
//   }
// }

// class CustomLinePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = const Color.fromARGB(255, 43, 93, 45)
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = 2.0;

//     final startPoint = Offset(0, size.height / 2);
//     final endPoint = Offset(size.width, size.height / 2);

//     // Draw the horizontal line
//     canvas.drawLine(startPoint, endPoint, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }

// class VerticalConnector extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       size: Size(2, 30), // Adjust the size as needed
//       painter: VerticalLinePainter(),
//     );
//   }
// }

// class VerticalLinePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.black
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = 2.0;

//     final startPoint = Offset(size.width / 2, 0);
//     final endPoint = Offset(size.width / 2, size.height * 3);

//     // Draw the vertical line
//     canvas.drawLine(startPoint, endPoint, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
