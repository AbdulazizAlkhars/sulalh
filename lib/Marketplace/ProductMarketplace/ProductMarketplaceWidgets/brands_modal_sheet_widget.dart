import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../../Lists.dart';

class BrandsModal extends StatefulWidget {
  const BrandsModal({Key? key}) : super(key: key);

  @override
  _BrandsModalState createState() => _BrandsModalState();
}

class _BrandsModalState extends State<BrandsModal> {
  String? selectedBrand;
  bool isExpanded = false;
  late TextEditingController _searchController;
  List<Map<String, dynamic>> filteredAnimals = [];
  int selectedIndex = -1;
  int selectedSpeciesIndex = -1;
  String selectedBreed = '';

  @override
  void initState() {
    super.initState();
    filteredAnimals = myAnimals;
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      filteredAnimals = myAnimals
          .where((animal) => animal['name']
              .toString()
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Choose A Brand'.tr,
                  style: AppFonts.title4(color: AppColors.grayscale90),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: AppColors.primary50,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Text(
                      'Select Brand'.tr,
                      style: AppFonts.body1(color: AppColors.grayscale00),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                border:
                    Border.all(color: AppColors.grayscale20), // Outline color
                color: Colors.white, // Background color
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search The Brand".tr,
                  hintStyle: TextStyle(
                      color: AppColors.grayscale50), // Change hint text color
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.primary40,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 470,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: AppColors.grayscale20),
                color: AppColors.grayscale00,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: petProductBrands.length,
                    itemBuilder: (context, index) {
                      final petBrand = petProductBrands[index];
                      bool isSelected = selectedBrand == petBrand['name'];
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedBrand = petBrand['name'];
                            });
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.07,
                                backgroundImage:
                                    AssetImage(petBrand['imageAsset']),
                              ),
                              const SizedBox(width: 15.0),
                              Expanded(
                                child: Text(
                                  petBrand['name'],
                                  style: AppFonts.body2(
                                    color: AppColors.grayscale90,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.064, // Adjust the width as needed
                                  height: MediaQuery.of(context).size.width *
                                      0.064, // Adjust the height as needed
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSelected
                                          ? AppColors.primary20
                                          : AppColors.grayscale30,
                                      width: isSelected ? 6.0 : 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: AppColors.grayscale20,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.transparent,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.primary50,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'Select Brand'.tr,
                  style: AppFonts.body1(color: AppColors.grayscale0),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
