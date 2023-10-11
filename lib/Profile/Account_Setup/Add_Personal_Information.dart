import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Profile/Account_Setup/Add_Some_Details.dart';
import 'package:hathera_demo/Riverpod/Globalvariables.dart';
import 'package:hathera_demo/Widgets/Button.dart';
import 'package:hathera_demo/Widgets/PhoneNumTextFieldWidget.dart';
import 'package:hathera_demo/Widgets/Textformfield.dart';

class AddPersonalInfoPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              Text(
                'Add Personal Information'.tr,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "What's your name?".tr,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                keyboardType: TextInputType.name,
                labelText: 'Enter First Name'.tr,
                onChanged: (firstName) {
                  ref
                      .read(firstNameProvider.notifier)
                      .update((state) => firstName);
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                keyboardType: TextInputType.name,
                labelText: 'Enter Last Name'.tr,
                onChanged: (value) {
                  ref.read(lastNameProvider.notifier).update((state) => value);
                },
              ),
              const SizedBox(height: 40),
              Text(
                'Contacts'.tr,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Add contact details to help other people contact you for collaboration'
                    .tr,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 35),
              Text(
                'Phone Number'.tr,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const PhoneNumberInputWidget(),
              const SizedBox(height: 16),
              Text(
                'Email'.tr,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                labelText: 'Enter Email'.tr,
                onChanged: (value) {
                  ref.read(emailProvider.notifier).update((state) => value);
                },
              ),
              const SizedBox(height: 25),
              ButtonWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddSomeDetailsPage()),
                  );
                  // Add your continue button logic here
                },
                buttonText: 'Continue'.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
