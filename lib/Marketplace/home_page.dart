import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketPlacePages/marketplace_items.dart';

// ignore: must_be_immutable
class MarketplaceHomePage extends ConsumerStatefulWidget {
  const MarketplaceHomePage({
    super.key,
  });

  @override
  ConsumerState<MarketplaceHomePage> createState() => _Marketplacehomepage();
}

class _Marketplacehomepage extends ConsumerState<MarketplaceHomePage>
    with SingleTickerProviderStateMixin {
  String filterQuery = '';
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.01,
            right: MediaQuery.of(context).size.width * 0.01),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: MarketplaceItems(),
            ),
          ],
        ),
      ),
    );
  }
}
