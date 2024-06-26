import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Theme/Colors.dart';

import '../../../Theme/Fonts.dart';
import '../../Lists.dart';

class FilterShopBottomSheet extends StatefulWidget {
  @override
  _FilterShopBottomSheetState createState() => _FilterShopBottomSheetState();
}

class _FilterShopBottomSheetState extends State<FilterShopBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filters'.tr,
                  style: AppFonts.title3(color: AppColors.grayscale90),
                  textAlign: TextAlign.center,
                ),
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
                      'Apply Filters'.tr,
                      style: AppFonts.caption1(color: AppColors.grayscale00),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildFilterOption(
              context,
              'Animal'.tr,
              const Column(
                children: [
                  AnimalFilterWidget(),
                  Divider(
                    color: AppColors.grayscale20,
                  ),
                ],
              ),
            ),
            _buildFilterOption(
              context,
              'Sort By'.tr,
              Column(
                children: [
                  ShopSortingFilterWidget(),
                  const Divider(
                    color: AppColors.grayscale20,
                  ),
                ],
              ),
            ),
            _buildFilterOption(
              context,
              'Shops'.tr,
              Column(
                children: [
                  ShopStatusFilterWidget(),
                  const Divider(
                    color: AppColors.grayscale20,
                  ),
                ],
              ),
            ),
            _buildFilterOption(
              context,
              'Location'.tr,
              Column(
                children: [
                  LocationFilterWidget(),
                  const Divider(
                    color: AppColors.grayscale20,
                  ),
                ],
              ),
            ),
            _buildFilterOption(
              context,
              'Price'.tr,
              Column(
                children: [
                  PriceFilterWidget(),
                  const Divider(
                    color: AppColors.grayscale20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.transparent,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
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
                  'Apply Filters'.tr,
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

  Widget _buildFilterOption(
      BuildContext context, String title, Widget subContents) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: AppFonts.title5(
              color: AppColors.grayscale90,
            ),
          ),
        ),
        subContents,
      ],
    );
  }
}

class AnimalFilterWidget extends StatefulWidget {
  const AnimalFilterWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimalFilterWidgetState createState() => _AnimalFilterWidgetState();
}

class _AnimalFilterWidgetState extends State<AnimalFilterWidget> {
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: animalSpecies.asMap().entries.map((entry) {
              final int index = entry.key;
              final animal = entry.value;
              final name = animal['name'];
              final imageAsset = animal['imageAsset'];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: selectedIndex == index
                                  ? AppColors.primary20.withOpacity(
                                      0.5) // Adjust opacity as needed
                                  : Colors.transparent,
                              spreadRadius: 5, // Adjust spread radius as needed
                              blurRadius: 2, // Adjust blur radius as needed
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          backgroundImage: AssetImage(imageAsset),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Flexible(
                        child: Text(
                          name,
                          style: const TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class PriceFilterWidget extends StatefulWidget {
  @override
  _PriceFilterWidgetState createState() => _PriceFilterWidgetState();
}

class _PriceFilterWidgetState extends State<PriceFilterWidget> {
  double _minPrice = 0;
  double _maxPrice = 50;
  bool _applyPriceFilter = false;
  int selectedIndex = -1;

  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _minPriceController.text = _minPrice.toString();
    _maxPriceController.text = _maxPrice.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Price Range'.tr,
              style: AppFonts.headline4(
                color: AppColors.grayscale90,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  _applyPriceFilter = !_applyPriceFilter;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.064,
                height: MediaQuery.of(context).size.width * 0.064,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _applyPriceFilter
                        ? AppColors.primary20
                        : AppColors.grayscale30,
                    width: _applyPriceFilter ? 6.0 : 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border:
                      Border.all(color: AppColors.grayscale20), // Outline color
                  color: Colors.white, // Background color
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: TextFormField(
                    controller: _minPriceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Min Price".tr,
                      hintStyle: TextStyle(
                          color:
                              AppColors.grayscale50), // Change hint text color

                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _minPrice = double.parse(value);
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border:
                      Border.all(color: AppColors.grayscale20), // Outline color
                  color: Colors.white, // Background color
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: TextFormField(
                    controller: _maxPriceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Max Price".tr,
                      hintStyle: TextStyle(
                          color:
                              AppColors.grayscale50), // Change hint text color

                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          _maxPrice = 50; // Set to the maximum allowed value
                        });
                      } else {
                        setState(() {
                          _maxPrice = double.parse(value);
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        RangeSlider(
          activeColor: AppColors.primary20,
          values: RangeValues(_minPrice, _maxPrice),
          min: 0,
          max: 50,
          onChanged: (RangeValues values) {
            setState(() {
              _minPrice = values.start.roundToDouble();
              _maxPrice = values.end.roundToDouble();
              _minPriceController.text = _minPrice.toString();
              _maxPriceController.text = _maxPrice.toString();
            });
          },
        ),
      ],
    );
  }
}

class LocationFilterWidget extends StatefulWidget {
  @override
  _LocationFilterWidgetState createState() => _LocationFilterWidgetState();
}

class _LocationFilterWidgetState extends State<LocationFilterWidget> {
  List<bool> selectedGovernorates = List<bool>.filled(6, false);

  Map<String, bool> selectedCities = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(governorates.length, (index) {
        bool isSelected = selectedGovernorates[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedGovernorates[index] = !isSelected;
                });
              },
              child: Row(
                children: [
                  Text(
                    governorates[index].tr,
                    style: AppFonts.body2(
                      color: isSelected ? AppColors.primary30 : Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    isSelected ? Icons.expand_less : Icons.expand_more,
                    color: isSelected ? AppColors.primary30 : Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8), // Add spacing between city rows
            if (isSelected)
              Column(
                children: [
                  for (int i = 0;
                      i < citiesByGovernorate[governorates[index]]!.length;
                      i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                // Toggle city selection
                                selectedCities[citiesByGovernorate[
                                        governorates[index]]![i]] =
                                    !(selectedCities[citiesByGovernorate[
                                            governorates[index]]![i]] ??
                                        false);
                              });
                            },
                            child: Row(
                              children: [
                                Text(
                                  citiesByGovernorate[governorates[index]]![i]
                                      .tr,
                                  style: AppFonts.body2(
                                    color: Colors.black,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.064,
                                  height:
                                      MediaQuery.of(context).size.width * 0.064,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: selectedCities[citiesByGovernorate[
                                                  governorates[index]]![i]] ??
                                              false
                                          ? AppColors.primary20
                                          : AppColors.grayscale30,
                                      width: selectedCities[citiesByGovernorate[
                                                  governorates[index]]![i]] ??
                                              false
                                          ? 6.0
                                          : 1.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                              height: 8), // Add spacing between city rows
                        ],
                      ),
                    ),
                ],
              ),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      }),
    );
  }
}

class ShopStatusFilterWidget extends StatefulWidget {
  @override
  _ShopStatusFilterWidgetState createState() => _ShopStatusFilterWidgetState();
}

class _ShopStatusFilterWidgetState extends State<ShopStatusFilterWidget> {
  List<String> shopStatus = [
    'Top Rated',
    'Verified',
    'New',
  ];

  // Define rating thresholds for each shop status
  Map<String, double> ratingThresholds = {
    'Top Rated': 4.0,
    'Verified': 3.0,
  };

  List<bool> selecteddealOptions = List<bool>.filled(6, false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(shopStatus.length, (index) {
        bool isSelected = selecteddealOptions[index];
        String status = shopStatus[index];
        double threshold =
            ratingThresholds[status] ?? 0.0; // Get threshold for status
        bool isNew = status == 'New';
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selecteddealOptions[index] = !isSelected;
                });
              },
              child: Row(
                children: [
                  Text(
                    status.tr,
                    style: AppFonts.body2(
                      color: AppColors.grayscale90,
                    ),
                  ),
                  if (!isNew) // Render "Above" text if not new
                    Text(
                      'Above'.tr,
                      style: AppFonts.body2(
                        color: AppColors.grayscale90,
                      ),
                    ),
                  if (!isNew) // Render rating threshold if not new
                    Text(
                      ' ${threshold.toStringAsFixed(1)} ' + 'Stars'.tr,
                      style: AppFonts.body2(
                        color: AppColors.grayscale90,
                      ),
                    ),
                  if (!isNew) // Render star icon if not new
                    Icon(
                      Icons.star,
                      color: AppColors.secondary60,
                    ),
                  const Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.064,
                    height: MediaQuery.of(context).size.width * 0.064,
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
                ],
              ),
            ),
            const SizedBox(
              height: 10, // Adjust the height as needed
            ),
          ],
        );
      }),
    );
  }
}

class ShopSortingFilterWidget extends StatefulWidget {
  @override
  _ShopSortingFilterWidgetState createState() =>
      _ShopSortingFilterWidgetState();
}

class _ShopSortingFilterWidgetState extends State<ShopSortingFilterWidget> {
  List<String> shopSorting = [
    'Ascending',
    'Descending',
  ];

  List<bool> selecteddealOptions = List<bool>.filled(6, false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(shopSorting.length, (index) {
        bool isSelected = selecteddealOptions[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selecteddealOptions[index] = !isSelected;
                });
              },
              child: Row(
                children: [
                  Text(
                    shopSorting[index].tr,
                    style: AppFonts.body2(
                      color: AppColors.grayscale90,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.064,
                    height: MediaQuery.of(context).size.width * 0.064,
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
                ],
              ),
            ),
            const SizedBox(
              height: 10, // Adjust the height as needed
            ),
          ],
        );
      }),
    );
  }
}

// class RatingsFilterWidget extends StatefulWidget {
//   @override
//   _RatingsFilterWidgetState createState() => _RatingsFilterWidgetState();
// }

// class _RatingsFilterWidgetState extends State<RatingsFilterWidget> {
//   List<bool> selectedOptions = List<bool>.filled(4, false);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: List.generate(4, (index) {
//         int starCount = index + 1;
//         bool isSelected = selectedOptions[index];
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedOptions[index] = !isSelected;
//                 });
//               },
//               child: Row(
//                 children: [
//                   Row(
//                     children: List.generate(
//                       5,
//                       (starIndex) {
//                         return Icon(
//                           starIndex < starCount
//                               ? Icons.star
//                               : Icons.star_border,
//                           color: AppColors.secondary60,
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(width: 5),
//                   Text(
//                     '$starCount stars & above',
//                     style: AppFonts.body2(
//                       color: AppColors.grayscale90,
//                     ),
//                   ),
//                   const Spacer(),
//                   Container(
//                     width: MediaQuery.of(context).size.width * 0.064,
//                     height: MediaQuery.of(context).size.width * 0.064,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: isSelected
//                             ? AppColors.primary20
//                             : AppColors.grayscale30,
//                         width: isSelected ? 6.0 : 1.0,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//           ],
//         );
//       }).reversed.toList(),
//     );
//   }
// }

void showFilterShopBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    showDragHandle: true,
    isScrollControlled:
        true, // Set to true to allow the bottom sheet to occupy full screen height
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height:
            MediaQuery.of(context).size.height * 0.8, // Adjust height as needed
        child: FilterShopBottomSheet(),
      );
    },
  );
}
