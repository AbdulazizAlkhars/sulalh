import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Profile/ProfilePage.dart';
import 'package:hathera_demo/Riverpod/Globalvariables.dart';
import 'package:hathera_demo/Widgets/Button.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileInformation extends ConsumerStatefulWidget {
  const EditProfileInformation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfileInformation createState() => _EditProfileInformation();
}

class _EditProfileInformation extends ConsumerState<EditProfileInformation> {
  // String firstname = 'John'.tr;
  // String secondname = 'Smith';
  String phonenum = '+12-345678';
  String city = 'New York';
  String email = 'johnsmith@example.com';
  String address = 'United Arab Emirates';
  String country = 'Abu Dhabi';

  final _firstnameController = TextEditingController();
  final _secondnameController = TextEditingController();
  final _phonenumController = TextEditingController();
  final _cityController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _countryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firstnameController.text = ref.read(firstNameProvider);
    _secondnameController.text = ref.read(lastNameProvider);
    _phonenumController.text = ref.read(phoneNumberProvider);
    _cityController.text = ref.read(cityProvider);
    _emailController.text = ref.read(emailProvider);
    _addressController.text = ref.read(addressProvider);
    _countryController.text = ref.read(countryProvider);
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _secondnameController.dispose();
    _phonenumController.dispose();
    _cityController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  final ImagePicker _picker = ImagePicker();

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 230,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Camera'.tr,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        '>',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
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
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Gallery'.tr,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        '>',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
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
                ListTile(
                  leading: const Icon(Icons.delete),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delete Avatar'.tr,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        '>',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _deleteAvatar(); // Call a function to delete the avatar
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _deleteAvatar() {
    // Implement the logic to delete/reset the avatar
    ref.read(proflePictureProvider.notifier).update((state) => null);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final profilePicture = ref.watch(proflePictureProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button press
            // Add your code here
          },
        ),
        title: Center(
          child: Text(
            'Edit Personal Information'.tr,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Center(
                child: GestureDetector(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: profilePicture != null
                        ? FileImage(profilePicture!)
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
              const SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {
                    _showImagePicker(context);
                  },
                  child: Text(
                    'Change Photo'.tr,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 36, 86, 38),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 45),
              Text(
                "General Info".tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                "First Name".tr,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                onChanged: (value) {
                  ref.read(firstNameProvider.notifier).update((state) => value);
                },
                controller: _firstnameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(20, 20, 30, 12),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _firstnameController.clear();
                    },
                    child: const Icon(Icons.clear),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Last Name".tr,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                onChanged: (value) {
                  ref.read(lastNameProvider.notifier).update((state) => value);
                },
                controller: _secondnameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(20, 20, 30, 12),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _secondnameController.clear();
                    },
                    child: const Icon(Icons.clear_rounded),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                "Contact Details".tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                "Phone Number".tr,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                onChanged: (value) {
                  ref
                      .read(phoneNumberProvider.notifier)
                      .update((state) => value);
                },
                controller: _phonenumController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(20, 20, 30, 12),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _phonenumController.clear();
                    },
                    child: const Icon(Icons.clear_rounded),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Email Address".tr,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                onChanged: (value) {
                  ref.read(emailProvider.notifier).update((state) => value);
                },
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(20, 20, 30, 12),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _emailController.clear();
                    },
                    child: const Icon(Icons.clear_rounded),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                "Address".tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              TextFormField(
                onChanged: (value) {
                  ref.read(addressProvider.notifier).update((state) => value);
                },
                controller: _addressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(20, 20, 30, 12),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _addressController.clear();
                    },
                    child: const Icon(Icons.clear_rounded),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                onChanged: (value) {
                  ref.read(cityProvider.notifier).update((state) => value);
                },
                controller: _cityController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(20, 20, 30, 12),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _cityController.clear();
                    },
                    child: const Icon(Icons.clear_rounded),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                onChanged: (value) {
                  ref.read(countryProvider.notifier).update((state) => value);
                },
                controller: _countryController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(20, 20, 30, 12),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _countryController.clear();
                    },
                    child: const Icon(Icons.clear_rounded),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ButtonWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                },
                buttonText: 'Save Changes'.tr,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
