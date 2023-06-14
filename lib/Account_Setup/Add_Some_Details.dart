import 'package:flutter/material.dart';
import 'package:hathera_demo/Animal_Information/Animal_General_Information.dart';
import 'package:hathera_demo/Widgets/Button.dart';
import 'package:hathera_demo/Widgets/Textformfield.dart';

class AddSomeDetailsPage extends StatelessWidget {
  void _showImagePicker(BuildContext context) {
    // Code for showing the modal bottom sheet
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button press
            // Add your code here
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle "Skip For Now" button press
              // Add your code here
            },
            child: const Text(
              'Skip For Now',
              style: TextStyle(
                color: Color.fromARGB(255, 36, 86, 38),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Some Details',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 45),
              const Text(
                'Add Profile Photo',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 45),
              Center(
                child: GestureDetector(
                  onTap: () => _showImagePicker(context),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.grey[100],
                    child: const Icon(
                      Icons.camera_alt,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),

              Center(
                child: TextButton(
                  onPressed: () {
                    // Handle "Add Photo" button press
                    // Add your code here
                  },
                  child: const Text(
                    'Add Photo',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 36, 86, 38),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 45),

              const Text(
                "What's your address?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                labelText: 'Country',
              ),

              const SizedBox(height: 16),
              CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                labelText: 'City',
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddSomeDetailsPage()),
                  );
                  // Add your continue button logic here
                },
                buttonText: 'Continue',
              ),

              // Add your additional widgets here
            ],
          ),
        ),
      ),
    );
  }
}
