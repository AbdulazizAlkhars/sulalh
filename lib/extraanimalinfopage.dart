//
import 'package:flutter/material.dart';
import 'package:hathera_demo/parentsgrandparentswidget.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FittedBox(
        fit: BoxFit.cover,
        child: Column(
          children: [ParentsAndGrandparentsWidget()],
        ),
      ),
    );
  }
}
