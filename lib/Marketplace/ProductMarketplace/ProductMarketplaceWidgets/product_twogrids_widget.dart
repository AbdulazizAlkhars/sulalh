import 'package:flutter/material.dart';

import '../../Lists.dart';
import '../ProductMarketPlacePages/product_details_page.dart';
import 'column_product_card_widget.dart';

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
            childAspectRatio: 0.5, // Adjust aspect ratio as needed
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
                child: ColumnProductCard(
                  product: product,
                ));
          },
        ),
      ],
    );
  }
}
