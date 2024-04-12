import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:hathera_demo/Marketplace/MyOrders/rate_item.dart';

import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';

import 'order_status_chip_widget.dart';
import 'package:intl/intl.dart';

class MyOrderDetails extends StatefulWidget {
  final String status;
  final List<String> itemImages;
  final List<String> itemNames;
  final List<String> itemPrice;
  final int numberOfItems;
  final DateTime date;
  final DateTime deliverydate;

  const MyOrderDetails(
      {super.key,
      required this.status,
      required this.numberOfItems,
      required this.itemImages,
      required this.itemNames,
      required this.date,
      required this.deliverydate,
      required this.itemPrice});

  @override
  State<MyOrderDetails> createState() => _MyOrderDetailsState();
}

class _MyOrderDetailsState extends State<MyOrderDetails> {
  late double totalPrice;

  @override
  void initState() {
    super.initState();
    totalPrice = calculateTotalPrice();
  }

  double calculateTotalPrice() {
    return widget.itemPrice
        .map((price) => double.parse(price)) // Convert prices to double
        .fold(0, (sum, price) => sum + price); // Sum up all prices
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('MMMM d, yyyy').format(widget.date);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          'Order ID',
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                'Order Details',
                style: AppFonts.title4(
                  color: AppColors.grayscale90,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Order',
                    style: AppFonts.body2(
                      color: AppColors.grayscale90,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '##ID',
                    style: AppFonts.body1(
                      color: AppColors.grayscale90,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    'Order Date',
                    style: AppFonts.body2(
                      color: AppColors.grayscale90,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    formattedDate,
                    style: AppFonts.body1(
                      color: AppColors.grayscale90,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    'Order Total',
                    style: AppFonts.body2(
                      color: AppColors.grayscale90,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '\$${totalPrice.toStringAsFixed(2)}',
                    style: AppFonts.body1(
                      color: AppColors.grayscale90,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    'Shipping',
                    style: AppFonts.body2(
                      color: AppColors.grayscale90,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '##Shipping Price',
                    style: AppFonts.body1(
                      color: AppColors.grayscale90,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Total',
                    style: AppFonts.headline3(
                      color: AppColors.grayscale90,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '\$${totalPrice.toStringAsFixed(2)}',
                    style: AppFonts.headline3(
                      color: AppColors.primary40,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Delivery Details',
                    style: AppFonts.title4(
                      color: AppColors.grayscale90,
                    ),
                  ),
                  Spacer(),
                  StatusChip(status: widget.status),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Will be delivered to a pickup point on February 25th.',
                style: AppFonts.body1(
                  color: AppColors.primary20,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '80155 Mohr Forge, Leighannport, AL 54874',
                style: AppFonts.body2(
                  color: AppColors.grayscale90,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Items',
                style: AppFonts.title4(
                  color: AppColors.grayscale90,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    widget.numberOfItems.toString(),
                    style: AppFonts.caption2(
                      color: AppColors.grayscale60,
                    ),
                  ),
                  SizedBox(
                      width: 5), // Add space between the number and the text
                  Text(
                    'Items',
                    style: AppFonts.caption2(
                      color: AppColors.grayscale60,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.itemImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              widget.itemImages[index],
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.itemNames[index],
                                    style: AppFonts.body2(
                                      color: AppColors.grayscale90,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    '\$${widget.itemPrice[index]}',
                                    style: AppFonts.headline4(
                                      color: AppColors.grayscale90,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (widget.status ==
                            'Delivered') // Show button if status is 'Created'
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => RateItemPage(
                                              itemName: widget.itemNames[index],
                                              itemImage:
                                                  widget.itemImages[index],
                                              itemPrice:
                                                  widget.itemPrice[index],
                                            ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: AppColors.grayscale10,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 24),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                      child: Text(
                                        'Rate This Item',
                                        style: AppFonts.body1(
                                            color: AppColors.grayscale90),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.status == 'Delivered' ||
                      widget.status == 'Cancelled')
                    Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColors.grayscale10,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Text(
                          'Re Order',
                          style: AppFonts.body1(color: AppColors.grayscale90),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.grayscale10,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        'Contact Support',
                        style: AppFonts.body1(color: AppColors.grayscale90),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (widget.status != 'Delivered' &&
                      widget.status != 'Cancelled')
                    Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColors.grayscale10,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: AppFonts.body1(color: AppColors.error100),
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
