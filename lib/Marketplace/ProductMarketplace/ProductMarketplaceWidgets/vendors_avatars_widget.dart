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
            radius: 30,
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(imageAsset),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star,
                        size: 18,
                        color: AppColors.secondary50,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '4.9',
                        style: AppFonts.caption2(color: AppColors.grayscale90),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
