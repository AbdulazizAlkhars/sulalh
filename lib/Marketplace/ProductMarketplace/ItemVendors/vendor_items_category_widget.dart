import 'package:flutter/material.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../../Lists.dart';

class VendorItemCategory extends StatefulWidget {
  const VendorItemCategory({Key? key}) : super(key: key);

  @override
  _VendorItemCategoryState createState() => _VendorItemCategoryState();
}

class _VendorItemCategoryState extends State<VendorItemCategory> {
  Set<String> selectedCategories = Set();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Category Of Items',
            style: AppFonts.title5(
              color: AppColors.grayscale90,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categoryIcons.length,
              itemBuilder: (context, index) {
                final categoryName = categoryIcons.keys.elementAt(index);
                final iconData = categoryIcons.values.elementAt(index);
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.016),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(iconData, size: 24, color: AppColors.primary30),
                  ),
                  title: Text(
                    categoryName,
                    style: AppFonts.body2(
                      color: AppColors.grayscale90,
                    ),
                  ),
                  trailing: Checkbox(
                    activeColor: AppColors.primary30,
                    value: selectedCategories.contains(categoryName),
                    onChanged: (value) {
                      setState(() {
                        if (value != null && value) {
                          selectedCategories.add(categoryName);
                        } else {
                          selectedCategories.remove(categoryName);
                        }
                      });
                    },
                  ),
                  onTap: () {
                    setState(() {
                      if (selectedCategories.contains(categoryName)) {
                        selectedCategories.remove(categoryName);
                      } else {
                        selectedCategories.add(categoryName);
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Vendor Item Category')),
      body: VendorItemCategory(),
    ),
  ));
}
