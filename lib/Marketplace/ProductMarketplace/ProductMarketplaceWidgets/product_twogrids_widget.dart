import 'package:flutter/material.dart';
import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../../Lists.dart';
import '../marketplace_items.dart';
import '../product_details_page.dart';
import 'filter_items_widget.dart';
import 'item_promotional_chips_widget.dart';

class ProductTwoGridsWidget extends StatelessWidget {
  final List<ProductDetails>
      mainProductList; // Define your product model and import it

  const ProductTwoGridsWidget({Key? key, required this.mainProductList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6, // Adjust aspect ratio as needed
          ),
          itemCount: mainProductList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final product = mainProductList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(
                      index: index,
                      product: product,
                    ),
                  ),
                );
              },
              child: Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors
                          .grayscale10, // Background color for the container
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                                color: Colors.white),
                            child: Expanded(
                              flex: 1,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(20),
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
                                      backgroundImage:
                                          AssetImage(product.forwhatspecies),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    left: 8,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: AppColors.grayscale00,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Text(
                                        product.packaging,
                                        style: AppFonts.caption1(
                                            color: AppColors.primary30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Details on the right side
                        Expanded(
                          flex: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    // Product name
                                    Flexible(
                                      child: Text(
                                        product.productName,
                                        style: AppFonts.caption1(
                                          color: AppColors.grayscale100,
                                        ),
                                      ),
                                    ),
                                    // List of tags
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${product.boughtPastMonth}+ Bought Past Month',
                                  style: AppFonts.caption2(
                                    color: AppColors.grayscale90,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    // List of five stars
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
                                      style: AppFonts.caption2(
                                        color: AppColors.grayscale90,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      product.discountedPrice,
                                      style: AppFonts.headline3(
                                        color: AppColors.primary40,
                                      ),
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      product.actualPrice,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: AppColors.grayscale60,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    const SizedBox(width: 3),
                                    const Spacer(),
                                    Text(
                                      '(${calculateDiscountPercentage(product.actualPrice, product.discountedPrice)}% Off)',
                                      style: AppFonts.caption1(
                                        color: AppColors.grayscale90,
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
          },
        ),
      ],
    );
  }
}
