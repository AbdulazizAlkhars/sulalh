import 'dart:io';
import 'package:flutter/material.dart';

import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';

class CaptionEntryPage extends StatefulWidget {
  final String imagePath;

  CaptionEntryPage({required this.imagePath});

  @override
  _CaptionEntryPageState createState() => _CaptionEntryPageState();
}

class _CaptionEntryPageState extends State<CaptionEntryPage> {
  final TextEditingController _captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayscale00,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.grayscale00,
        surfaceTintColor: AppColors.grayscale00,
        title: Text(
          'Add Caption',
          style: AppFonts.title5(color: AppColors.grayscale90),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: AppColors.primary30,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 16.0,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop(_captionController.text);
                  },
                  child: Text(
                    'Upload',
                    style: AppFonts.body1(color: AppColors.grayscale00),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(File(widget.imagePath))),
              SizedBox(height: 16),
              Text(
                'Enter Caption',
                style: AppFonts.body1(color: AppColors.grayscale90),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(24.0),
                  border: Border.all(
                    color: AppColors.grayscale20,
                    width: 1.0,
                  ),
                ),
                child: TextField(
                  controller: _captionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Add Caption For Your Image',
                    hintStyle: AppFonts.body2(
                      color: AppColors.grayscale50,
                    ),
                    counterText: '',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
