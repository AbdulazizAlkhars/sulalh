import 'package:flutter/material.dart';
import 'package:hathera_demo/Marketplace/Lists.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../ProductMarketPlacePages/marketplace_items.dart';
import 'item_promotional_chips_widget.dart';

class ProductCardHorizontal extends StatelessWidget {
  final ProductDetails product;

  const ProductCardHorizontal({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.grayscale10, // Background color for the container
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    color: AppColors.grayscale00,
                  ),
                  child: Expanded(
                    flex: 0,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                            image: DecorationImage(
                              image: AssetImage(product.imagePath),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        ItemPromotionalChipsWidget(
                          promotiontag: product.promotiontag,
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15,
                            backgroundImage: AssetImage(product.forwhatspecies),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Details on the right side
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          product.productName,
                          style: AppFonts.body1(color: AppColors.grayscale100),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                product.weightvoulme,
                                style: AppFonts.caption1(
                                    color: AppColors.primary30),
                              ),
                              Text(
                                ' / ',
                                style: AppFonts.caption1(
                                    color: AppColors.primary30),
                              ),
                              Text(
                                product.pcsperpack,
                                style: AppFonts.caption1(
                                    color: AppColors.primary30),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            '${product.boughtPastMonth}+ Bought Past Month',
                            style:
                                AppFonts.caption2(color: AppColors.grayscale90),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.store,
                            size: 20,
                            color: AppColors.primary20,
                          ),
                          Text(
                            product.shopName,
                            style:
                                AppFonts.caption2(color: AppColors.grayscale90),
                          ),
                          Spacer(),
                          Row(
                            children: List.generate(
                              5,
                              (index) {
                                if (index < product.rating.floor()) {
                                  // Full star
                                  return const Icon(
                                    Icons.star,
                                    color: AppColors.secondary50,
                                  );
                                } else if (index < product.rating) {
                                  // Half-filled star
                                  return const Icon(
                                    Icons.star_half,
                                    color: AppColors.secondary50,
                                  );
                                } else {
                                  // Empty star
                                  return const Icon(
                                    Icons.star_border,
                                    color: AppColors.secondary50,
                                  );
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            product.rating.toString(),
                            style:
                                AppFonts.caption2(color: AppColors.grayscale90),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            product.discountedPrice,
                            style:
                                AppFonts.headline3(color: AppColors.primary40),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            product.actualPrice,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.grayscale50,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(width: 3),
                          const Spacer(),
                          Text(
                            '(${calculateDiscountPercentage(product.actualPrice, product.discountedPrice)}%) Off',
                            style: AppFonts.caption1(
                                color: AppColors.grayscale100),
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
    );
  }
}
