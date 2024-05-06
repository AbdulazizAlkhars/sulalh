class DriverNewOrders {
  final String ordernumber;
  final String deliveryslot;
  final String deliverydate;
  final String customername;
  final String status;
  final String deliverystatus;
  final String customeraddress;
  final String shopname;
  final String shopaddress;
  final List<DriverCartItem> cartItems;

  DriverNewOrders({
    required this.ordernumber,
    required this.deliveryslot,
    required this.deliverydate,
    required this.customername,
    required this.deliverystatus,
    required this.status,
    required this.customeraddress,
    required this.shopname,
    required this.shopaddress,
    required this.cartItems,
  });
}

final List<DriverNewOrders> DriverNewOrderList = [
  DriverNewOrders(
    ordernumber: '#1000001',
    deliveryslot: '10.00 - 12.00',
    deliverydate: '14.04.2024',
    customername: 'Stark',
    customeraddress: 'Jabriya',
    status: 'Waiting To Accept',
    deliverystatus: 'Late',
    shopname: 'FarmShop',
    shopaddress: 'Jabriya',
    cartItems: [
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 25.0,
        quantity: 2,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 25.0,
        quantity: 2,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 25.0,
        quantity: 2,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 25.0,
        quantity: 2,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      // Add more cart items as needed
    ],
  ),
  DriverNewOrders(
    ordernumber: '#1000002',
    deliveryslot: '11.00 - 12.00',
    deliverydate: '14.04.2024',
    customername: 'Thor',
    deliverystatus: 'Before Time',
    status: 'Waiting To Accept',
    customeraddress: 'Jabriya',
    shopname: 'PetZone',
    shopaddress: 'Ardiya',
    cartItems: [
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 25.0,
        quantity: 2,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 10.0,
        quantity: 1,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      // Add more cart items as needed
    ],
  ),
  DriverNewOrders(
    ordernumber: '#1000003',
    deliveryslot: '13.00 - 15.00',
    deliverydate: '14.04.2024',
    customername: 'Steve',
    status: 'Waiting To Accept',
    deliverystatus: 'On Time',
    customeraddress: 'Jabriya',
    shopname: 'PetCare',
    shopaddress: 'Kuwait City',
    cartItems: [
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 10.0,
        quantity: 1,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      // Add more cart items as needed
    ],
  ),
  DriverNewOrders(
    ordernumber: '#1000004',
    deliveryslot: '16.00 - 19.00',
    deliverydate: '14.04.2024',
    customername: 'Natasha',
    status: 'Waiting To Accept',
    deliverystatus: 'Before Time',
    customeraddress: 'Kuwait City',
    shopname: 'PetHub',
    shopaddress: 'Jabriya',
    cartItems: [
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 25.0,
        quantity: 2,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 10.0,
        quantity: 1,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 10.0,
        quantity: 1,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      // Add more cart items as needed
    ],
  ),

  // Add more ProductDetails objects as needed
];

class DriverAcceptedOrders {
  final String ordernumber;
  final String deliveryslot;
  final String deliverydate;
  final String customername;
  final String status;
  final String deliverystatus;
  final String customeraddress;
  final String shopname;
  final String shopaddress;
  final List<DriverCartItem> cartItems;

  DriverAcceptedOrders({
    required this.ordernumber,
    required this.deliveryslot,
    required this.deliverydate,
    required this.customername,
    required this.deliverystatus,
    required this.status,
    required this.customeraddress,
    required this.shopname,
    required this.shopaddress,
    required this.cartItems,
  });
}

final List<DriverAcceptedOrders> DriverAcceptedOrderList = [
  DriverAcceptedOrders(
    ordernumber: '#1000001',
    deliveryslot: '10.00 - 12.00',
    deliverydate: '14.04.2024',
    customername: 'Stark',
    customeraddress: 'Ardiya',
    status: 'Accepted',
    shopname: 'FarmShop',
    shopaddress: 'Jabriya',
    deliverystatus: 'Late',
    cartItems: [
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 25.0,
        quantity: 2,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 10.0,
        quantity: 1,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 10.0,
        quantity: 1,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      // Add more cart items as needed
    ],
  ),
  DriverAcceptedOrders(
    ordernumber: '#1000002',
    deliveryslot: '11.00 - 12.00',
    deliverydate: '14.04.2024',
    customername: 'Thor',
    status: 'Accepted',
    customeraddress: 'Jabriya',
    shopname: 'PetZone',
    shopaddress: 'Ardiya',
    deliverystatus: 'Late',
    cartItems: [
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 25.0,
        quantity: 2,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 10.0,
        quantity: 1,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 10.0,
        quantity: 1,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      // Add more cart items as needed
    ],
  ),
  DriverAcceptedOrders(
    ordernumber: '#1000003',
    deliveryslot: '13.00 - 15.00',
    deliverydate: '14.04.2024',
    customername: 'Steve',
    status: 'Accepted',
    customeraddress: 'Khaitan',
    shopname: 'PetCare',
    shopaddress: 'Kuwait City',
    deliverystatus: 'Late',
    cartItems: [
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 25.0,
        quantity: 2,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 10.0,
        quantity: 1,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 10.0,
        quantity: 1,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      // Add more cart items as needed
    ],
  ),
  DriverAcceptedOrders(
    ordernumber: '#1000004',
    deliveryslot: '16.00 - 19.00',
    deliverydate: '14.04.2024',
    customername: 'Natasha',
    status: 'Accepted',
    customeraddress: 'Kuwait City',
    shopname: 'PetHub',
    shopaddress: 'Jabriya',
    deliverystatus: 'Late',
    cartItems: [
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 25.0,
        quantity: 2,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 10.0,
        quantity: 1,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 10.0,
        quantity: 1,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      // Add more cart items as needed
    ],
  ),

  // Add more ProductDetails objects as needed
];

class DriverDeliveredOrders {
  final int totalpaid;
  final String ordernumber;
  final String deliveryslot;
  final String deliverydate;
  final String customername;
  final String status;
  final String paymentStatus;
  final String deliverystatus;
  final String customeraddress;
  final String shopname;
  final String shopaddress;
  final List<DriverCartItem> cartItems;

  DriverDeliveredOrders({
    required this.ordernumber,
    required this.totalpaid,
    required this.deliveryslot,
    required this.deliverydate,
    required this.paymentStatus,
    required this.customername,
    required this.deliverystatus,
    required this.status,
    required this.customeraddress,
    required this.shopname,
    required this.shopaddress,
    required this.cartItems,
  });
}

final List<DriverDeliveredOrders> DriverDeliveredOrdersList = [
  DriverDeliveredOrders(
    ordernumber: '#1000001',
    deliveryslot: '10.00 - 12.00',
    deliverydate: '14.04.2024',
    customername: 'Stark',
    customeraddress: 'Ardiya',
    paymentStatus: 'Paid',
    status: 'Delivered',
    shopname: 'FarmShop',
    shopaddress: 'Jabriya',
    totalpaid: 25,
    deliverystatus: 'Late',
    cartItems: [
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 25.0,
        quantity: 2,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 10.0,
        quantity: 1,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),

      // Add more cart items as needed
    ],
  ),
  DriverDeliveredOrders(
    ordernumber: '#1000002',
    deliveryslot: '11.00 - 12.00',
    totalpaid: 55,
    deliverydate: '14.04.2024',
    customername: 'Thor',
    status: 'Delivered',
    customeraddress: 'Jabriya',
    shopname: 'PetZone',
    paymentStatus: 'Unpaid',
    shopaddress: 'Ardiya',
    deliverystatus: 'Late',
    cartItems: [
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 25.0,
        quantity: 2,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),

      // Add more cart items as needed
    ],
  ),
  DriverDeliveredOrders(
    ordernumber: '#1000003',
    deliveryslot: '13.00 - 15.00',
    deliverydate: '14.04.2024',
    totalpaid: 35,
    customername: 'Steve',
    paymentStatus: 'Unpaid',
    status: 'Delivered',
    customeraddress: 'Khaitan',
    shopname: 'PetCare',
    shopaddress: 'Kuwait City',
    deliverystatus: 'Late',
    cartItems: [
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 25.0,
        quantity: 2,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 10.0,
        quantity: 1,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 10.0,
        quantity: 1,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      // Add more cart items as needed
    ],
  ),
  DriverDeliveredOrders(
    ordernumber: '#1000004',
    totalpaid: 190,
    deliveryslot: '16.00 - 19.00',
    deliverydate: '14.04.2024',
    paymentStatus: 'Paid',
    customername: 'Natasha',
    status: 'Delivered',
    customeraddress: 'Kuwait City',
    shopname: 'PetHub',
    shopaddress: 'Jabriya',
    deliverystatus: 'Late',
    cartItems: [
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 25.0,
        quantity: 2,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 10.0,
        quantity: 1,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      DriverCartItem(
        productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
        price: 10.0,
        quantity: 1,
        discountedPrice: 10,
        imagePath: 'assets/Marketplace/Frame 1 5.png',
      ),
      // Add more cart items as needed
    ],
  ),

  // Add more ProductDetails objects as needed
];

class DriverCartItem {
  final String productName;
  final double price;
  int quantity;
  final int discountedPrice;
  final String imagePath;

  DriverCartItem({
    required this.productName,
    required this.price,
    required this.quantity,
    required this.discountedPrice,
    required this.imagePath,
  });
}

final List<DriverCartItem> drivercartItems = [
  DriverCartItem(
    productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
    price: 25.0,
    quantity: 2,
    discountedPrice: 10,
    imagePath: 'assets/Marketplace/Frame 1 5.png',
  ),
  DriverCartItem(
    productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
    price: 10.0,
    quantity: 1,
    discountedPrice: 10,
    imagePath: 'assets/Marketplace/Frame 1 5.png',
  ),
  DriverCartItem(
    productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
    price: 10.0,
    quantity: 1,
    discountedPrice: 10,
    imagePath: 'assets/Marketplace/Frame 1 5.png',
  ),
  DriverCartItem(
    productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
    price: 10.0,
    quantity: 1,
    discountedPrice: 5,
    imagePath: 'assets/Marketplace/Frame 1 5.png',
  ),
  DriverCartItem(
    productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
    price: 10.0,
    quantity: 1,
    discountedPrice: 10,
    imagePath: 'assets/Marketplace/Frame 1 5.png',
  ),
];

List<String> states = [
  'Al Ahmadi',
  'Hawalli',
  'Farwaniya',
  'Al Asimah',
  'Jahra',
  'Mubarak Al-Kabeer'
];
Map<String, List<String>> cities = {
  'Al Ahmadi': ['Fahaheel', 'Mangaf', 'Mahboula'],
  'Hawalli': ['Hawalli', 'Salmiya', 'Bayan'],
  'Farwaniya': ['Al-Farwaniyah', 'Al-Rai', 'Rabiya'],
  'Al Asimah': ['Kuwait City', 'Dasma', 'Qortuba'],
  'Jahra': ['Jahra', 'Naseem', 'Qasr'],
  'Mubarak Al-Kabeer': ['Al-Abdali', 'Wafra', 'Mutlaa'],
};
final List<String> timeSlots = [
  '10 AM - 2 PM',
  '2 PM - 6 PM',
  '6 PM - 8 PM',
];
