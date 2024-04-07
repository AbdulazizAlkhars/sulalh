// ignore: file_names
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
    'imageAsset': 'assets/avatar5.png',
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
    'imageAsset': 'assets/avatar5.png',
    'name': 'Eve',
  },
];

class ProductDetails {
  final String imagePath;
  final String productName;
  final String discountedPrice;
  final String actualPrice;
  final double rating;

  ProductDetails({
    required this.imagePath,
    required this.productName,
    required this.discountedPrice,
    required this.actualPrice,
    required this.rating,
  });
}

final List<ProductDetails> productList = [
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 5.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 6.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 5.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 6.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
  ),
  ProductDetails(
    imagePath: 'assets/Marketplace/Frame 1 5.png',
    productName: 'Milktech Silver Premium Calf & Foal Milk Replacer 20kg',
    discountedPrice: '\$80',
    actualPrice: '\$100',
    rating: 4.5,
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
