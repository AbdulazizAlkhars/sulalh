import 'package:flutter/material.dart';

class CustomTag extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const CustomTag({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: selected ? Colors.yellow : Color.fromARGB(255, 234, 234, 234),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            label,
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
