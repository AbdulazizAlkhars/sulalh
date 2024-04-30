import 'package:flutter/material.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketplaceWidgets/column_product_card_widget.dart';
import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../../Lists.dart';
import '../marketplace_items.dart';
import '../product_details_page.dart';
import 'row_product_card_widget.dart';
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
            childAspectRatio: 2.3, // Adjust aspect ratio as needed
          ),
          itemCount: topProductList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final product = topProductList[index];
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
                child: ProductCardHorizontal(
                  product: product,
                ));
          },
        )
      ],
    );
  }
}
