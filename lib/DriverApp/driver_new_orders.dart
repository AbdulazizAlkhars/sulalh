import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hathera_demo/DriverApp/driver_order_list.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/product_details_page.dart';

import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';
import '../Marketplace/AnimalMarketPlace/animal_details_page.dart';
import '../Marketplace/Lists.dart';
import '../Marketplace/ProductMarketplace/ItemVendors/vendor_item_animal_category_widget.dart';
import '../Marketplace/ProductMarketplace/ProductMarketplaceWidgets/community_avatars_widget.dart';
import '../Marketplace/ProductMarketplace/marketplace_items.dart';
import '../Marketplace/ProductMarketplace/vendors_avatars_widget.dart';

class DriverNewOrders extends StatefulWidget {
  const DriverNewOrders({Key? key}) : super(key: key);

  @override
  State<DriverNewOrders> createState() => _DriverNewOrdersState();
}

class _DriverNewOrdersState extends State<DriverNewOrders> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text('New Orders',
                      style: AppFonts.title4(color: AppColors.grayscale90)),
                ),
                Expanded(
                  flex: 0,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        showDragHandle: true,
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (BuildContext context) {
                          return VendorAnimalCategory();
                        },
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.filter_list,
                          color: AppColors.primary50,
                        ),
                        Text(
                          'Filters',
                          style: AppFonts.body1(color: AppColors.primary40),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2, // Adjust aspect ratio as needed
            ),
            itemCount: DriverNewOrderList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final neworder = DriverNewOrderList[index];
              return GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors
                          .grayscale0, // Background color for the container
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      neworder.deliveryslot,
                                      style: AppFonts.title3(
                                          color: AppColors.primary50),
                                    ),
                                    Spacer(),
                                    Text(
                                      neworder.deliverydate,
                                      style: AppFonts.title5(
                                          color: AppColors.grayscale90),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          color: AppColors.primary20,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          neworder.customername,
                                          style: AppFonts.headline4(
                                              color: AppColors.primary20),
                                        ),
                                        const SizedBox(width: 3),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.delivery_dining,
                                          color: AppColors.grayscale90,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          neworder.customeraddress,
                                          style: AppFonts.headline4(
                                              color: AppColors.grayscale90),
                                        ),
                                        const SizedBox(width: 3),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 3),
                                Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      neworder.shopname,
                                      style: AppFonts.title5(
                                          color: AppColors.grayscale90),
                                    ),
                                    Spacer(),
                                    Text(
                                      neworder.ordernumber,
                                      style: AppFonts.body1(
                                          color: AppColors.grayscale90),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 3),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
