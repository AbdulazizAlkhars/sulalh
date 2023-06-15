import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hathera_demo/Profile/ProfilePage.dart';
import 'package:hathera_demo/Widgets/Button.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileInformation extends StatefulWidget {
  @override
  _EditProfileInformation createState() => _EditProfileInformation();
}

class _EditProfileInformation extends State<EditProfileInformation> {
  String firstname = 'John';
  String secondname = 'Smith';
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
    _firstnameController.text = firstname;
    _secondnameController.text = secondname;
    _phonenumController.text = phonenum;
    _cityController.text = city;
    _emailController.text = email;
    _addressController.text = address;
    _countryController.text = country;
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

  void _saveChanges() {
    setState(() {
      firstname = _firstnameController.text;
      secondname = _secondnameController.text;
      phonenum = _phonenumController.text;
      city = _cityController.text;
      email = _emailController.text;
      address = _addressController.text;
      country = _countryController.text;
    });
    // Save the changes to the backend or perform any other necessary operations
  }

  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 230,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Camera',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
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
                        await _picker.getImage(source: ImageSource.camera);
                    if (pickedImage != null) {
                      setState(() {
                        _selectedImage = File(pickedImage.path);
                      });
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Gallery',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
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
                        await _picker.getImage(source: ImageSource.gallery);
                    if (pickedImage != null) {
                      setState(() {
                        _selectedImage = File(pickedImage.path);
                      });
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delete Avatar',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '>',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  onTap: () async {
                    Navigator.pop(context);
                    final pickedImage =
                        await _picker.getImage(source: ImageSource.gallery);
                    if (pickedImage != null) {
                      setState(() {
                        _selectedImage = File(pickedImage.path);
                      });
                    }
                  },
                ),
              ],
            ),
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
        title: const Text(
          'Edit Personal Information',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              const SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {
                    _showImagePicker(context);
                  },
                  child: const Text(
                    'Change Photo',
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
                "General Info",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                "First Name",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
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
              const Text(
                "Second Name",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
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
              const Text(
                "Contact Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                "Phone Number",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
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
              const Text(
                "Email Address",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
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
              const Text(
                "Address",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              TextFormField(
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
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                buttonText: 'Save Changes',
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
