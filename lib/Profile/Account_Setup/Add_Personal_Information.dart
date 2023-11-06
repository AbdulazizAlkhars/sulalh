import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Profile/Account_Setup/Add_Some_Details.dart';
import 'package:hathera_demo/Riverpod/Globalvariables.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';
import 'package:hathera_demo/Widgets/Button.dart';
import 'package:hathera_demo/Widgets/PhoneNumTextFieldWidget.dart';
import 'package:hathera_demo/Widgets/Textformfield.dart';

class AddPersonalInfoPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.016),
            decoration: BoxDecoration(
              color: AppColors.grayscale10,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button press
            // Add your code here
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton(
              onPressed: () {
                // Handle "Skip For Now" button press
                // Add your code here
              },
              child: Text(
                'Skip For Now'.tr,
                style: TextStyle(
                  color: Color.fromARGB(255, 36, 86, 38),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.042,
              right: MediaQuery.of(context).size.width * 0.042),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Personal Information'.tr,
                style: AppFonts.title3(color: AppColors.grayscale90),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text("What's your name?".tr,
                  style: AppFonts.headline3(color: AppColors.grayscale90)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.029),
              CustomTextFormField(
                keyboardType: TextInputType.name,
                labelText: 'Enter First Name'.tr,
                onChanged: (firstName) {
                  ref
                      .read(firstNameProvider.notifier)
                      .update((state) => firstName);
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              CustomTextFormField(
                keyboardType: TextInputType.name,
                labelText: 'Enter Last Name'.tr,
                onChanged: (value) {
                  ref.read(lastNameProvider.notifier).update((state) => value);
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text("What is the name of your farm?",
                  style: AppFonts.headline3(color: AppColors.grayscale90)),
              CustomTextFormField(
                keyboardType: TextInputType.name,
                labelText: 'Enter Farm Name'.tr,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              Text("Who owns the farm?",
                  style: AppFonts.headline3(color: AppColors.grayscale90)),
              CustomTextFormField(
                keyboardType: TextInputType.name,
                labelText: 'Enter Owner Name'.tr,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text('Contacts'.tr,
                  style: AppFonts.headline3(color: AppColors.grayscale90)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                  'Add contact details to help other people contact you for collaboration'
                      .tr,
                  style: AppFonts.body2(color: AppColors.grayscale70)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Text(
                'Phone Number'.tr,
                style: AppFonts.headline3(color: AppColors.grayscale90),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ButtonWidget(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddSomeDetailsPage()),
            );
            // Add your continue button logic here
          },
          buttonText: 'Continue'.tr,
        ),
      ),
    );
  }
}
