import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class EnlargedProfilePicScreen extends StatelessWidget {
  final File? image;

  EnlargedProfilePicScreen({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context); // Close the enlarged image screen on tap
        },
        child: Center(
          child: PhotoView(
            imageProvider: FileImage(image!),
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 2,
            initialScale: PhotoViewComputedScale.contained,
          ),
        ),
      ),
    );
  }
}
