import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

class AnimalVendorAvatars extends StatelessWidget {
  final String imageAsset;
  final String name;

  const AnimalVendorAvatars(
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

class ProductVendorAvatars extends StatelessWidget {
  final String imageAsset;
  final String name;

  const ProductVendorAvatars(
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

class ServiceVendorAvatars extends StatelessWidget {
  final String imageAsset;
  final String name;

  const ServiceVendorAvatars(
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
