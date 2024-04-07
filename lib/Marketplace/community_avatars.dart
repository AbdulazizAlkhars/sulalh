import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

class CommunityAvatars extends StatelessWidget {
  final String imageAsset;
  final String name;

  const CommunityAvatars(
      {Key? key, required this.imageAsset, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage(imageAsset),
          ),
          SizedBox(height: 12),
          Text(
            name,
            style: AppFonts.caption2(color: AppColors.grayscale100),
          ),
        ],
      ),
    );
  }
}
