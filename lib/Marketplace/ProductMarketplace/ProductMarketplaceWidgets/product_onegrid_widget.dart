import 'package:flutter/material.dart';
import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../../Lists.dart';
import '../marketplace_items.dart';
import '../product_details_page.dart';
import 'filter_items_widget.dart';
import 'item_promotional_chips_widget.dart';

class ProductOneGridWidget extends StatelessWidget {
  final List<ProductDetails>
      mainProductList; // Define your product model and import it

  const ProductOneGridWidget({Key? key, required this.mainProductList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 2.5, // Adjust aspect ratio as needed
          ),
          itemCount: filteredProductList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final product = filteredProductList[index];
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors
                        .grayscale10, // Background color for the container
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
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
                                )
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
                              Row(
                                children: [
                                  // Product name
                                  Expanded(
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
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
                                      color: AppColors.grayscale100,
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
            );
          },
        )
      ],
    );
  }
}
