import 'dart:io';
import 'package:flutter/material.dart';

import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';

class ImageDetailPage extends StatelessWidget {
  final String imagePath;
  final String caption;
  final void Function() onDelete;

  ImageDetailPage(
      {required this.imagePath,
      required this.caption,
      required this.onDelete,
      required int likeCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayscale00,
      appBar: AppBar(
        backgroundColor: AppColors.grayscale00,
        surfaceTintColor: AppColors.grayscale00,
        title: Text(
          'View Image',
          style: AppFonts.title5(color: AppColors.grayscale90),
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: AppColors.error100,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 10.0,
                    ),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Delete Image',
                                style: AppFonts.title4(
                                    color: AppColors.grayscale100),
                              ),
                              content: Text(
                                'Are you sure you want to delete this image?',
                                style: AppFonts.headline4(
                                    color: AppColors.grayscale100),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: AppFonts.body1(
                                        color: AppColors.grayscale100),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    onDelete();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Delete',
                                    style: AppFonts.body1(
                                        color: AppColors.error100),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'Delete',
                            style: AppFonts.body1(color: AppColors.grayscale00),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.delete,
                            size: 18,
                            color: AppColors.grayscale00,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              caption,
              style: AppFonts.body1(color: AppColors.grayscale100),
            ),
          ],
        ),
      ),
    );
  }
}
