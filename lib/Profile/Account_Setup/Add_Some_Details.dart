import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Profile/BottomNavigationBar/BottomNBScreens.dart';

import 'package:hathera_demo/Widgets/Button.dart';
import 'package:hathera_demo/Widgets/Textformfield.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddSomeDetailsPage extends ConsumerStatefulWidget {
  @override
  _AddSomeDetailsPageState createState() => _AddSomeDetailsPageState();
}

class _AddSomeDetailsPageState extends ConsumerState<AddSomeDetailsPage> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: Text('Camera'.tr),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedImage =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (pickedImage != null) {
                    setState(() {
                      _selectedImage = File(pickedImage.path);
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text('Gallery'.tr),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedImage =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    setState(() {
                      _selectedImage = File(pickedImage.path);
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
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
            child: Text(
              'Skip For Now'.tr,
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
              Text(
                'Add Some Details'.tr,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 45),
              Text(
                'Add Profile Photo'.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 45),
              Center(
                child: GestureDetector(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: _selectedImage != null
                        ? FileImage(_selectedImage!)
                        : null,
                    child: _selectedImage == null
                        ? const Icon(
                            Icons.camera_alt,
                            size: 50,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    _showImagePicker(context);
                  },
                  child: Text(
                    'Add Photo'.tr,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 36, 86, 38),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 45),
              Text(
                "What's your address?".tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                labelText: 'Enter Email'.tr,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                labelText: 'City'.tr,
              ),
              const SizedBox(height: 80),
              ButtonWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => bottomNavigationBarPage()),
                  );
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
