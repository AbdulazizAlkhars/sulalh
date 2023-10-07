import 'package:flutter/material.dart';

class DemoFamilyTree extends StatefulWidget {
  @override
  _DemoFamilyTreeState createState() => _DemoFamilyTreeState();
}

class _DemoFamilyTreeState extends State<DemoFamilyTree> {
  List<Widget> fatherParents = [
    AnimalCard(name: 'F1'),
    AnimalCard(name: 'F2'),
  ];

  List<Widget> motherParents = [
    AnimalCard(name: 'M1'),
    AnimalCard(name: 'M2'),
  ];

  List<Widget> parentList = [
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimalCard(name: 'Father'),
            SizedBox(width: 80),
            AnimalCard(name: 'Mother'),
          ],
        ),
      ],
    ),
  ];

  List<Widget> animalList = [
    AnimalCard(name: 'Animal'),
  ];

  List<Widget> childrenList = [
    AnimalCard(name: 'Child 1'),
  ];

  // Line configurations
  List<LineConfig> lineConfigs = [
    LineConfig(80, 0, drawArrow: false, drawDot: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(
        minScale: 0.5,
        maxScale: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: parentList,
                  ),
                  ...animalList,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var i = 0; i < childrenList.length; i++) ...[
                          if (i > 0) CustomConnectorLine(lineConfigs[i - 1]),
                          childrenList[i],
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a new child when the button is pressed
          setState(() {
            final newChildIndex = childrenList.length + 1;
            childrenList.add(AnimalCard(name: 'Child $newChildIndex'));

            // Update line configurations
            if (newChildIndex > 1) {
              final angleIncrement = 180 / (newChildIndex - 1);
              final length = 50.0;

              for (var i = 1; i < newChildIndex; i++) {
                final newAngle = 90 + angleIncrement * (i - 1);
                lineConfigs.add(
                  LineConfig(length, newAngle,
                      drawArrow: false, drawDot: false),
                );
              }

              // Add lines with arrows at center and sides
              lineConfigs.addAll([
                LineConfig(length, 0,
                    drawArrow: true, drawDot: false), // Center line
                LineConfig(length, 90,
                    drawArrow: true, drawDot: false), // Right side line
                LineConfig(length, -90,
                    drawArrow: true, drawDot: false), // Left side line
              ]);
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AnimalCard extends StatelessWidget {
  final String name;

  AnimalCard({required this.name});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Color.fromARGB(255, 248, 243, 208),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CustomConnectorLine extends StatelessWidget {
  final LineConfig config;

  CustomConnectorLine(this.config);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(30, 2),
      painter: CustomLinePainter(config),
    );
  }
}

class CustomLinePainter extends CustomPainter {
  final LineConfig config;

  CustomLinePainter(this.config);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 43, 93, 45)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    final startPoint = Offset(0, size.height / 2);
    final endPoint = Offset(size.width, size.height / 2);

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class LineConfig {
  final double length;
  final double angle;
  final bool drawArrow;
  final bool drawDot;

  LineConfig(this.length, this.angle,
      {this.drawArrow = false, this.drawDot = false});
}

void main() {
  runApp(MaterialApp(home: DemoFamilyTree()));
}
