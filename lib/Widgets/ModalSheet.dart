import 'package:flutter/material.dart';

class FilterModalSheet extends StatelessWidget {
  final Widget content;
  final String? heading;

  FilterModalSheet({required this.content, this.heading});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: FractionallySizedBox(
            heightFactor: 0.62,
            child: Container(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (heading != null)
                      Text(
                        heading!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    SizedBox(height: 16),
                    content, // Display the content widget passed as a parameter
                  ],
                ),
              ),
            )));
  }
}

class ExampleUsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Use'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showFilterModalSheet(context);
          },
          child: Text('Open Modal Sheet'),
        ),
      ),
    );
  }

  void _showFilterModalSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FilterModalSheet(
          content: Column(
            children: [
              Text('Add Your Widgets Here'),
              // Add Your Widgets Here
            ],
          ),
        );
      },
    );
  }
}
