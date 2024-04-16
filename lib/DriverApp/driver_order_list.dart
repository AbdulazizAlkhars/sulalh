class DriverNewOrders {
  final String ordernumber;
  final String deliveryslot;
  final String deliverydate;
  final String customername;
  final String status;
  final String customeraddress;
  final String shopname;
  final String shopaddress;

  DriverNewOrders(
      {required this.ordernumber,
      required this.deliveryslot,
      required this.deliverydate,
      required this.customername,
      required this.status,
      required this.customeraddress,
      required this.shopname,
      required this.shopaddress});
}

final List<DriverNewOrders> DriverNewOrderList = [
  DriverNewOrders(
      ordernumber: '#1000001',
      deliveryslot: '10.00 - 12.00',
      deliverydate: '14.04.2024',
      customername: 'Stark',
      customeraddress: 'Ardiya',
      status: 'Waiting To Accept',
      shopname: 'FarmShop',
      shopaddress: 'Jabriya'),
  DriverNewOrders(
      ordernumber: '#1000002',
      deliveryslot: '11.00 - 12.00',
      deliverydate: '14.04.2024',
      customername: 'Thor',
      status: 'Waiting To Accept',
      customeraddress: 'Jabriya',
      shopname: 'PetZone',
      shopaddress: 'Ardiya'),
  DriverNewOrders(
      ordernumber: '#1000003',
      deliveryslot: '13.00 - 15.00',
      deliverydate: '14.04.2024',
      customername: 'Steve',
      status: 'Waiting To Accept',
      customeraddress: 'Khaitan',
      shopname: 'PetCare',
      shopaddress: 'Kuwait City'),
  DriverNewOrders(
      ordernumber: '#1000004',
      deliveryslot: '16.00 - 19.00',
      deliverydate: '14.04.2024',
      customername: 'Natasha',
      status: 'Waiting To Accept',
      customeraddress: 'Kuwait City',
      shopname: 'PetHub',
      shopaddress: 'Jabriya'),

  // Add more ProductDetails objects as needed
];

class DriverAcceptedOrders {
  final String ordernumber;
  final String deliveryslot;
  final String deliverydate;
  final String customername;
  final String status;
  final String customeraddress;
  final String shopname;
  final String shopaddress;

  DriverAcceptedOrders(
      {required this.ordernumber,
      required this.deliveryslot,
      required this.deliverydate,
      required this.customername,
      required this.status,
      required this.customeraddress,
      required this.shopname,
      required this.shopaddress});
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
      shopaddress: 'Jabriya'),
  DriverAcceptedOrders(
      ordernumber: '#1000002',
      deliveryslot: '11.00 - 12.00',
      deliverydate: '14.04.2024',
      customername: 'Thor',
      status: 'Accepted',
      customeraddress: 'Jabriya',
      shopname: 'PetZone',
      shopaddress: 'Ardiya'),
  DriverAcceptedOrders(
      ordernumber: '#1000003',
      deliveryslot: '13.00 - 15.00',
      deliverydate: '14.04.2024',
      customername: 'Steve',
      status: 'Accepted',
      customeraddress: 'Khaitan',
      shopname: 'PetCare',
      shopaddress: 'Kuwait City'),
  DriverAcceptedOrders(
      ordernumber: '#1000004',
      deliveryslot: '16.00 - 19.00',
      deliverydate: '14.04.2024',
      customername: 'Natasha',
      status: 'Accepted',
      customeraddress: 'Kuwait City',
      shopname: 'PetHub',
      shopaddress: 'Jabriya'),

  // Add more ProductDetails objects as needed
];

class DriverDeliveredOrders {
  final int totalpaid;
  final String ordernumber;
  final String deliveryslot;
  final String deliverydate;
  final String customername;
  final String status;
  final String customeraddress;
  final String shopname;
  final String shopaddress;

  DriverDeliveredOrders(
      {required this.ordernumber,
      required this.totalpaid,
      required this.deliveryslot,
      required this.deliverydate,
      required this.customername,
      required this.status,
      required this.customeraddress,
      required this.shopname,
      required this.shopaddress});
}

final List<DriverDeliveredOrders> DriverDeliveredOrdersList = [
  DriverDeliveredOrders(
      ordernumber: '#1000001',
      deliveryslot: '10.00 - 12.00',
      deliverydate: '14.04.2024',
      customername: 'Stark',
      customeraddress: 'Ardiya',
      status: 'Delivered',
      shopname: 'FarmShop',
      shopaddress: 'Jabriya',
      totalpaid: 25),
  DriverDeliveredOrders(
      ordernumber: '#1000002',
      deliveryslot: '11.00 - 12.00',
      totalpaid: 55,
      deliverydate: '14.04.2024',
      customername: 'Thor',
      status: 'Delivered',
      customeraddress: 'Jabriya',
      shopname: 'PetZone',
      shopaddress: 'Ardiya'),
  DriverDeliveredOrders(
      ordernumber: '#1000003',
      deliveryslot: '13.00 - 15.00',
      deliverydate: '14.04.2024',
      totalpaid: 35,
      customername: 'Steve',
      status: 'Delivered',
      customeraddress: 'Khaitan',
      shopname: 'PetCare',
      shopaddress: 'Kuwait City'),
  DriverDeliveredOrders(
      ordernumber: '#1000004',
      totalpaid: 190,
      deliveryslot: '16.00 - 19.00',
      deliverydate: '14.04.2024',
      customername: 'Natasha',
      status: 'Delivered',
      customeraddress: 'Kuwait City',
      shopname: 'PetHub',
      shopaddress: 'Jabriya'),

  // Add more ProductDetails objects as needed
];
