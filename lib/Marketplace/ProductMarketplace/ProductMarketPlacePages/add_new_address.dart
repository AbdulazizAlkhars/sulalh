import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketPlaceWidgets/textfield_widget.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../../Lists.dart';
import '../ProductMarketplaceWidgets/textfield_suggestion_widget.dart';

class AddNewAddress extends StatefulWidget {
  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  bool mapTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Select Address'.tr,
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
      body: Container(
        color: AppColors.grayscale0, // Replace with your map widget
        child: const Center(
          child: Text(
            'Map Placeholder',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 2,
        child: IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: AppColors.grayscale20),
              color: AppColors.grayscale00,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name Your Address'.tr,
                        style: AppFonts.caption2(
                          color: AppColors.grayscale90,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFieldWidget(
                        hintText: 'Enter Name Of Your Address'.tr,
                        onChanged: (value) {
                          // Handle search query change
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Name Of Your Area",
                        style: AppFonts.caption2(
                          color: AppColors.grayscale90,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SuggestableTextField(
                        hintText: 'Enter Area',
                        suggestions: citiesByGovernorate.values
                            .expand((cities) => cities)
                            .toList(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Block & Street'.tr,
                        style: AppFonts.caption2(
                          color: AppColors.grayscale90,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFieldWidget(
                        hintText: 'Enter Block & Street'.tr,
                        onChanged: (value) {
                          // Handle search query change
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Building/Apartment, Floor etc.,'.tr,
                        style: AppFonts.caption2(
                          color: AppColors.grayscale90,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFieldWidget(
                        hintText: 'Enter Building/Apartment, Floor etc.,'.tr,
                        onChanged: (value) {
                          // Handle search query change
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Additional Information'.tr,
                        style: AppFonts.caption2(
                          color: AppColors.grayscale90,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFieldWidget(
                        hintText: 'Enter Additional Information'.tr,
                        onChanged: (value) {
                          // Handle search query change
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        child: Text(
                          'Confirm Address'.tr,
                          style: AppFonts.body1(color: AppColors.grayscale0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
