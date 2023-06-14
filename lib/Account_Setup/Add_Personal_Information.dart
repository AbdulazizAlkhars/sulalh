import 'package:flutter/material.dart';
import 'package:hathera_demo/Account_Setup/Add_Some_Details.dart';
import 'package:hathera_demo/Widgets/Button.dart';
import 'package:hathera_demo/Widgets/PhoneNumTextFieldWidget.dart';
import 'package:hathera_demo/Widgets/Textformfield.dart';

class AddPersonalInfoPage extends StatelessWidget {
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Personal Information',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "What's your name?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                keyboardType: TextInputType.name,
                labelText: 'Enter First Name',
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                keyboardType: TextInputType.name,
                labelText: 'Enter Last Name',
              ),
              const SizedBox(height: 40),
              const Text(
                'Contacts',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Add contact details to help other people contact you for collaboration',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 35),
              const Text(
                'Phone number',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              PhoneNumberInputWidget(),
              const SizedBox(height: 16),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                labelText: 'Enter Email',
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
            ],
          ),
        ),
      ),
    );
  }
}
