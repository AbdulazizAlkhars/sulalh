import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hathera_demo/Theme/Colors.dart';

import '../../../Theme/Fonts.dart';

class FilterBottomSheet extends StatefulWidget {
  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final bool _isPriceExpanded = false;
  final bool _isDiscountExpanded = false;
  final bool _isDealsExpanded = false;
  final bool _isReviewsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filters',
              style: AppFonts.title3(color: AppColors.grayscale90),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            _buildFilterOption(
              context,
              'Price',
              PriceFilterWidget(),
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
              'Reviews',
              RatingsFilterWidget(),
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
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: AppFonts.title5(
              color: AppColors.grayscale90,
            ),
          ),
        ),
        subContents,
        Divider(),
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
              'Price Range',
              style: AppFonts.headline4(
                color: AppColors.grayscale90,
              ),
            ),
            Spacer(),
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
        SizedBox(height: 10),
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
                    decoration: const InputDecoration(
                      labelText: "Min Price",
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
                    decoration: const InputDecoration(
                      labelText: "Max Price",
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

  List<bool> selectedOptions = List<bool>.filled(6, false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(discountOptions.length, (index) {
        bool isSelected = selectedOptions[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedOptions[index] = !isSelected;
                });
              },
              child: Row(
                children: [
                  Text(
                    discountOptions[index],
                    style: AppFonts.body2(
                      color: AppColors.grayscale90,
                    ),
                  ),
                  Spacer(),
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
            SizedBox(
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
                  selecteddealOptions[index] = !isSelected;
                });
              },
              child: Row(
                children: [
                  Text(
                    dealOptions[index],
                    style: AppFonts.body2(
                      color: AppColors.grayscale90,
                    ),
                  ),
                  Spacer(),
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
            SizedBox(
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
  List<bool> selectedOptions = List<bool>.filled(4, false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(4, (index) {
        int starCount = index + 1;
        bool isSelected = selectedOptions[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedOptions[index] = !isSelected;
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
                  SizedBox(width: 5),
                  Text(
                    '$starCount stars & above',
                    style: AppFonts.body2(
                      color: AppColors.grayscale90,
                    ),
                  ),
                  Spacer(),
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
            SizedBox(
              height: 10,
            ),
          ],
        );
      }).reversed.toList(),
    );
  }
}

void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    showDragHandle: true,
    isScrollControlled:
        true, // Set to true to allow the bottom sheet to occupy full screen height
    context: context,
    builder: (BuildContext context) {
      return Container(
        height:
            MediaQuery.of(context).size.height * 0.8, // Adjust height as needed
        child: FilterBottomSheet(),
      );
    },
  );
}
