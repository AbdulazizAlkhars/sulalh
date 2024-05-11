import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Theme/Colors.dart';

import '../../../Theme/Fonts.dart';

class FilterItemBottomSheet extends StatefulWidget {
  @override
  _FilterItemBottomSheetState createState() => _FilterItemBottomSheetState();
}

class _FilterItemBottomSheetState extends State<FilterItemBottomSheet> {
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
                      style: AppFonts.body2(color: AppColors.grayscale00),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildFilterOption(
              context,
              'Price'.tr,
              PriceFilterWidget(),
            ),
            _buildFilterOption(
              context,
              'Sort By'.tr,
              ItemSortingFilterWidget(),
            ),
            _buildFilterOption(
              context,
              'Discount',
              DiscountFilterWidget(),
            ),
            _buildFilterOption(
              context,
              'Deals',
              DealFilterWidget(),
            ),
            _buildFilterOption(
              context,
              'Reviews'.tr,
              RatingsFilterWidget(),
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
        const Divider(),
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
  List<String> priceSorting = [
    'Low To High',
    'High To Low',
  ];
  List<bool> selectedPriceOptions = List<bool>.filled(6, false);

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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(priceSorting.length, (index) {
            bool isSelected = selectedPriceOptions[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      for (int i = 0; i < selectedPriceOptions.length; i++) {
                        if (i == index) {
                          selectedPriceOptions[i] =
                              true; // Set the selected option
                        } else {
                          selectedPriceOptions[i] =
                              false; // Clear other selections
                        }
                      }
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        priceSorting[index].tr,
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
                  height: 10,
                ),
              ],
            );
          }),
        ),
        const SizedBox(
          height: 10,
        ),
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

class ItemSortingFilterWidget extends StatefulWidget {
  @override
  _ItemSortingFilterWidgetState createState() =>
      _ItemSortingFilterWidgetState();
}

class _ItemSortingFilterWidgetState extends State<ItemSortingFilterWidget> {
  List<String> itemSorting = [
    'Ascending',
    'Descending',
  ];

  List<bool> selectedSortOptions = List<bool>.filled(6, false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(itemSorting.length, (index) {
        bool isSelected = selectedSortOptions[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  for (int i = 0; i < selectedSortOptions.length; i++) {
                    if (i == index) {
                      selectedSortOptions[i] = true; // Set the selected option
                    } else {
                      selectedSortOptions[i] = false; // Clear other selections
                    }
                  }
                });
              },
              child: Row(
                children: [
                  Text(
                    itemSorting[index].tr,
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

class DiscountFilterWidget extends StatefulWidget {
  @override
  _DiscountFilterWidgetState createState() => _DiscountFilterWidgetState();
}

class _DiscountFilterWidgetState extends State<DiscountFilterWidget> {
  List<String> discountOptions = [
    '10% Off or more',
    '25% Off or more',
    '35% Off or more',
    '50% Off or more',
    '60% Off or more',
    '70% Off or more',
  ];

  List<bool> selectedDiscountOptions = List<bool>.filled(6, false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(discountOptions.length, (index) {
        bool isSelected = selectedDiscountOptions[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  for (int i = 0; i < selectedDiscountOptions.length; i++) {
                    if (i == index) {
                      selectedDiscountOptions[i] =
                          true; // Set the selected option
                    } else {
                      selectedDiscountOptions[i] =
                          false; // Clear other selections
                    }
                  }
                });
              },
              child: Row(
                children: [
                  Text(
                    discountOptions[index].tr,
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

class DealFilterWidget extends StatefulWidget {
  @override
  _DealFilterWidgetState createState() => _DealFilterWidgetState();
}

class _DealFilterWidgetState extends State<DealFilterWidget> {
  List<String> dealOptions = [
    'Best Seller',
    'Sale',
    'Promoted',
  ];

  List<bool> selecteddealOptions = List<bool>.filled(6, false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(dealOptions.length, (index) {
        bool isSelected = selecteddealOptions[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  for (int i = 0; i < selecteddealOptions.length; i++) {
                    if (i == index) {
                      selecteddealOptions[i] = true; // Set the selected option
                    } else {
                      selecteddealOptions[i] = false; // Clear other selections
                    }
                  }
                });
              },
              child: Row(
                children: [
                  Text(
                    dealOptions[index].tr,
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

class RatingsFilterWidget extends StatefulWidget {
  @override
  _RatingsFilterWidgetState createState() => _RatingsFilterWidgetState();
}

class _RatingsFilterWidgetState extends State<RatingsFilterWidget> {
  List<bool> selectedRatingOptions = List<bool>.filled(4, false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(4, (index) {
        int starCount = index + 1;
        bool isSelected = selectedRatingOptions[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  for (int i = 0; i < selectedRatingOptions.length; i++) {
                    if (i == index) {
                      selectedRatingOptions[i] =
                          true; // Set the selected option
                    } else {
                      selectedRatingOptions[i] =
                          false; // Clear other selections
                    }
                  }
                });
              },
              child: Row(
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (starIndex) {
                        return Icon(
                          starIndex < starCount
                              ? Icons.star
                              : Icons.star_border,
                          color: AppColors.secondary60,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '$starCount ' + 'stars & above'.tr,
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
              height: 10,
            ),
          ],
        );
      }).reversed.toList(),
    );
  }
}

void showFilterItemBottomSheet(BuildContext context) {
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
        child: FilterItemBottomSheet(),
      );
    },
  );
}
