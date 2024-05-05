import 'package:flutter/material.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketplaceWidgets/package_details_page.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';

// Your PackageContainer widget
class PackageContainer extends StatelessWidget {
  final String packageName;
  final String packageAmount;

  const PackageContainer({
    required this.packageName,
    required this.packageAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grayscale00,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PackageDetails(
                packageName: packageName,
                packageAmount: packageAmount,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                packageName,
                style: AppFonts.body1(color: AppColors.grayscale90),
              ),
              const SizedBox(height: 13),
              Row(
                children: [
                  Text(
                    '${packageAmount} KD',
                    style: AppFonts.headline4(color: AppColors.primary40),
                  ),
                  const SizedBox(width: 8.0),
                  const Icon(Icons.chevron_right_outlined,
                      color: AppColors.primary30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ListView.builder widget to display list of packages
class PackageListWidget extends StatelessWidget {
  final List<Map<String, String>> packages;

  const PackageListWidget({required this.packages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: packages.length,
      itemBuilder: (context, index) {
        final package = packages[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: PackageContainer(
            packageName: package['packageName']!,
            packageAmount: package['packageAmount']!,
          ),
        );
      },
    );
  }
}
