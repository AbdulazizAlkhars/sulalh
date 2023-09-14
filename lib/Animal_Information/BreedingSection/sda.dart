import 'package:flutter/material.dart';

class MedicalNeedsScreen extends StatefulWidget {
  @override
  _MedicalNeedsScreenState createState() => _MedicalNeedsScreenState();
}

class _MedicalNeedsScreenState extends State<MedicalNeedsScreen> {
  TextEditingController _medicalNeedsController = TextEditingController();
  bool _isEditMode = false;

  @override
  void initState() {
    super.initState();
    // Initialize the text field with some default value
    _medicalNeedsController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    Widget buttonWidget;
    if (_isEditMode) {
      buttonWidget = ElevatedButton(
        onPressed: () {
          // Handle save button press
          // Add your code here to save the edited text
          setState(() {
            _isEditMode = false;
          });
        },
        child: Text('Save'),
      );
    } else {
      buttonWidget = IconButton(
        icon: const Icon(
          Icons.edit_square,
          color: const Color.fromARGB(255, 36, 86, 38),
        ),
        onPressed: () {
          // Enter edit mode
          setState(() {
            _isEditMode = true;
          });
        },
      );
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 251, 247, 206),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      '01.01.2023',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Next Vaccination',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 251, 247, 206),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      '12.02.2023',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Last Check Up',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '02.08.2023',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Next Check Up',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // ... your existing code for date entries ...
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttonWidget,
              ],
            ),
          ),
          _isEditMode ? _buildEditMode() : _buildDisplayMode(),
        ],
      ),
    );
  }

  Widget _buildDisplayMode() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        _medicalNeedsController.text,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildEditMode() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          TextField(
            controller: _medicalNeedsController,
            decoration: InputDecoration(
              labelText: 'Medical Needs',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle file picker button press
              // Add your code here to open a file picker
            },
            child: Text('Pick a File'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the TextEditingController when the widget is removed
    _medicalNeedsController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Medical Needs'),
      ),
      body: MedicalNeedsScreen(),
    ),
  ));
}
