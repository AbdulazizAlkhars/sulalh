// ignore: file_names
import 'package:flutter/material.dart';

import 'ProductMarketplace/ProductMarketplaceWidgets/credit_debit_cards_widget.dart';

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
    'name': 'Product For \n Farmers',
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
    'description':
        'Farmshop is a comprehensive store for all your farm animal needs. From high-quality feed to specialized grooming tools, it offers a wide range of products designed to keep your livestock healthy and thriving. The shop prides itself on its knowledgeable staff who are always ready to provide expert advice and excellent customer service.',
    'facebook': 'facebook/farmshop.com',
    'instagram': '@farmshop',
    'website': 'farmshop.com',
    'address': '4358 Jonathan Street, Denver'
  },
  {
    'imageAsset': 'assets/Marketplace/Frame 2087325740 3.png',
    'name': 'Top FarmerShop',
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
  final String productName;
  final String discountedPrice;
  final String actualPrice;
  final String boughtPastMonth;
  final double rating;

  ProductDetails({
    required this.imagePath,
    required this.productName,
    required this.discountedPrice,
    required this.boughtPastMonth,
    required this.actualPrice,
    required this.rating,
  });
}

final List<ProductDetails> mainProductList = [
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 5.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$130',
    rating: 4.0,
    boughtPastMonth: '200',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 6.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$90',
    actualPrice: '\$160',
    boughtPastMonth: '280',
    rating: 5.0,
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$100',
    actualPrice: '\$190',
    boughtPastMonth: '250',
    rating: 4.2,
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 5.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$180',
    actualPrice: '\$250',
    boughtPastMonth: '260',
    rating: 4.1,
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 6.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$175',
    actualPrice: '\$258',
    rating: 4.4,
    boughtPastMonth: '290',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    boughtPastMonth: '275',
    rating: 4.2,
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 5.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
    boughtPastMonth: '275',
  ),
  // Add more ProductDetails objects as needed
];

List<String> filteredCatalogChipsList = [
  'Dry Food', 'Wet Food',
  'Cleaning & Hygiene',
  'Grooming',

  // Add more chip labels as needed
];
List<String> myitemordersfilter = [
  'January 2024', 'February 2024', 'March 2024', 'April 2024'

  // Add more chip labels as needed
];
final List<ProductDetails> filteredProductList = [
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 5.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
    boughtPastMonth: '200',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 6.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
    boughtPastMonth: '280',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
    boughtPastMonth: '250',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 5.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
    boughtPastMonth: '275',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 6.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
    boughtPastMonth: '225',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
    boughtPastMonth: '260',
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 5.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
    boughtPastMonth: '275',
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
    discountedPrice: 5,
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
    status: 'Delivered',
    numberOfItems: 2,
    itemImages: [
      'assets/Marketplace/Frame 1 5.png',
      'assets/Marketplace/Frame 1 5.png',
    ],
    itemNames: [
      'EquiGLOSS 2in1 Conditioning Shampoo',
      'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    ],
    itemPrice: [
      '120',
      '140',
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
  'Pet Food and Treats': Icons.grass,
  'Pet Accessories': Icons.spa,
  'Health and Wellness': Icons.spa,
  'Cleaning and Hygiene': Icons.cleaning_services,
  '⁠Travel and Transportation': Icons.local_shipping,
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
