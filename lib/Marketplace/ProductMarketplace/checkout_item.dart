import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketplaceWidgets/change_address_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';
import '../Lists.dart';
import 'ProductMarketplaceWidgets/checkout_cart_items_widget.dart';
import 'ProductMarketplaceWidgets/credit_debit_cards_widget.dart';
import 'ProductMarketplaceWidgets/delivery_time_slots_chips_widget.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatefulWidget {
  final double totalAmount;
  final double totalDiscount;
  final double totalGrossAmount;

  const CheckoutPage(
      {super.key,
      required this.totalAmount,
      required this.totalDiscount,
      required this.totalGrossAmount});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int selectedIndex = -1;
  DateTime selectedDate = DateTime.now(); // Initialize with today's date

  void _showDeliveryTimePicker(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      showDragHandle: true,
      isScrollControlled:
          true, // Allow the bottom sheet to occupy full screen height
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Delivery Date',
                  style: AppFonts.title4(color: AppColors.grayscale90),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'You can select any day within the next 5 days for your delivery.',
                  style: AppFonts.body2(color: AppColors.grayscale90),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 270,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: AppColors.grayscale20),
                    color: AppColors.grayscale00,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        DateTime date =
                            DateTime.now().add(Duration(days: index));
                        bool isSelected = selectedDate.year == date.year &&
                            selectedDate.month == date.month &&
                            selectedDate.day == date.day;

                        String dateString = DateFormat('MMMM d').format(date);
                        if (index == 0) {
                          dateString = 'Today, ' + dateString;
                        } else {
                          dateString = DateFormat('EEEE, MMMM d').format(date);
                        }

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDate =
                                  DateTime(date.year, date.month, date.day);
                            });
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: isSelected
                                    ? AppColors.primary30
                                    : Colors.transparent,
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                              child: Text(dateString,
                                  style: AppFonts.headline4(
                                      color: isSelected
                                          ? AppColors.grayscale0
                                          : AppColors.grayscale90)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Checkout',
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
      body: Scrollbar(
        radius: Radius.circular(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Your Order',
                    style: AppFonts.title5(
                      color: AppColors.grayscale90,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      'Items',
                      style: AppFonts.body2(
                        color: AppColors.grayscale90,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${widget.totalGrossAmount.toStringAsFixed(2)} KD',
                      style: AppFonts.body1(
                        color: AppColors.grayscale90,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Discount',
                      style: AppFonts.body2(
                        color: AppColors.grayscale90,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${widget.totalDiscount.toStringAsFixed(2)} KD',
                      style: AppFonts.body1(
                        color: AppColors.grayscale90,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Delivery',
                      style: AppFonts.body2(
                        color: AppColors.grayscale90,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Free',
                      style: AppFonts.body1(
                        color: AppColors.primary20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
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
                      '${widget.totalAmount.toStringAsFixed(2)} KD',
                      style: AppFonts.headline3(
                        color: AppColors.primary40,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: AppColors.grayscale10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Delivery Address',
                  style: AppFonts.title5(
                    color: AppColors.grayscale90,
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.primary50,
                      ),
                      title: Text(
                        '10559 Ras Al Khaima, Ras Al Khaima',
                        style: AppFonts.body1(
                          color: AppColors.grayscale90,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _showChangeAddress(context);
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColors.grayscale10,
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Text(
                          'Change Address',
                          style: AppFonts.body1(color: AppColors.grayscale90),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: AppColors.grayscale10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Schedule The Delivery',
                          style: AppFonts.title5(
                            color: AppColors.grayscale90,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: AppColors.secondary30),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 25.0,
                              ),
                              child: Text(
                                selectedDate.year == DateTime.now().year &&
                                        selectedDate.month ==
                                            DateTime.now().month &&
                                        selectedDate.day == DateTime.now().day
                                    ? 'Today, ${DateFormat('MMM d').format(selectedDate!)}'
                                    : DateFormat('EEEE, MMM d')
                                        .format(selectedDate!),
                                style: AppFonts.body2(
                                    color: AppColors.grayscale100),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            _showDeliveryTimePicker(context);
                          },
                          child: const Icon(Icons.edit_calendar_outlined,
                              color: AppColors.primary30),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: List.generate(
                          deliverySlots.length,
                          (index) => DeliverySlotChipsWidget(
                            label: deliverySlots[index],
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
                ),
                Divider(
                  color: AppColors.grayscale10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Cart Items',
                  style: AppFonts.title5(
                    color: AppColors.grayscale90,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: AppColors.grayscale20),
                    color: AppColors.grayscale00,
                  ),
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Scrollbar(
                      radius: const Radius.circular(20),
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0), // Add space between cards
                            child: CheckOutCartCard(
                              imagePath: item.imagePath,
                              productName: item.productName,
                              price: item.price,
                              quantity: item.quantity,
                              onQuantityChanged: (newQuantity) {},
                              discountprice: item.discountedPrice,
                              onDelete: () => (item),
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
                Divider(
                  color: AppColors.grayscale10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Special Instruction (Optional)',
                  style: AppFonts.title5(
                    color: AppColors.grayscale90,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust border radius here
                    border: Border.all(
                      color: AppColors.grayscale20, // Outline color
                    ),
                    color: Colors.white, // Background color
                  ),
                  child: TextField(
                    // style: TextStyle(fontSize: 14.0), // Adjust font size here
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Enter Special Instructions',
                      contentPadding: EdgeInsets.all(8),
                      hintStyle: AppFonts.body2(color: AppColors.grayscale50),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: AppColors.grayscale10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Payment Methods',
                  style: AppFonts.title5(
                    color: AppColors.grayscale90,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Credit Cards & Debit Cards',
                  style: AppFonts.headline4(
                    color: AppColors.grayscale90,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: savedCards.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < savedCards.length) {
                      return Dismissible(
                        key: Key(savedCards[index].cardHolderName),
                        onDismissed: (direction) {
                          setState(() {
                            savedCards.removeAt(index);
                          });
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 16),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        child: CardWidget(
                          cardInfo: savedCards[index],
                          isSelected: index == selectedIndex,
                          onSelect: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        ),
                      );
                    } else {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                            width: MediaQuery.of(context).size.width * 0.08,
                            height: MediaQuery.of(context).size.width * 0.06,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: AppColors.grayscale10,
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 20,
                              color: AppColors.primary30,
                            )),
                        title: Text(
                          'Add New Card',
                          style: AppFonts.body2(
                            color: AppColors.grayscale90,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: AppColors.grayscale50,
                        ),
                        onTap: () {},
                      );
                    }
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  'Other Payment Methods:',
                  style: AppFonts.headline3(
                    color: AppColors.grayscale90,
                  ),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: otherPaymentMethods.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < otherPaymentMethods.length) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: SizedBox(
                          height: 20,
                          width: 20,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: AppColors.grayscale10,
                            ),
                            child: Image.asset(paymentMethodIcons[index]),
                          ),
                        ),
                        title: Text(
                          otherPaymentMethods[index],
                          style: AppFonts.body2(
                            color: AppColors.grayscale90,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: AppColors.grayscale50,
                        ),
                        onTap: () {
                          // Handle tapping on other payment methods
                        },
                      );
                    } else {
                      return const SizedBox(
                          height: 30); // Add desired space here
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 10,
        child: IntrinsicHeight(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Total',
                            style: AppFonts.body1(
                              color: AppColors.grayscale90,
                            ),
                          ),
                          Text(
                            '${widget.totalAmount.toStringAsFixed(2)} KD',
                            style: AppFonts.title4(
                              color: AppColors.primary30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColors.primary40,
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Text(
                            'Pay',
                            style: AppFonts.body1(color: AppColors.grayscale0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showChangeAddress(BuildContext context) {
  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return ChangeAddressModal();
    },
  );
}
