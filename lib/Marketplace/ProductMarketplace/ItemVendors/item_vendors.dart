// Import necessary packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ItemVendors/add_store_modal_sheet.dart';
import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../../Lists.dart';
import '../Cart.dart';
import 'filter_shops_widget.dart';

import 'vendor_shop_details.dart';
import 'vendor_shop_items.dart';
import 'package:super_banners/super_banners.dart';

class ItemVendors extends StatefulWidget {
  @override
  State<ItemVendors> createState() => _ItemVendorsState();
}

class _ItemVendorsState extends State<ItemVendors> {
  List<Map<String, dynamic>> sortedProductVendorData = [];
  @override
  void initState() {
    super.initState();
    // Sort vendors by status
    sortedProductVendorData = List.from(ProductVendorData);
    sortedProductVendorData.sort((a, b) {
      if (a['shopstatus'] == 'Top Rated') {
        return -1;
      } else if (a['shopstatus'] == 'Verified' &&
          b['shopstatus'] != 'Top Rated') {
        return -1;
      } else if (a['shopstatus'] == 'New' &&
          b['shopstatus'] != 'Top Rated' &&
          b['shopstatus'] != 'Verified') {
        return -1;
      } else {
        return 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayscale00,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Vendors',
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
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.width * 0.1,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.grayscale10,
                  ),
                  child: const Icon(
                    Icons.add_business_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    showDragHandle: true,
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    builder: (BuildContext context) {
                      return SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.9, // Adjust height as needed
                          child: const AddYourStoreModal());
                    },
                  );
                }, // Call the signin function when the button is pressed
              ),
            ],
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.1,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary50,
                ),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 20,
                )),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            }, // Call the addAnimal function when the button is pressed
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                // 'Have a pet business & want to sell on Sulala?\nPlease click the Add Store button on top',
                'Have A Pet Business & Want To Sell On Sulala?\nPlease Click The Add Store Button On Top',
                style: AppFonts.body2(color: AppColors.grayscale90),
              ),
              const SizedBox(height: 10),
              const Divider(
                color: AppColors.grayscale10,
              ),
              const SizedBox(height: 10),
              Text(
                'List Of Shops',
                style: AppFonts.title5(color: AppColors.grayscale90),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          color: AppColors.grayscale20,
                        ),
                        color: Colors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: AppColors.grayscale50,
                          ),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                showFilterShopBottomSheet(context);
                              },
                              child: Icon(Icons.filter_list,
                                  size: 20, color: AppColors.primary30)),
                          prefixIcon:
                              Icon(Icons.search, color: AppColors.primary30),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75, // Adjust aspect ratio as needed
                ),
                itemCount: sortedProductVendorData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final vendor = sortedProductVendorData[index];
                  Color bannerColor;
                  Color textColor = AppColors.grayscale100;

                  // Assign banner color based on shop status
                  switch (vendor['shopstatus']) {
                    case 'Top Rated':
                      bannerColor = AppColors.primary30;
                      textColor = AppColors.grayscale00;
                      break;
                    case 'Verified':
                      bannerColor = Colors.blue.shade700;
                      textColor = AppColors.grayscale00;
                      break;
                    case 'New':
                      bannerColor = AppColors.secondary30;
                      break;
                    default:
                      bannerColor = Colors.transparent;
                  }

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VendorShopDetails(index: index),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.grayscale10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius:
                                          MediaQuery.of(context).size.width *
                                              0.14,
                                      backgroundColor: AppColors.grayscale10,
                                      backgroundImage: AssetImage(
                                        vendor['imageAsset'],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 2),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              size: 18,
                                              color: AppColors.secondary50,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              '4.9',
                                              style: AppFonts.caption2(
                                                  color: AppColors.grayscale90),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: Text(
                                    vendor['name'],
                                    style: AppFonts.body2(
                                        color: AppColors.grayscale100),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VendorShopItems(
                                                  index: index,
                                                )),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: AppColors.grayscale0,
                                      backgroundColor: AppColors.primary40,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    child: const Text('View Shop'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (bannerColor != Colors.transparent)
                            Positioned(
                              top: 0,
                              left: 0,
                              child: CornerBanner(
                                elevation: 5,
                                bannerPosition: CornerBannerPosition.topLeft,
                                bannerColor: bannerColor,
                                shadowColor: Colors.black.withOpacity(1),
                                child: Text(
                                  vendor['shopstatus'],
                                  style: AppFonts.caption1(color: textColor),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
