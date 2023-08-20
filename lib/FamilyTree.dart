// import 'package:flutter/material.dart';

// class AnimalFamilyTree extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Animal Family Tree'),
//       ),
//       body: Center(
//         child: FamilyNode(
//           name: 'Animal 1',
//           avatarColor: Colors.red,
//           parents: [
//             FamilyNode(
//               name: 'Parent 1',
//               avatarColor: Colors.green,
//             ),
//             FamilyNode(
//               name: 'Parent 2',
//               avatarColor: Colors.green,
//             ),
//           ],
//           children: [
//             FamilyNode(
//               name: 'Child 1',
//               avatarColor: Colors.yellow,
//             ),
//             FamilyNode(
//               name: 'Child 2',
//               avatarColor: Colors.yellow,
//             ),
//             FamilyNode(
//               name: 'Child 3',
//               avatarColor: Colors.yellow,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class FamilyNode extends StatelessWidget {
//   final String name;
//   final Color avatarColor;
//   final List<FamilyNode>? parents;
//   final List<FamilyNode>? children;

//   const FamilyNode({
//     required this.name,
//     required this.avatarColor,
//     this.parents,
//     this.children,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (parents != null)
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               for (final parent in parents!)
//                 Column(
//                   children: [
//                     CustomPaint(
//                       size: Size(30, 40),
//                       painter: LinePainter(
//                         shouldDrawUpward: true,
//                         color: Colors.black, // Customize the color of the lines
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     CircleAvatar(
//                       radius: 40,
//                       backgroundColor: parent.avatarColor,
//                       child: Text(
//                         parent.name,
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//             ],
//           ),
//         SizedBox(height: 20),
//         CircleAvatar(
//           radius: 60,
//           backgroundColor: avatarColor,
//           child: Text(
//             name,
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         SizedBox(height: 20),
//         if (children != null)
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               for (final child in children!)
//                 Column(
//                   children: [
//                     CircleAvatar(
//                       radius: 40,
//                       backgroundColor: child.avatarColor,
//                       child: Text(
//                         child.name,
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     CustomPaint(
//                       size: Size(30, 40),
//                       painter: LinePainter(
//                         shouldDrawUpward: false,
//                         color: Colors.black, // Customize the color of the lines
//                       ),
//                     ),
//                   ],
//                 ),
//             ],
//           ),
//       ],
//     );
//   }
// }

// class LinePainter extends CustomPainter {
//   final bool shouldDrawUpward;
//   final Color color;

//   LinePainter({this.shouldDrawUpward = true, this.color = Colors.black});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color
//       ..strokeWidth = 2;

//     final startPoint = Offset(size.width / 2, 0);
//     final endPoint = Offset(size.width / 2, shouldDrawUpward ? -40 : 40);

//     canvas.drawLine(startPoint, endPoint, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
