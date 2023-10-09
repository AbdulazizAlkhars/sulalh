import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hathera_demo/CreateAnimals/ListOfAnimals.dart';
import 'package:hathera_demo/Widgets/ConnectorLines.dart';

class DemoFamilyTree extends StatefulWidget {
  const DemoFamilyTree({
    super.key,
  });
  @override
  _DemoFamilyTree createState() => _DemoFamilyTree();
}

class _DemoFamilyTree extends State<DemoFamilyTree> {
  List<Widget> fatherParents = [
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimalCard(name: 'F1'),
            SizedBox(width: 30),
            AnimalCard(name: 'F2'),
          ],
        ),
        LineDrawer(
          lineConfigs: [
            LineConfig(
              60,
              0,
              drawArrow: false,
              drawDot: false,
            ),
            LineConfig(
              60,
              -90,
              drawArrow: true,
              drawDot: false,
            ),
            LineConfig(60, 180, drawArrow: false, drawDot: false),
            LineConfig(60, 90, drawArrow: false, drawDot: false),
            LineConfig(60, -90, drawArrow: false, drawDot: true),
            LineConfig(60, 180, drawArrow: false, drawDot: false),
            LineConfig(60, -90, drawArrow: false, drawDot: false),
            LineConfig(60, 90, drawArrow: true, drawDot: false),
          ],
          width: 200, // Adjust the size as needed
          height: 200,
        ),
      ],
    ),
  ];

  List<Widget> motherParents = [
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimalCard(name: 'M1'),
            SizedBox(width: 30),
            AnimalCard(name: 'M2'),
          ],
        ),
        LineDrawer(
          lineConfigs: [
            LineConfig(
              60,
              0,
              drawArrow: false,
              drawDot: false,
            ),
            LineConfig(
              60,
              -90,
              drawArrow: true,
              drawDot: false,
            ),
            LineConfig(60, 180, drawArrow: false, drawDot: false),
            LineConfig(60, 90, drawArrow: false, drawDot: false),
            LineConfig(60, -90, drawArrow: false, drawDot: true),
            LineConfig(60, 180, drawArrow: false, drawDot: false),
            LineConfig(60, -90, drawArrow: false, drawDot: false),
            LineConfig(60, 90, drawArrow: true, drawDot: false),
          ],
          width: 200, // Adjust the size as needed
          height: 200,
        ),
      ],
    ),
  ];
  List<Widget> parentList = [];

// Define variables to control visibility
  bool showFatherParents = false;
  bool showMotherParents = false;

  @override
  void initState() {
    super.initState();
    // Initialize the fatherParents list with the initial visibility settings
    parentList = [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      showFatherParents = !showFatherParents;
                    });
                  },
                  child: AnimalCard(name: 'Father')),
              SizedBox(width: 135),
              GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      showMotherParents = !showMotherParents;
                    });
                  },
                  child: AnimalCard(name: 'Mother')),
            ],
          ),
          LineDrawer(
            lineConfigs: [
              LineConfig(
                120,
                0,
                drawArrow: false,
                drawDot: false,
              ),
              LineConfig(
                60,
                -90,
                drawArrow: true,
                drawDot: false,
              ),
              LineConfig(60, 180, drawArrow: false, drawDot: false),
              LineConfig(120, 90, drawArrow: false, drawDot: false),
              LineConfig(60, -90, drawArrow: false, drawDot: true),
              LineConfig(60, 180, drawArrow: false, drawDot: false),
              LineConfig(120, -90, drawArrow: false, drawDot: false),
              LineConfig(60, 90, drawArrow: true, drawDot: false),
            ],
            width: 200, // Adjust the size as needed
            height: 200,
          ),
        ],
      ),
    ];
  }

  List<Widget> animalList = [
    MainAnimalCard(
      mainanimalname: 'Animal',
    ),
    LineDrawer(
      lineConfigs: [
        LineConfig(
          20,
          -90,
          drawArrow: false,
          drawDot: true,
        ),
        LineConfig(
          50,
          180,
          drawArrow: true,
          drawDot: false,
        ),
      ],
      width: 100, // Adjust the size as needed
      height: 100,
    ),
  ];

  List<Widget> childrenList = [
    AnimalCard(name: 'Child 1'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Harry's Family Tree"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button press
            // Add your code here
          },
        ),
      ),
      body: InteractiveViewer(
        boundaryMargin: EdgeInsets.all(double.infinity),
        minScale: 0.5,
        maxScale: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showFatherParents)
                        Row(
                          children: fatherParents,
                        )
                      else if (showMotherParents)
                        Container(
                          width: 230,
                          height: 230,
                        ), // Empty container if showMotherParents is true
                      SizedBox(
                        width: 20,
                      ),
                      if (showMotherParents)
                        Row(
                          children: motherParents,
                        )
                      else if (showFatherParents)
                        Container(
                          width: 230,
                          height: 230,
                        ), // Empty container if showFatherParents is true
                    ],
                  ),
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
        backgroundColor: Colors.grey[350],
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

class MainAnimalCard extends StatefulWidget {
  final String mainanimalname;

  MainAnimalCard({
    required this.mainanimalname,
  });

  @override
  State<MainAnimalCard> createState() => _MainAnimalCardState();
}

class _MainAnimalCardState extends State<MainAnimalCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.yellow, // Shadow color
                blurRadius: 20, // Spread of the shadow
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[350],
            backgroundImage: AssetImage(
                'assets/Staff Images/Black-Widow-Avengers-Endgame-feature.jpg'),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (AssetImage == null)
                  Text(
                    widget.mainanimalname,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (AssetImage != null)
          Text(
            widget.mainanimalname,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}

class AnimalCard extends StatefulWidget {
  final String name;

  AnimalCard({required this.name});

  @override
  _AnimalCardState createState() => _AnimalCardState();
}

class _AnimalCardState extends State<AnimalCard> {
  String? selectedAnimalImage;
  String? selectedAnimalName;

  final List<Map<String, dynamic>> animals = [
    {
      'name': 'Lion',
      'image':
          'assets/Staff Images/Black-Widow-Avengers-Endgame-feature.jpg', // Replace with the actual image URL
    },
    {
      'name': 'Tiger',
      'image':
          'assets/Staff Images/ed33c7f2a3940fcebf9f0aac54d67895.jpg', // Replace with the actual image URL
    },
    {
      'name': 'Elephant',
      'image':
          'assets/Staff Images/HD-wallpaper-thor-in-avengers-endgame.jpg', // Replace with the actual image URL
    },
    {
      'name': 'Giraffe',
      'image':
          'assets/Staff Images/pexels-arsham-haghani-3445218.jpg', // Replace with the actual image URL
    },
    // Add more animal data as needed
  ];

  void _showAnimalListModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          child: ListView.builder(
            itemCount: animals.length,
            itemBuilder: (BuildContext context, int index) {
              final animalData = animals[index];
              final animalName = animalData['name'];
              final animalImage = animalData['image'];

              return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(animalImage),
                ),
                title: Text(animalName),
                onTap: () {
                  setState(() {
                    selectedAnimalImage = animalImage;
                    selectedAnimalName = animalName;
                  });
                  Navigator.of(context).pop(); // Close the modal sheet
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            _showAnimalListModal(context);
          },
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[350],
            backgroundImage: selectedAnimalImage != null
                ? AssetImage(selectedAnimalImage!)
                : null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (selectedAnimalImage == null)
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (selectedAnimalName != null)
          Text(
            selectedAnimalName!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
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
      ..color = const Color.fromARGB(255, 43, 93, 45)
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
