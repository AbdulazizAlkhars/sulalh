import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketPlaceWidgets/package_details_page.dart';

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
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.grayscale0,
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
              Expanded(
                child: Text(
                  packageName,
                  style: AppFonts.body1(color: AppColors.grayscale90),
                ),
              ),
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
          child: Dismissible(
            key: Key(package['packageName']!), // Unique key for each item
            direction: DismissDirection.endToStart,
            background: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.error100),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            confirmDismiss: (direction) async {
              // Show confirmation dialog
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    surfaceTintColor: Colors.white,
                    backgroundColor: AppColors.grayscale00,
                    title: Text(
                      "Delete The Package?".tr,
                      style: AppFonts.headline2(color: AppColors.primary40),
                    ),
                    content: Text(
                      "Are you sure you want to delete this package?".tr,
                      style: AppFonts.body2(color: AppColors.grayscale100),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text(
                          "Cancel".tr,
                          style: AppFonts.body1(color: AppColors.grayscale100),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text(
                          "Delete".tr,
                          style: AppFonts.body1(
                              color: const Color.fromARGB(255, 255, 62, 44)),
                        ),
                      ),
                    ],
                  );
                },
              );
            },

            child: PackageContainer(
              packageName: package['packageName']!,
              packageAmount: package['packageAmount']!,
            ),
          ),
        );
      },
    );
  }
}
