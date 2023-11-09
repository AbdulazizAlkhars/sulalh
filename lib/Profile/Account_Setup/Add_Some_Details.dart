import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Profile/BottomNavigationBar/BottomNBScreens.dart';
import 'package:hathera_demo/Riverpod/Globalvariables.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

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
  final TextEditingController _addressController = TextEditingController();
  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return Container(
          color: Colors.transparent,
          height: 150,
          child: Column(
            children: [
              ListTile(
                trailing: const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.grayscale50,
                ),
                leading: const Icon(Icons.camera),
                title: Text('Camera'.tr),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedImage =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (pickedImage != null) {
                    ref
                        .read(proflePictureProvider.notifier)
                        .update((state) => File(pickedImage.path));
                    setState(() {});
                  }
                },
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width * 0.914,
                color: AppColors.grayscale20,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.grayscale50,
                ),
                leading: const Icon(Icons.photo_library),
                title: Text('Gallery'.tr),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedImage =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    ref
                        .read(proflePictureProvider.notifier)
                        .update((state) => File(pickedImage.path));
                    setState(() {});
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
    final profilePicture = ref.watch(proflePictureProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
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
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Skip For Now'.tr,
                style: const TextStyle(
                  color: Color.fromARGB(255, 36, 86, 38),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
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
                'Add Some Details'.tr,
                style: AppFonts.title3(color: AppColors.grayscale90),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text('Add Profile Photo'.tr,
                  style: AppFonts.headline3(color: AppColors.grayscale90)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.029),
              Center(
                child: GestureDetector(
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.16,
                    backgroundColor: AppColors.grayscale10,
                    backgroundImage: profilePicture != null
                        ? FileImage(profilePicture)
                        : null,
                    child: profilePicture == null
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
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 36, 86, 38),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                "What's your address?".tr,
                style: AppFonts.headline3(color: AppColors.grayscale90),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.029),
              TextFormField(
                onChanged: (value) {
                  ref.read(addressProvider.notifier).update((state) => value);
                },
                maxLines: 3, // Set the maximum number of lines
                controller: _addressController,
                decoration: InputDecoration(
                  hintText: 'Add Your Address', // Add your hint text here
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                ),
                textInputAction:
                    TextInputAction.done, // Change the keyboard action
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              CustomTextFormField(
                onChanged: (value) {
                  ref.read(cityProvider.notifier).update((state) => value);
                },
                keyboardType: TextInputType.emailAddress,
                labelText: 'City'.tr,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              CustomTextFormField(
                onChanged: (value) {
                  ref.read(countryProvider.notifier).update((state) => value);
                },
                keyboardType: TextInputType.emailAddress,
                labelText: 'Country'.tr,
              ),
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
              MaterialPageRoute(
                  builder: (context) => bottomNavigationBarPage()),
            );
            // Add your continue button logic here
          },
          buttonText: 'Continue'.tr,
        ),
      ),
    );
  }
}
