import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';
import 'filtered_item_catalog.dart';

class PetItemCategories extends StatefulWidget {
  @override
  State<PetItemCategories> createState() => _PetItemCategoriesState();
}

class _PetItemCategoriesState extends State<PetItemCategories> {
  final Map<String, IconData> categoryIcons = {
    'Pet Food and Treats': Icons.grass,
    'Pet Accessories': Icons.spa,
    'Health and Wellness': Icons.spa,
    'Cleaning and Hygiene': Icons.cleaning_services,
    '⁠Travel and Transportation': Icons.local_shipping,
    'Housing and Habitat': Icons.house,
    'Identification and Safety': Icons.security,
    'Speciality Items': Icons.star_border,
    // Add more categories and their corresponding icons as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Filters',
          style: AppFonts.headline3(
            color: AppColors.grayscale90,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.016),
            decoration: BoxDecoration(
              color: AppColors.grayscale10,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Container(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.016),
              decoration: BoxDecoration(
                color: AppColors.grayscale10,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              'Categories',
              style: AppFonts.title5(
                color: AppColors.grayscale90,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: categoryIcons.length,
                itemBuilder: (context, index) {
                  final categoryName = categoryIcons.keys.elementAt(index);
                  final iconData = categoryIcons.values.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FilteredItemCatalog()),
                      );
                    },
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.016),
                        decoration: BoxDecoration(
                          color: AppColors.grayscale0,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(iconData,
                            size: 24, color: AppColors.primary30),
                      ),
                      title: Text(
                        categoryName,
                        style: AppFonts.body2(
                          color: AppColors.grayscale90,
                        ),
                      ),
                      trailing: const Icon(Icons.chevron_right,
                          color: AppColors.grayscale50), // Right arrow
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const FilteredItemCatalog()),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
