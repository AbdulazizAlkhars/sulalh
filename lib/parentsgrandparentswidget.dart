import 'package:flutter/material.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/FamilyTree.dart';
import 'package:hathera_demo/Widgets/ConnectorLines.dart';

class ParentsAndGrandparentsWidget extends StatefulWidget {
  @override
  _ParentsAndGrandparentsWidgetState createState() =>
      _ParentsAndGrandparentsWidgetState();
}

class _ParentsAndGrandparentsWidgetState
    extends State<ParentsAndGrandparentsWidget> {
  // Define your variables here
  List<Widget> fatherParents = [
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimalCard(name: 'F1'),
            const SizedBox(width: 30),
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
            const SizedBox(width: 30),
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
  bool showFatherParents = false;
  bool showMotherParents = false;

  @override
  void initState() {
    super.initState();
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
              const SizedBox(width: 135),
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

  @override
  Widget build(BuildContext context) {
    return Column(
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
              ),
            const SizedBox(
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
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: parentList,
        ),
      ],
    );
  }
}
