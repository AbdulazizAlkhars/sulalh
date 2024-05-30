// ignore: file_names
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'ProductMarketplace/ProductMarketPlaceWidgets/credit_debit_cards_widget.dart';

final List<String> animaladvertisements = [
  'assets/ads/Background-image.png',
  'assets/AccountProfile/splashscreenimg.png',
  'assets/ads/Background-image.png',
];
final List<String> productadvertisements = [
  'assets/ads/Background-image.png',
  'assets/AccountProfile/splashscreenimg.png',
  'assets/ads/Background-image.png',
];

List<Map<String, dynamic>> animalVendorData = [
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740 2.png',
    'name': 'Farmshop',
  },
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740 3.png',
    'name': 'Top FarmerShop',
  },
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740 4.png',
    'name': 'LovelyCow',
  },
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740.png',
    'name': 'Pet Hub',
  },
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740.png',
    'name': 'Eve',
  },
];
List<Map<String, dynamic>> CharityOrgData = [
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740 5.png',
    'name': 'Animal Farm \n Foundation',
  },
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740 6.png',
    'name': 'Foal Farm',
  },
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740 7.png',
    'name': 'Freedom Farm',
  },
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740 8.png',
    'name': 'Farm Animal Welfare'
  },
  {
    'imageAsset': 'assets/avatar5.png',
    'name': 'Eve',
  },
];
List<Map<String, dynamic>> ProductVendorData = [
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740 2.png',
    'name': 'Farmshop',
    'shopstatus': 'New',
    'description':
        'Farmshop is a comprehensive store for all your farm animal needs. From high-quality feed to specialized grooming tools, it offers a wide range of products designed to keep your livestock healthy and thriving. The shop prides itself on its knowledgeable staff who are always ready to provide expert advice and excellent customer service.',
    'facebook': 'facebook/farmshop.com',
    'instagram': '@farmshop',
    'website': 'farmshop.com',
    'address':
        '4358 Jonathan Street, Denver4358 Jonathan Street, Denver4358 Jonathan Street, Denver4358 Jonathan Street, Denver'
  },
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740 3.png',
    'name': 'Top FarmerShop',
    'shopstatus': 'Verified',
    'description':
        'Farmshop is a comprehensive store for all your farm animal needs. From high-quality feed to specialized grooming tools, it offers a wide range of products designed to keep your livestock healthy and thriving. The shop prides itself on its knowledgeable staff who are always ready to provide expert advice and excellent customer service.',
    'facebook': 'facebook/TopFarmerShop.com',
    'instagram': '@TopFarmerShop',
    'website': 'TopFarmerShop.com',
    'address': '4358 Jonathan Street, Denver'
  },
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740 4.png',
    'name': 'LovelyCow',
    'shopstatus': 'Top Rated',
    'description':
        'Farmshop is a comprehensive store for all your farm animal needs. From high-quality feed to specialized grooming tools, it offers a wide range of products designed to keep your livestock healthy and thriving. The shop prides itself on its knowledgeable staff who are always ready to provide expert advice and excellent customer service.',
    'facebook': 'facebook/LovelyCow.com',
    'instagram': '@LovelyCow',
    'website': 'LovelyCow.com',
    'address': '4358 Jonathan Street, Denver'
  },
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740 3.png',
    'name': 'Pet Hub',
    'shopstatus': 'Verified',
    'description':
        'Farmshop is a comprehensive store for all your farm animal needs. From high-quality feed to specialized grooming tools, it offers a wide range of products designed to keep your livestock healthy and thriving. The shop prides itself on its knowledgeable staff who are always ready to provide expert advice and excellent customer service.',
    'facebook': 'facebook/PetHub.com',
    'instagram': '@PetHub',
    'website': 'PetHub.com',
    'address': '4358 Jonathan Street, Denver'
  },
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740.png',
    'name': 'Eve',
    'description':
        'Farmshop is a comprehensive store for all your farm animal needs. From high-quality feed to specialized grooming tools, it offers a wide range of products designed to keep your livestock healthy and thriving. The shop prides itself on its knowledgeable staff who are always ready to provide expert advice and excellent customer service.',
    'facebook': 'facebook/Eve.com',
    'instagram': '@Eve',
    'website': 'Eve.com',
    'address': '4358 Jonathan Street, Denver'
  },
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740 2.png',
    'name': 'Farmshop',
    'shopstatus': 'New',
    'description':
        'Farmshop is a comprehensive store for all your farm animal needs. From high-quality feed to specialized grooming tools, it offers a wide range of products designed to keep your livestock healthy and thriving. The shop prides itself on its knowledgeable staff who are always ready to provide expert advice and excellent customer service.',
    'facebook': 'facebook/farmshop.com',
    'instagram': '@farmshop',
    'website': 'farmshop.com',
    'address':
        '4358 Jonathan Street, Denver4358 Jonathan Street, Denver4358 Jonathan Street, Denver4358 Jonathan Street, Denver'
  },
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740 3.png',
    'name': 'Top FarmerShop',
    'shopstatus': 'Verified',
    'description':
        'Farmshop is a comprehensive store for all your farm animal needs. From high-quality feed to specialized grooming tools, it offers a wide range of products designed to keep your livestock healthy and thriving. The shop prides itself on its knowledgeable staff who are always ready to provide expert advice and excellent customer service.',
    'facebook': 'facebook/TopFarmerShop.com',
    'instagram': '@TopFarmerShop',
    'website': 'TopFarmerShop.com',
    'address': '4358 Jonathan Street, Denver'
  },
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740 4.png',
    'name': 'LovelyCow',
    'shopstatus': 'Top Rated',
    'description':
        'Farmshop is a comprehensive store for all your farm animal needs. From high-quality feed to specialized grooming tools, it offers a wide range of products designed to keep your livestock healthy and thriving. The shop prides itself on its knowledgeable staff who are always ready to provide expert advice and excellent customer service.',
    'facebook': 'facebook/LovelyCow.com',
    'instagram': '@LovelyCow',
    'website': 'LovelyCow.com',
    'address': '4358 Jonathan Street, Denver'
  },
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740.png',
    'name': 'Product For Farmers',
    'shopstatus': 'Verified',
    'description':
        'Farmshop is a comprehensive store for all your farm animal needs. From high-quality feed to specialized grooming tools, it offers a wide range of products designed to keep your livestock healthy and thriving. The shop prides itself on its knowledgeable staff who are always ready to provide expert advice and excellent customer service.',
    'facebook': 'facebook/ProductForFarmers.com',
    'instagram': '@ProductForFarmers',
    'website': 'ProductForFarmers.com',
    'address': '4358 Jonathan Street, Denver'
  },
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740.png',
    'name': 'Eve',
    'shopstatus': 'Top Rated',
    'description':
        'Farmshop is a comprehensive store for all your farm animal needs. From high-quality feed to specialized grooming tools, it offers a wide range of products designed to keep your livestock healthy and thriving. The shop prides itself on its knowledgeable staff who are always ready to provide expert advice and excellent customer service.',
    'facebook': 'facebook/Eve.com',
    'instagram': '@Eve',
    'website': 'Eve.com',
    'address': '4358 Jonathan Street, Denver'
  },
];

class ProductDetails {
  final String imagePath;
  final String forwhatspecies;
  final String productName;
  final String weightvoulme;
  final String pcsperpack;
  final String description;
  final String benefits;
  final String shopName;
  final String discountedPrice;
  final String actualPrice;
  final String boughtPastMonth;
  final String promotiontag;
  final double rating;

  ProductDetails({
    required this.forwhatspecies,
    required this.imagePath,
    required this.productName,
    required this.weightvoulme,
    required this.description,
    required this.pcsperpack,
    required this.benefits,
    required this.shopName,
    required this.discountedPrice,
    required this.boughtPastMonth,
    required this.actualPrice,
    required this.promotiontag,
    required this.rating,
  });
}

final List<ProductDetails> topProductList = [
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 6.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$90',
    actualPrice: '\$160',
    weightvoulme: '800ML',
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    pcsperpack: '6Pc',
    shopName: 'Pet Club',
    forwhatspecies: 'assets/avatars/120px/Dog.png',
    boughtPastMonth: '280',
    promotiontag: 'Promoted',
    rating: 5.0,
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$100',
    actualPrice: '\$190',
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    weightvoulme: '1Kg',
    shopName: 'Pet Club',
    pcsperpack: '6Pc',
    forwhatspecies: 'assets/avatars/120px/Cow.png',
    boughtPastMonth: '250',
    rating: 4.2,
    promotiontag: 'Promoted',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 5.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$180',
    actualPrice: '\$250',
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    boughtPastMonth: '260',
    weightvoulme: '800ML',
    shopName: 'Pet Club',
    pcsperpack: '6Pc',
    forwhatspecies: 'assets/avatars/120px/Duck.png',
    rating: 4.1,
    promotiontag: 'Best Seller',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 6.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$175',
    actualPrice: '\$258',
    weightvoulme: '800ML',
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    shopName: 'Pet Club',
    pcsperpack: '6Pc',
    forwhatspecies: 'assets/avatars/120px/Horse.png',
    rating: 4.4,
    promotiontag: 'Sale',
    boughtPastMonth: '290',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    shopName: 'Pet Club',
    pcsperpack: '6Pc',
    weightvoulme: '800ML',
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    boughtPastMonth: '275',
    forwhatspecies: 'assets/avatars/120px/Cat.png',
    promotiontag: 'Best Seller',
    rating: 4.2,
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 5.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    weightvoulme: '800ML',
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    pcsperpack: '6Pc',
    shopName: 'Pet Club',
    forwhatspecies: 'assets/avatars/120px/Cat.png',
    promotiontag: 'Sale',
    rating: 4.5,
    boughtPastMonth: '275',
  ),
  // Add more ProductDetails objects as needed
];

List<String> filteredCatalogChipsList = [
  'Dry Food', 'Wet Food',
  'Cleaning & Hygiene',

  // Add more chip labels as needed
];
List<String> myitemordersfilter = [
  'All', // Add 'All' as the first item
  for (int i = 0; i < 5; i++)
    DateFormat.yMMMM().format(DateTime.now().subtract(Duration(days: 30 * i)))
];
final List<ProductDetails> prevouslyBoughtProductList = [
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 5.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    weightvoulme: '800ML',
    shopName: 'Pet Club',
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    pcsperpack: '6Pc',
    rating: 4.5,
    promotiontag: 'Best Seller',
    forwhatspecies: 'assets/avatars/120px/Cat.png',
    boughtPastMonth: '200',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 6.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    pcsperpack: '6Pc',
    actualPrice: '\$100',
    weightvoulme: '800ML',
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    shopName: 'Pet Club',
    promotiontag: 'Sale',
    forwhatspecies: 'assets/avatars/120px/Dog.png',
    rating: 4.5,
    boughtPastMonth: '280',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    pcsperpack: '6Pc',
    actualPrice: '\$100',
    shopName: 'Pet Club',
    weightvoulme: '800ML',
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    promotiontag: 'Promoted',
    forwhatspecies: 'assets/avatars/120px/Horse.png',
    rating: 4.5,
    boughtPastMonth: '250',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 5.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    shopName: 'Pet Club',
    pcsperpack: '6Pc',
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    rating: 4.5,
    weightvoulme: '800ML',
    forwhatspecies: 'assets/avatars/120px/Duck.png',
    promotiontag: 'Sale',
    boughtPastMonth: '275',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 6.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
    pcsperpack: '6Pc',
    shopName: 'Pet Club',
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    weightvoulme: '800ML',
    forwhatspecies: 'assets/avatars/120px/Chicken.png',
    boughtPastMonth: '225',
    promotiontag: 'Best Seller',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    forwhatspecies: 'assets/avatars/120px/Cat.png',
    actualPrice: '\$100',
    pcsperpack: '6Pc',
    weightvoulme: '800ML',
    rating: 4.5,
    shopName: 'Pet Club',
    promotiontag: 'Promoted',
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    boughtPastMonth: '260',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 5.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    forwhatspecies: 'assets/avatars/120px/Cat.png',
    rating: 4.5,
    pcsperpack: '6pc',
    shopName: 'Pet Club',
    weightvoulme: '800ML',
    boughtPastMonth: '275',
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    promotiontag: 'Promoted',
  ),
  // Add more ProductDetails objects as needed
];

final List<ProductDetails> similarProductList = [
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 5.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    weightvoulme: '800ML',
    shopName: 'Pet Club',
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    pcsperpack: '6Pc',
    rating: 4.5,
    promotiontag: 'Best Seller',
    forwhatspecies: 'assets/avatars/120px/Cat.png',
    boughtPastMonth: '200',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 6.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    pcsperpack: '6Pc',
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    actualPrice: '\$100',
    weightvoulme: '800ML',
    shopName: 'Pet Club',
    promotiontag: 'Sale',
    forwhatspecies: 'assets/avatars/120px/Dog.png',
    rating: 4.5,
    boughtPastMonth: '280',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    pcsperpack: '6Pc',
    actualPrice: '\$100',
    shopName: 'Pet Club',
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    weightvoulme: '800ML',
    promotiontag: 'Promoted',
    forwhatspecies: 'assets/avatars/120px/Horse.png',
    rating: 4.5,
    boughtPastMonth: '250',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 5.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    shopName: 'Pet Club',
    pcsperpack: '6Pc',
    rating: 4.5,
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    weightvoulme: '800ML',
    forwhatspecies: 'assets/avatars/120px/Duck.png',
    promotiontag: 'Sale',
    boughtPastMonth: '275',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 6.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    rating: 4.5,
    pcsperpack: '6Pc',
    shopName: 'Pet Club',
    weightvoulme: '800ML',
    forwhatspecies: 'assets/avatars/120px/Chicken.png',
    boughtPastMonth: '225',
    promotiontag: 'Best Seller',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    forwhatspecies: 'assets/avatars/120px/Cat.png',
    actualPrice: '\$100',
    pcsperpack: '6Pc',
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    weightvoulme: '800ML',
    rating: 4.5,
    shopName: 'Pet Club',
    promotiontag: 'Promoted',
    boughtPastMonth: '260',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 5.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    forwhatspecies: 'assets/avatars/120px/Cat.png',
    rating: 4.5,
    pcsperpack: '6pc',
    shopName: 'Pet Club',
    description:
        'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
    benefits:
        "Packed with essential vitamins, minerals, and protein sources, our pet food promotes overall health, vitality, and a shiny coat, ensuring your pet thrives from the inside out. With every bite, you're providing your beloved pet with the nourishment they deserve for a vibrant and active lifestyle.",
    weightvoulme: '800ML',
    boughtPastMonth: '275',
    promotiontag: 'Promoted',
  ),
  // Add more ProductDetails objects as needed
];

class AnimalDetails {
  final String imagePath;
  final String animalName;
  final String animalAge;
  final String gender;
  final String discountedPrice;
  final String actualPrice;
  final double rating;

  AnimalDetails({
    required this.imagePath,
    required this.animalName,
    required this.animalAge,
    required this.gender,
    required this.discountedPrice,
    required this.actualPrice,
    required this.rating,
  });
}

final List<AnimalDetails> AnimalList = [
  AnimalDetails(
    imagePath: 'assets/Marketplace/Frame 1 2.png',
    animalName: 'Arabian Horse',
    animalAge: '3 Years',
    gender: 'Male',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
  ),
  AnimalDetails(
    imagePath: 'assets/Marketplace/Frame 1 3.png',
    animalName: 'Indian Horse',
    animalAge: '3 Years',
    gender: 'Male',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
  ),
  AnimalDetails(
    imagePath: 'assets/Marketplace/Frame 1 4.png',
    animalName: 'Malasian Horse',
    animalAge: '3 Years',
    gender: 'Male',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
  ),
  AnimalDetails(
    imagePath: 'assets/Marketplace/Frame 1 2.png',
    animalName: 'Canadian Horse',
    animalAge: '3 Years',
    gender: 'Male',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
  ),
  AnimalDetails(
    imagePath: 'assets/Marketplace/Frame 1 3.png',
    animalName: 'Russian Horse',
    animalAge: '3 Years',
    gender: 'Male',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
  ),
  AnimalDetails(
    imagePath: 'assets/Marketplace/Frame 1 4.png',
    animalName: 'English Horse',
    animalAge: '3 Years',
    gender: 'Male',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
  ),
  AnimalDetails(
    imagePath: 'assets/Marketplace/Frame 1 2.png',
    animalName: 'Hungarian Horse',
    animalAge: '3 Years',
    gender: 'Male',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
  ),
  // Add more ProductDetails objects as needed
];

class Review {
  final String reviewerName;
  final int rating;
  final String reviewText;
  final DateTime date;

  Review({
    required this.reviewerName,
    required this.rating,
    required this.reviewText,
    required this.date,
  });
}

final List<Review> reviews = [
  Review(
    reviewerName: 'John Doe',
    rating: 3,
    reviewText:
        'I highly recommend this shampoo, my horse’s hair is soft and nice.!',
    date: DateTime.now(),
  ),
  Review(
    reviewerName: 'Alice Smith',
    rating: 5,
    reviewText: 'Very satisfied with the purchase.',
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  Review(
    reviewerName: 'Alice Smith',
    rating: 1,
    reviewText: 'Great shampoo + conditioner',
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  Review(
    reviewerName: 'Alice Smith',
    rating: 2,
    reviewText: 'Very satisfied with the purchase.',
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  Review(
    reviewerName: 'Alice Smith',
    rating: 2,
    reviewText: 'Very satisfied with the purchase.',
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  Review(
    reviewerName: 'Alice Smith',
    rating: 2,
    reviewText: 'Very satisfied with the purchase.',
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  Review(
    reviewerName: 'Alice Smith',
    rating: 2,
    reviewText: 'Very satisfied with the purchase.',
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  // Add more reviews as needed
];

class CartItem {
  final String productName;
  final double price;
  int quantity;
  final int discountedPrice;
  final String imagePath;

  CartItem({
    required this.productName,
    required this.price,
    required this.quantity,
    required this.discountedPrice,
    required this.imagePath,
  });
}

final List<CartItem> cartItems = [
  CartItem(
    productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
    price: 25.0,
    quantity: 2,
    discountedPrice: 10,
    imagePath: 'assets/Marketplace/Frame 1 5.png',
  ),
  CartItem(
    productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
    price: 10.0,
    quantity: 1,
    discountedPrice: 10,
    imagePath: 'assets/Marketplace/Frame 1 5.png',
  ),
  CartItem(
    productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
    price: 10.0,
    quantity: 1,
    discountedPrice: 10,
    imagePath: 'assets/Marketplace/Frame 1 5.png',
  ),
  CartItem(
    productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
    price: 10.0,
    quantity: 1,
    discountedPrice: 10,
    imagePath: 'assets/Marketplace/Frame 1 5.png',
  ),
  CartItem(
    productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
    price: 10.0,
    quantity: 1,
    discountedPrice: 10,
    imagePath: 'assets/Marketplace/Frame 1 5.png',
  ),
  CartItem(
    productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
    price: 10.0,
    quantity: 1,
    discountedPrice: 10,
    imagePath: 'assets/Marketplace/Frame 1 5.png',
  ),
];

List<ATMCardInfo> savedCards = [
  ATMCardInfo('John Doe', '**** **** **** 1234', '2020', '222'),
  ATMCardInfo('Jane Smith', '**** **** **** 5678', '2121', '222'),
];

List<String> otherPaymentMethods = [
  'PayPal',
  'Google Pay',
  'Apple Pay',
];
List<String> paymentMethodIcons = [
  'assets/PaymentPNGs/PayPal.png',
  'assets/PaymentPNGs/GPay.png',
  'assets/PaymentPNGs/ApplePay.png',
];

class MyItemOrder {
  final DateTime date;
  final String id;

  final String status;
  final DateTime deliverydate;
  final int numberOfItems;
  final List<String> itemImages; // Asset paths for item images
  final List<String> itemNames; // Names of the items
  final List<String> itemPrice;

  MyItemOrder({
    required this.date,
    required this.id,
    required this.itemPrice,
    required this.status,
    required this.deliverydate,
    required this.numberOfItems,
    required this.itemImages,
    required this.itemNames,
  });
}

List<MyItemOrder> myitemorders = [
  MyItemOrder(
    date: DateTime(2024, 2, 7),
    deliverydate: DateTime(2024, 2, 15),
    id: '1',
    status: 'Created',
    numberOfItems: 5,
    itemImages: [
      'assets/Marketplace/Frame 1 5.png',
      'assets/Marketplace/Frame 1 5.png',
      'assets/Marketplace/Frame 1 5.png',
      'assets/Marketplace/Frame 1 5.png',
      'assets/Marketplace/Frame 1 5.png',
    ],
    itemNames: [
      'EquiGLOSS 2in1 Conditioning Shampoo',
      'EquiGLOSS 2in1 Conditioning Shampoo',
      'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
      'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
      'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    ],
    itemPrice: [
      '120',
      '140',
      '120',
      '140',
      '120',
    ],
  ),
  MyItemOrder(
    date: DateTime(2024, 2, 7),
    deliverydate: DateTime(2024, 2, 15),
    id: '2',
    status: 'Cancelled',
    numberOfItems: 1,
    itemImages: [
      'assets/Marketplace/Frame 1 5.png',
    ],
    itemNames: [
      'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    ],
    itemPrice: [
      '120',
    ],
  ),
  MyItemOrder(
    date: DateTime(2024, 2, 7),
    deliverydate: DateTime(2024, 2, 15),
    id: '2',
    status: 'Delivered',
    numberOfItems: 1,
    itemImages: [
      'assets/Marketplace/Frame 1 5.png',
    ],
    itemNames: [
      'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    ],
    itemPrice: [
      '120',
    ],
  ),
  // Add more orders as needed
];

final Map<String, IconData> categoryIcons = {
  'Food and Treats': FontAwesomeIcons.bowlRice,
  'Toys': Icons.pest_control_rodent,
  'Health and Wellness': FontAwesomeIcons.prescriptionBottleMedical,
  'Cleaning and Hygiene': Icons.cleaning_services,
  '⁠Travel and Transportation': FontAwesomeIcons.car,
  'Housing and Habitat': Icons.house,
  'Identification and Safety': Icons.security,
  'Speciality Items': Icons.star_border,
  // Add more categories and their corresponding icons as needed
};
final List<String> animalCategoryItems = [
  'All',
  'Cat',
  'Dog',
  'Sheep',
  'Cow',
  'Horse',
  'Chicken',
];

class Suggestions {
  static const List<String> petProductSuggestions = [
    'Royal Canin Indoor Dry Cat Food',
    'Blue Buffalo Life Protection Formula Dry Dog Food',
    'Hill\'s Science Diet Dry Dog Food',
    'Purina Pro Plan Savor Dry Dog Food',
    'Taste of the Wild High Prairie Grain-Free Dry Dog Food',
    'Merrick Grain-Free Dry Dog Food',
    'Wellness Complete Health Natural Dry Dog Food',
    'Natural Balance L.I.D. Limited Ingredient Diets Dry Dog Food',
    'Instinct Original Grain-Free Dry Dog Food',
    'Pedigree Adult Dry Dog Food',
    'Blue Buffalo Wilderness Grain-Free Canned Dog Food',
    'Merrick Grain-Free Canned Dog Food',
    'Wellness Complete Health Natural Canned Dog Food',
    'Hill\'s Science Diet Wet Dog Food',
    'Rachael Ray Nutrish Natural Wet Cat Food',
    'Purina Friskies Classic Pate Wet Cat Food',
    'Fancy Feast Classic Pate Wet Cat Food',
    'Tiki Cat Grill Grain-Free Canned Cat Food',
    'Weruva Cats in the Kitchen Grain-Free Canned Cat Food',
    'Natural Balance L.I.D. Limited Ingredient Diets Canned Cat Food',
  ];
}

class CartProvider extends StatefulWidget {
  final Widget child;

  const CartProvider({Key? key, required this.child}) : super(key: key);

  static _CartProviderState? of(BuildContext context) =>
      context.findAncestorStateOfType<_CartProviderState>();

  @override
  _CartProviderState createState() => _CartProviderState();
}

class _CartProviderState extends State<CartProvider> {
  bool _isItemAddedToCart = false;

  void toggleItemAddedToCart() {
    setState(() {
      _isItemAddedToCart = !_isItemAddedToCart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _CartState(
      isItemAddedToCart: _isItemAddedToCart,
      child: widget.child,
    );
  }
}

class _CartState extends InheritedWidget {
  final bool isItemAddedToCart;

  const _CartState({
    required this.isItemAddedToCart,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  static _CartState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_CartState>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}

List<Map<String, dynamic>> myAnimals = [
  {
    'imageAsset': 'assets/avatars/120px/Cat.png',
    'name': 'Jack',
  },
  {
    'imageAsset': 'assets/avatars/120px/Chicken.png',
    'name': 'Sheru',
  },
  {
    'imageAsset': 'assets/avatars/120px/Cow.png',
    'name': 'Henry',
  },
  {
    'imageAsset': 'assets/avatars/120px/Sheep.png',
    'name': 'Kong',
  },
  {
    'imageAsset': 'assets/avatars/120px/Duck.png',
    'name': 'Eve',
  },
  {
    'imageAsset': 'assets/avatars/120px/Horse.png',
    'name': 'Sumo',
  },
  {
    'imageAsset': 'assets/avatars/120px/Duck.png',
    'name': 'King',
  },
  {
    'imageAsset': 'assets/avatars/120px/Chicken.png',
    'name': 'Fazzy',
  },
];
List<Map<String, dynamic>> animalSpecies = [
  {
    'imageAsset': 'assets/avatars/120px/Cat.png',
    'name': 'Cat',
  },
  {
    'imageAsset': 'assets/avatars/120px/Dog.png',
    'name': 'Dog',
  },
  {
    'imageAsset': 'assets/avatars/120px/Cow.png',
    'name': 'Cow',
  },
  {
    'imageAsset': 'assets/avatars/120px/Horse.png',
    'name': 'Horse',
  },
  {
    'imageAsset': 'assets/avatars/120px/Sheep.png',
    'name': 'Sheep',
  },
  {
    'imageAsset': 'assets/avatars/120px/Chicken.png',
    'name': 'Chicken',
  },
  {
    'imageAsset': 'assets/avatars/120px/Duck.png',
    'name': 'Duck',
  },
];
Map<String, List<String>> speciesBreeds = {
  'Cat': ['Siamese', 'Persian', 'Maine Coon', 'Bengal'],
  'Dog': [
    'Labrador Retriever',
    'German Shepherd',
    'Golden Retriever',
    'Bulldog'
  ],
  'Cow': [
    'Holstein',
    'Jersey',
    'Angus',
    'Jersey',
    'Angus',
    'Jersey',
    'Angus' 'Hereford'
  ],
  'Horse': ['Thoroughbred', 'Quarter Horse', 'Arabian', 'Appaloosa'],
  'Sheep': ['Merino', 'Dorper', 'Suffolk', 'Rambouillet'],
  'Chicken': ['Rhode Island Red', 'Leghorn', 'Plymouth Rock', 'Wyandotte'],
  'Duck': ['Pekin', 'Muscovy', 'Khaki Campbell', 'Rouen'],
};

final List<String> deliverySlots = [
  '10 AM - 2 PM',
  '2 PM - 6 PM',
  '6 PM - 8 PM',
];
List<String> governorates = [
  'Al Ahmadi',
  'Hawalli',
  'Farwaniya',
  'Al Asimah',
  'Jahra',
  'Mubarak Al-Kabeer'
];
Map<String, List<String>> citiesByGovernorate = {
  'Al Ahmadi': ['Fahaheel', 'Mangaf', 'Mahboula'],
  'Hawalli': ['Hawalli', 'Salmiya', 'Bayan'],
  'Farwaniya': ['Al-Farwaniyah', 'Al-Rai', 'Rabiya'],
  'Al Asimah': ['Kuwait City', 'Dasma', 'Qortuba'],
  'Jahra': ['Jahra', 'Naseem', 'Qasr'],
  'Mubarak Al-Kabeer': ['Al-Abdali', 'Wafra', 'Mutlaa'],
};

List<Map<String, dynamic>> petProductBrands = [
  {'name': '8in1', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Applause',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Animlogy',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Aquarium Munster',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Aquael', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Animall Megastore',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Iams', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Merrick Pet Care',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Natural Balance Pet Foods',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Orijen', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Purina', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Royal Canin',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Stella & Chewy\'s',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Taste of the Wild',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Wellness Pet Food',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'ZiwiPeak',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Artemis Pet Food',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Fussie Cat',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Lotus Pet Foods',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Nulo Pet Food',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Applaws', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Animlogy',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Aquarium Munster',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Aquael', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Animal Megastore',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Atman', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'afp All For Paws',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Alcott', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'AK Cat Products',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Arm & Hammer',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Amiplay', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Ancol', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Beaphar', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Belcando',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'BewiDog', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'BentySandy',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Buddy', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Bow&Meow',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Beavis', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Biotin', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Bozzi', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Biokat\'s',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Buffalo Range',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Bark Badge',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Bearing', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Beeztees',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Bissell', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Butcher\'s',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'BossPet', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'BurBur', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'BioGance',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Betty', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Bado', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'BelVed', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'BNULKH', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Bosch', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Coockoo', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Canada Litter',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Cavalor', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Cesar', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Cat’s Pride',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Canina', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Conifors',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'CozyCat', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'CocoKat', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'CeDe', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Camon', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Cat Royale',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Cherie', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Chuckit', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Cango', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Chris Christensen',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Catron', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'ClearCat',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Catmania',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'DYMAX', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'DUVO', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Dreams', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'DOLFOS', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Dr Seidel',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Dogman', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Drools', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Dr.Beckmann',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'D&D Home',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Doca KW', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Daiso', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Diamond', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Divinus', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Diamant', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'DezynaDog',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Chadog', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'DuraPets',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'DoctorBark',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'EarthBorn',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'EzyDog', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'EasyLife',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'EBI', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'EHEIM', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Natura Pet',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'E-Cloth', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'EnergyPet',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'EcoNature',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Flexi', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Fuss-Dog',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Flamingo',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'FurMinator',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Felix', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Fancy Feast',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Firskies',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'FerPlast',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Formula Natural',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'FarmCompany',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Funny Paws',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Fruitables',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Farma Friends',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Ferribiella',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Felinnes',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Furrish', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Fetch For Pets',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Frendi', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Filos', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'FranCodex',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Groom Professional',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'GimCat', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'GimDog', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Gonzo', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'GreenBone',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'GeorPlast',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Goofy’s PetShop',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Grander', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Gattino', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Guppy', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Gemon', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Hobby', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Henry Wag',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Healthy Meat',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Higgins', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'HiLife', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'HPETHF', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Husse', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Hill’s', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'IV San Bernard',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'L’Chic', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Italian Cat',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'iFetch', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Julius K-9',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Jonny Cat',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Jungle', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Johnson’s',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'JetPilot',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'JoyPaws', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'KERBL', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Kardon', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'KWaquatic',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'KONG', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Karl Flamingo',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Kiwi Walker',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'KitCat', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'KeepTail',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'KatZoo', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'LillipHut',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Leonardo',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Lara', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'LittleTwig',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'LaVital', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'LucyCat', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Microbe-lift',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Mag-Float',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Manitoba',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'MeowMix', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'M-Pets', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'MigilorCane',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'MigilorGatto',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Mr.Smell',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'MajorDog',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Meow Cattery',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Mafnifique Kuw',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Mikki', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Mr.Fresh',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'M&S Boutique',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Milk&Pepper',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Mooch', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'MoonLight',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Max&Molly',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Metrovac',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Max', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Monge', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'NuVetLabs',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'NutriVet',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'NAS', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Natures Ocean',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'NYOS', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Natural Kitty',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'NiteIze', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'NaturalCare',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'NANDOG', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'NutriBird',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Natura', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'NaturVet',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Nobby', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Omega One',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Arlux', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Oops', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'OroPharma',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Easy', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'OssoBello',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'OdorGenre',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'ProPac', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'PetHead', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'PlatinumPets',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Prestige',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Protein', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Purina', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Pedigree',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Live', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Purina One',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'PetShine',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'PetEdge', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'PetNess', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Paws&Furrs',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Penn-Plax',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'PetLife', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'PetPals', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Petmate', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'PoochPads',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Petlando',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'PiuPet', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Pets Life',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Petspa', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Purina', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Petkin', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Puppy Angel',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Peekaboo',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Rogz', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Rabbit7', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Rocco', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'RauPet', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Repashy', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Rusty', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Rosk Pet',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'RabbitSos',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Ribtex', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Rogerm', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Rookie', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Ring', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Savic', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Seresto', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Simple', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'SmartCat',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'SnuggleSafe',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Snob', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Sentry', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'SuperCat',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'ScareCrow',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Stableboy',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Sunny', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Shinga', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Savic', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Silica', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Sapet', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Simple Solution',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Supreme', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Smolke', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'SlimCat', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'SnorFlex',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Soothetube',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'ShowPet', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Tech Den',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'TropiClean',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Trixie', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'TopLogic',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Turtle Hut',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Toro', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Takoda', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Tumil-K', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Termita', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Tuffy', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Vitakraft',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Verm-X', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'VanNap', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Vetoquinol',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Virbac', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Vetark', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Vitakraft',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Versale-laga',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'VerMac', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'VetSect', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Vetriderm',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Vilpet', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Welpi', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Woof&Wag',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Whiskas', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Wellness Pet Food',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'Whimzees',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {
    'name': 'X’Mas Petz',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Yumega', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Yagu', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Yaky Chew',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'YULI', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'YooHo', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Zebra', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Zealac', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'ZiwiPeak',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Zolux', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Zupreem', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Zero Odor',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
  {'name': 'Zilla', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {'name': 'Zap', 'imageAsset': 'assets/Marketplace/sulala_white_logo.png'},
  {
    'name': 'Zoomundo',
    'imageAsset': 'assets/Marketplace/sulala_white_logo.png'
  },
];

final Map<String, Map<String, dynamic>> categoryDetails = {
  'Food & Treats': {
    'icon': FontAwesomeIcons.bowlRice,
    'subcategories': [
      'Dry Food',
      'Wet Food',
      'Bird Feed',
      'Fish Feed',
      'Natural Food',
      'Others'
    ]
  },
  'Toys': {
    'icon': Icons.category_outlined,
    'subcategories': [
      'Chew Toys',
      'Interactive',
      'Balls',
      'Stuffed Toys',
      'Puzzles',
      'Others'
    ]
  },
  'Health & Wellness': {
    'icon': FontAwesomeIcons.prescriptionBottleMedical,
    'subcategories': [
      'Medications',
      'Supplements',
      'First Aid',
      'Vet Visits',
      'Dental',
      'Others'
    ]
  },
  'Cleaning & Hygiene': {
    'icon': Icons.cleaning_services,
    'subcategories': [
      'Cleaners',
      'Grooming',
      'Waste Mgmt',
      'Shampoos',
      'Deodorizers',
      'Others'
    ]
  },
  'Carriers & Crates': {
    'icon': FontAwesomeIcons.suitcase,
    'subcategories': [
      'Carriers',
      'Travel Kits',
      'Safety Gear',
      'Water Bowls',
      'Travel Beds',
      'Others'
    ]
  },
  'Housing & Habitat': {
    'icon': Icons.house,
    'subcategories': [
      'Houses',
      'Aquariums',
      'Cages',
      'Bedding',
      'Terrariums',
      'Others'
    ]
  },
  'Identification & Safety': {
    'icon': Icons.security,
    'subcategories': [
      'Collars',
      'Tags',
      'GPS Trackers',
      'Leashes',
      'Safety Vests',
      'Others'
    ]
  },
  'Speciality Items': {
    'icon': Icons.star_border,
    'subcategories': [
      'Custom',
      'Unique Toys',
      'Personalized',
      'Seasonal Gifts',
      'Special Diet',
      'Others'
    ]
  },
  // Add more categories and subcategories as needed
};

final List<Map<String, String>> packages = [
  {'packageAmount': '180', 'packageName': "Tommy's Food Package"},
  {'packageAmount': '85', 'packageName': "Medicines Package For Lucy"},
  {'packageAmount': '145', 'packageName': "Beds Package"},
  {'packageAmount': '120', 'packageName': "Food Package For Monty"},
  // Add more package data as needed
];
final List<String> autoDeliveryPeriod = [
  "1 Week",
  "2 Weeks",
  "1 Month",
  "3 Months",
];

class AutoDeliveryOrder {
  final DateTime date;
  final String id;

  final DateTime nextdeliverydate;
  final int numberOfItems;
  final List<String> autoDeliveryItemImages; // Asset paths for item images
  final List<String> autoDeliveryItemNames; // Names of the items
  final String itemPrice;

  AutoDeliveryOrder({
    required this.date,
    required this.id,
    required this.itemPrice,
    required this.nextdeliverydate,
    required this.numberOfItems,
    required this.autoDeliveryItemImages,
    required this.autoDeliveryItemNames,
  });
}

List<AutoDeliveryOrder> autoDeliveryOrder = [
  AutoDeliveryOrder(
      date: DateTime(2024, 2, 7),
      nextdeliverydate: DateTime(2024, 2, 15),
      id: '1',
      numberOfItems: 1,
      autoDeliveryItemImages: [
        'assets/Marketplace/Frame 1 5.png',
      ],
      autoDeliveryItemNames: [
        'EquiGLOSS 2in1 Conditioning Shampoo',
      ],
      itemPrice: '120'),
  AutoDeliveryOrder(
      date: DateTime(2024, 2, 7),
      nextdeliverydate: DateTime(2024, 2, 15),
      id: '2',
      numberOfItems: 1,
      autoDeliveryItemImages: [
        'assets/Marketplace/Frame 1 5.png',
      ],
      autoDeliveryItemNames: [
        'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
      ],
      itemPrice: '120'),
  AutoDeliveryOrder(
      date: DateTime(2024, 2, 7),
      nextdeliverydate: DateTime(2024, 2, 15),
      id: '2',
      numberOfItems: 1,
      autoDeliveryItemImages: [
        'assets/Marketplace/Frame 1 5.png',
      ],
      autoDeliveryItemNames: [
        'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
      ],
      itemPrice: '120'),
  // Add more orders as needed
];
