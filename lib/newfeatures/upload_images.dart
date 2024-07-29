import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Theme/Colors.dart';
import '../Theme/Fonts.dart';
import 'caption_page.dart';
import 'image_detail_page.dart';

class AddPhotosModalWidget extends StatefulWidget {
  final List<String> imagePaths;
  final Map<String, String> captions;
  final Map<String, int> likes; // Add this map for likes
  final Function(String, String) onImageAdded;
  final Function(String) onImageDeleted;

  AddPhotosModalWidget({
    required this.imagePaths,
    required this.captions,
    required this.likes, // Add likes map
    required this.onImageAdded,
    required this.onImageDeleted,
  });

  @override
  _AddPhotosModalWidgetState createState() => _AddPhotosModalWidgetState();
}

class _AddPhotosModalWidgetState extends State<AddPhotosModalWidget> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      final String? caption = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CaptionEntryPage(imagePath: image.path),
        ),
      );

      if (caption != null && caption.isNotEmpty) {
        widget.onImageAdded(image.path, caption);
      }
    }
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.grayscale00,
          title: Text(
            'Choose Image Source',
            style: AppFonts.title5(color: AppColors.grayscale90),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.camera);
              },
              child: Text(
                'Camera',
                style: AppFonts.body1(color: AppColors.primary40),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.gallery);
              },
              child: Text(
                'Gallery',
                style: AppFonts.body1(color: AppColors.primary40),
              ),
            ),
          ],
        );
      },
    );
  }

  void _viewImage(String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageDetailPage(
          imagePath: imagePath,
          caption: widget.captions[imagePath] ?? '',
          onDelete: () {
            widget.onImageDeleted(imagePath);
            Navigator.of(context).pop();
          },
          likeCount: widget.likes[imagePath] ?? 0, // Pass like count
        ),
      ),
    );
  }

  void _showDeleteOptions(int index) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width - 100,
        MediaQuery.of(context).size.height - 100,
        0,
        0,
      ),
      items: [
        PopupMenuItem(
          value: 'delete',
          child: Text('Delete'),
        ),
      ],
    ).then((value) {
      if (value == 'delete') {
        widget.onImageDeleted(widget.imagePaths[index]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Center(
            child: Text(
              'Tommy Gallery',
              style: AppFonts.title4(color: AppColors.grayscale100),
            ),
          ),
          SizedBox(height: 10),
          Text(
            '${widget.imagePaths.length} Pictures',
            style: AppFonts.body1(color: AppColors.grayscale90),
          ),
          Divider(),
          SizedBox(height: 20),
          widget.imagePaths.isNotEmpty
              ? Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: widget.imagePaths.length,
                    itemBuilder: (BuildContext context, int index) {
                      final imagePath = widget.imagePaths[index];

                      return GestureDetector(
                        onTap: () => _viewImage(imagePath),
                        onLongPress: () => _showDeleteOptions(index),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 160,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.file(
                                  File(imagePath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.pets,
                                    color: AppColors.secondary50,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    '${widget.likes[imagePath] ?? 0}',
                                    style:
                                        AppFonts.caption1(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              : Expanded(
                  child: Center(
                    child: Text(
                      'No Images Of Your Animals, Add Images To Post',
                      style: AppFonts.body1(color: AppColors.primary40),
                    ),
                  ),
                ),
          SizedBox(height: 10),
          Divider(),
          ElevatedButton(
            onPressed: _showImageSourceDialog,
            child: Text(
              'Add Photo',
              style: AppFonts.body1(color: AppColors.grayscale00),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.primary30,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
