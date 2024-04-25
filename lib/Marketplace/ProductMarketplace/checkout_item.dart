import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketplaceWidgets/change_address_modal_sheet.dart';

import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';
import '../Lists.dart';
import 'ProductMarketplaceWidgets/checkout_cart_items_widget.dart';
import 'ProductMarketplaceWidgets/credit_debit_cards_widget.dart';
import 'ProductMarketplaceWidgets/delivery_time_slots_chips_widget.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivery Address',
                style: AppFonts.title4(
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
                            vertical: 16, horizontal: 24),
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
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery Time',
                    style: AppFonts.title4(
                      color: AppColors.grayscale90,
                    ),
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
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Cart Items',
                style: AppFonts.title4(
                  color: AppColors.grayscale90,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Payment Methods',
                style: AppFonts.title4(
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
                        ));
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
                    return const SizedBox(height: 30); // Add desired space here
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Material(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        elevation: 10,
        color: AppColors.grayscale00,
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Your Order',
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
                Container(
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
                                onPressed: () {},
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
                                  'Pay',
                                  style: AppFonts.body1(
                                      color: AppColors.grayscale0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
