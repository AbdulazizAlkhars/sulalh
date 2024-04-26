import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketplaceWidgets/rating_summary_widget.dart';
import 'package:intl/intl.dart';
import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../../Lists.dart';
import '../Cart.dart';
import '../ratings_reviews.dart';
import 'vendor_shop_items.dart';

class VendorShopDetails extends StatefulWidget {
  final int index;

  VendorShopDetails({required this.index});

  @override
  State<VendorShopDetails> createState() => _VendorShopDetailsState();
}

class _VendorShopDetailsState extends State<VendorShopDetails> {
  @override
  Widget build(BuildContext context) {
    final vendor = ProductVendorData[widget.index];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Vendor Information',
          style: AppFonts.headline3(color: AppColors.grayscale90),
        ),
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(
              color: AppColors.grayscale10,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
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
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.15,
                  backgroundColor: AppColors.grayscale10,
                  backgroundImage: AssetImage(
                    vendor['imageAsset'],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Shop Name
              Center(
                child: Text(vendor['name'],
                    style: AppFonts.title4(color: AppColors.grayscale90)),
              ),
              const SizedBox(height: 20),
              // Shop Description (if available)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReviewsPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 70,
                        padding: const EdgeInsets.all(8),
                        // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.secondary10,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: AppColors.secondary50),
                                    const SizedBox(width: 5),
                                    Text(
                                      '4.5', // Replace with actual ratings
                                      style: AppFonts.caption2(
                                          color: AppColors.grayscale90),
                                    ),
                                  ],
                                ),
                                Text(
                                  '12 Reviews',
                                  style: AppFonts.body2(
                                      color: AppColors.grayscale90),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReviewsPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 70,
                        padding: const EdgeInsets.all(8),
                        // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.secondary10,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.shopping_bag,
                                        color: AppColors.secondary50),
                                    const SizedBox(width: 5),
                                    Text(
                                      '1000+', // Replace with actual ratings
                                      style: AppFonts.caption2(
                                          color: AppColors.grayscale90),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Orders',
                                  style: AppFonts.body2(
                                      color: AppColors.grayscale90),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Text('Contact Details',
                  style: AppFonts.title5(color: AppColors.grayscale90)),
              const SizedBox(height: 15),
              Row(
                children: [
                  if (vendor.containsKey('facebook'))
                    Text(
                      'Facebook',
                      style: AppFonts.body2(color: AppColors.grayscale70),
                    ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(
                        Icons.facebook,
                        color: AppColors.primary30,
                        size: 19,
                      ),
                      Text(
                        vendor['facebook'],
                        style: AppFonts.caption2(color: AppColors.primary30),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              if (vendor.containsKey('instagram'))
                Row(
                  children: [
                    Text(
                      'Instagram',
                      style: AppFonts.body2(color: AppColors.grayscale70),
                    ),
                    const Spacer(),
                    Text(
                      vendor['instagram'],
                      style: AppFonts.caption2(color: AppColors.primary30),
                    ),
                  ],
                ),
              const SizedBox(
                height: 10,
              ),
              if (vendor.containsKey('website'))
                Row(
                  children: [
                    Text(
                      'Website',
                      style: AppFonts.body2(color: AppColors.grayscale70),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.language,
                          color: AppColors.primary30,
                          size: 19,
                        ),
                        Text(
                          vendor['website'],
                          style: AppFonts.caption2(color: AppColors.primary30),
                        ),
                      ],
                    ),
                  ],
                ),
              const SizedBox(height: 25),
              Text('Description',
                  style: AppFonts.title5(color: AppColors.grayscale90)),
              const SizedBox(height: 15),
              if (vendor.containsKey('description'))
                Text(
                  vendor['description'],
                  style: AppFonts.body2(color: AppColors.grayscale90),
                ),
              const SizedBox(height: 25),
              Text('General Information',
                  style: AppFonts.title5(color: AppColors.grayscale90)),
              const SizedBox(height: 15),
              if (vendor.containsKey('address'))
                Row(
                  children: [
                    Text(
                      'Legal Address',
                      style: AppFonts.body2(color: AppColors.grayscale70),
                    ),
                    const Spacer(),
                    Flexible(
                      child: Text(
                        vendor['address'],
                        style: AppFonts.body2(color: AppColors.grayscale90),

                        textAlign: TextAlign.justify, // Center align text
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 15),
              Divider(
                color: AppColors.grayscale10,
              ),
              const SizedBox(height: 10),
              RatingSummaryWidget(reviews: reviews),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Reviews',
                      style: AppFonts.title4(color: AppColors.grayscale90),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReviewsPage()),
                        );
                      },
                      child: Text(
                        'View More',
                        style: AppFonts.body1(color: AppColors.primary40),
                      ),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  // Build each review item using data from the reviews list
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              reviews[index].reviewerName,
                              style: AppFonts.headline4(
                                  color: AppColors.grayscale90),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Row(
                              children: List.generate(
                                reviews[index].rating,
                                (i) => const Icon(Icons.star,
                                    size: 20, color: AppColors.secondary50),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              DateFormat(
                                'MMM d, yyyy',
                              ).format(reviews[index].date),
                              style: AppFonts.caption3(
                                  color: AppColors.grayscale90),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          reviews[index].reviewText,
                          style: AppFonts.body2(color: AppColors.grayscale90),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 4, // Adjust the elevation value as needed
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VendorShopItems(
                                          index: widget.index,
                                        )),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: AppColors.primary50,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 24),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: Text(
                              'Shop',
                              style:
                                  AppFonts.body1(color: AppColors.grayscale0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
