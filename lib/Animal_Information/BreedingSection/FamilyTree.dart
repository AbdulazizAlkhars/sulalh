import 'package:flutter/material.dart';

class FamilyTree extends StatefulWidget {
  @override
  _FamilyTree createState() => _FamilyTree();
}

class _FamilyTree extends State<FamilyTree> {
  List<Widget> fatherParents = [
    AnimalCard(name: 'F1'),
    Column(
      children: [
        SizedBox(
          height: 20,
        ),
        CustomConnectorLine(),
        VerticalConnector(),
      ],
    ), // Custom connector line
    AnimalCard(name: 'F2'),
  ];

  List<Widget> motherParents = [
    AnimalCard(name: 'M1'),
    Column(
      children: [
        SizedBox(
          height: 20,
        ),
        CustomConnectorLine(),
        VerticalConnector(),
      ],
    ), // Custom connector line
    AnimalCard(name: 'M2'),
  ];

  List<Widget> parentList = [
    AnimalCard(name: 'Father'),
    Column(
      children: [
        SizedBox(
          height: 20,
        ),
        CustomConnectorLine(),
        VerticalConnector(),
      ],
    ), // Custom connector line
    AnimalCard(name: 'Mother'),
  ];

  List<Widget> animalList = [
    AnimalCard(name: 'Animal'),
    VerticalConnector(),
  ];

  List<Widget> childrenList = [
    AnimalCard(name: 'Child 1'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(
        boundaryMargin: EdgeInsets.all(double.infinity),
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
                  // Father's Parents
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: fatherParents,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: motherParents,
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 50), // Space between Father's Parents and Father
                  // Parents: Father and Mother
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: parentList,
                  ),
                  SizedBox(
                      height: 50), // Space between parents and "The Animal"
                  // The Animal
                  ...animalList,
                  SizedBox(
                      height: 50), // Space between "The Animal" and children
                  // Mother's Parents

                  // The Children in a Row
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var i = 0; i < childrenList.length; i++) ...[
                          if (i > 0) CustomConnectorLine(),
                          childrenList[i],
                          if (i < childrenList.length - 1)
                            CustomConnectorLine(),
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
            childrenList
                .add(AnimalCard(name: 'Child ${childrenList.length + 1}'));
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
    return Card(
      elevation: 5,
      color: Color.fromARGB(255, 248, 243, 208),
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomConnectorLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(30, 2), // Adjust the size as needed
      painter: CustomLinePainter(),
    );
  }
}

class CustomLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    final startPoint = Offset(0, size.height / 2);
    final endPoint = Offset(size.width, size.height / 2);

    // Draw the horizontal line
    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class VerticalConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(2, 30), // Adjust the size as needed
      painter: VerticalLinePainter(),
    );
  }
}

class VerticalLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    final startPoint = Offset(size.width / 2, 0);
    final endPoint = Offset(size.width / 2, size.height * 3);

    // Draw the vertical line
    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// the custom connector lines for children will only be shown if there is a child both to the left and right of it.
