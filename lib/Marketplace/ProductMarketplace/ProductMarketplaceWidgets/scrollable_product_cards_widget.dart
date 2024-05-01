import 'package:flutter/material.dart';
import 'package:hathera_demo/Marketplace/Lists.dart';
import '../../../Theme/Colors.dart';
import '../product_details_page.dart';
import 'column_product_card_widget.dart';

class ScrollableProductCardsWidget extends StatelessWidget {
  final List<ProductDetails> mainProductList;

  const ScrollableProductCardsWidget({
    Key? key,
    required this.mainProductList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: AppColors.grayscale20),
          color: AppColors.grayscale00,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: mainProductList.asMap().entries.map((entry) {
              final int index = entry.key;
              final ProductDetails product = entry.value;

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
                child: SizedBox(
                  height: 400,
                  width: 200,
                  child: ColumnProductCard(product: product),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
