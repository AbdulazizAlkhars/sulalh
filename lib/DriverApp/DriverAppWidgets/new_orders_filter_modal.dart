import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hathera_demo/Theme/Colors.dart';

import '../../../Theme/Fonts.dart';
import '../DriverAppDummyData/driver_order_list.dart';
import 'time_slot_widget.dart';

class FilterNewOrdersModal extends StatefulWidget {
  final bool showPaymentStatusFilter;

  const FilterNewOrdersModal(
      {super.key, required this.showPaymentStatusFilter});
  @override
  _FilterNewOrdersModalState createState() => _FilterNewOrdersModalState();
}

class _FilterNewOrdersModalState extends State<FilterNewOrdersModal> {
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
                  'Filters',
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
                      'Apply Filters',
                      style: AppFonts.body2(color: AppColors.grayscale00),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (widget.showPaymentStatusFilter)
              _buildFilterOption(
                context,
                'Payment Status',
                PaymentStatusSortWidget(),
              ),
            _buildFilterOption(
              context,
              'Same Shops',
              OrdersOfSameShopsSortWidget(),
            ),
            _buildFilterOption(
              context,
              'Time Slots',
              TimeSlotFilterWidget(),
            ),
            _buildFilterOption(
              context,
              'Order Price',
              OrderPriceSortWidget(),
            ),
            _buildFilterOption(
              context,
              'Delivery Location',
              OrderLocationSortWidget(),
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
                  'Apply Filters',
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
        const Divider(
          color: AppColors.grayscale20,
        ),
      ],
    );
  }
}

class OrderPriceSortWidget extends StatefulWidget {
  @override
  _OrderPriceSortWidgetState createState() => _OrderPriceSortWidgetState();
}

class _OrderPriceSortWidgetState extends State<OrderPriceSortWidget> {
  List<String> priceSorting = [
    'Low To High',
    'High To Low',
  ];
  List<bool> selectedPriceOptions = List<bool>.filled(6, false);

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
                        priceSorting[index],
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
      ],
    );
  }
}

class PaymentStatusSortWidget extends StatefulWidget {
  @override
  _PaymentStatusSortWidgetState createState() =>
      _PaymentStatusSortWidgetState();
}

class _PaymentStatusSortWidgetState extends State<PaymentStatusSortWidget> {
  List<String> paymentStatusSorting = [
    'Paid',
    'Unpaid',
  ];
  List<bool> paymentStatusSortingOptions = List<bool>.filled(6, false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(paymentStatusSorting.length, (index) {
            bool isSelected = paymentStatusSortingOptions[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      for (int i = 0;
                          i < paymentStatusSortingOptions.length;
                          i++) {
                        if (i == index) {
                          paymentStatusSortingOptions[i] =
                              true; // Set the selected option
                        } else {
                          paymentStatusSortingOptions[i] =
                              false; // Clear other selections
                        }
                      }
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        paymentStatusSorting[index],
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
      ],
    );
  }
}

class OrdersOfSameShopsSortWidget extends StatefulWidget {
  @override
  _OrdersOfSameShopsSortWidgetState createState() =>
      _OrdersOfSameShopsSortWidgetState();
}

class _OrdersOfSameShopsSortWidgetState
    extends State<OrdersOfSameShopsSortWidget> {
  List<String> sameShopsSorting = [
    'Same Shops',
  ];
  List<bool> sameShopsSortingOptions = List<bool>.filled(6, false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(sameShopsSorting.length, (index) {
            bool isSelected = sameShopsSortingOptions[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      for (int i = 0; i < sameShopsSortingOptions.length; i++) {
                        if (i == index) {
                          sameShopsSortingOptions[i] =
                              true; // Set the selected option
                        } else {
                          sameShopsSortingOptions[i] =
                              false; // Clear other selections
                        }
                      }
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        sameShopsSorting[index],
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
      ],
    );
  }
}

class OrderLocationSortWidget extends StatefulWidget {
  @override
  _OrderLocationSortWidgetState createState() =>
      _OrderLocationSortWidgetState();
}

class _OrderLocationSortWidgetState extends State<OrderLocationSortWidget> {
  bool sameLocationSelected = false; // Track if "Same Location" is selected

  List<bool> selectedGovernorates = List<bool>.filled(6, false);
  Map<String, bool> selectedCities = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row for selecting "Same Location"
        GestureDetector(
          onTap: () {
            setState(() {
              sameLocationSelected = !sameLocationSelected;
              // Clear selections for governorates and cities if "Same Location" is selected
              selectedGovernorates = List<bool>.filled(6, false);
              selectedCities.clear();
            });
          },
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Same Location',
                  style: AppFonts.body2(
                    color: sameLocationSelected
                        ? AppColors.primary30
                        : Colors.black,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.064,
                height: MediaQuery.of(context).size.width * 0.064,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: sameLocationSelected
                        ? AppColors.primary20
                        : AppColors.grayscale30,
                    width: sameLocationSelected ? 6.0 : 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Center(
            child: Text(
          'Or, Filter By Location',
          style: AppFonts.body1(
            color: AppColors.primary20,
          ),
        )),
        ...List.generate(states.length, (index) {
          bool isSelected = selectedGovernorates[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGovernorates[index] = !isSelected;
                    // Clear selection for "Same Location" if any governorate is selected
                    if (isSelected) sameLocationSelected = false;
                  });
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        states[index],
                        style: AppFonts.body2(
                          color:
                              isSelected ? AppColors.primary30 : Colors.black,
                        ),
                      ),
                    ),
                    Icon(
                      isSelected ? Icons.expand_less : Icons.expand_more,
                      color: AppColors.primary30,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8), // Add spacing between city rows
              // Cities selection for the selected governorate
              if (isSelected)
                Column(
                  children: [
                    for (int i = 0; i < cities[states[index]]!.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Toggle city selection
                                  selectedCities[cities[states[index]]![i]] =
                                      !(selectedCities[
                                              cities[states[index]]![i]] ??
                                          false);
                                });
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      cities[states[index]]![i],
                                      style: AppFonts.body2(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.064,
                                    height: MediaQuery.of(context).size.width *
                                        0.064,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: selectedCities[cities[
                                                    states[index]]![i]] ??
                                                false
                                            ? AppColors.primary20
                                            : AppColors.grayscale30,
                                        width: selectedCities[cities[
                                                    states[index]]![i]] ??
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
      ],
    );
  }
}

class TimeSlotFilterWidget extends StatefulWidget {
  @override
  _TimeSlotFilterWidgettState createState() => _TimeSlotFilterWidgettState();
}

class _TimeSlotFilterWidgettState extends State<TimeSlotFilterWidget> {
  List<bool> selectedSortOptions = List<bool>.filled(6, false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8.0,
            runSpacing: 8.0,
            children: List.generate(
              timeSlots.length,
              (index) => TimeSlotChipsWidget(
                label: timeSlots[index],
                onTap: () {
                  // Do something when the chip is tapped
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
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
                    discountOptions[index],
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
                    dealOptions[index],
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
                    '$starCount stars & above',
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
