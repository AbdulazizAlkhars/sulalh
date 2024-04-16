class DriverNewOrders {
  final String ordernumber;
  final String deliveryslot;
  final String deliverydate;
  final String customername;
  final String customeraddress;
  final String shopname;
  final String shopaddress;

  DriverNewOrders(
      {required this.ordernumber,
      required this.deliveryslot,
      required this.deliverydate,
      required this.customername,
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
      shopname: 'FarmShop',
      shopaddress: 'Jabriya'),
  DriverNewOrders(
      ordernumber: '#1000002',
      deliveryslot: '11.00 - 12.00',
      deliverydate: '14.04.2024',
      customername: 'Thor',
      customeraddress: 'Jabriya',
      shopname: 'PetZone',
      shopaddress: 'Ardiya'),
  DriverNewOrders(
      ordernumber: '#1000003',
      deliveryslot: '13.00 - 15.00',
      deliverydate: '14.04.2024',
      customername: 'Steve',
      customeraddress: 'Khaitan',
      shopname: 'PetCare',
      shopaddress: 'Kuwait City'),
  DriverNewOrders(
      ordernumber: '#1000004',
      deliveryslot: '16.00 - 19.00',
      deliverydate: '14.04.2024',
      customername: 'Natasha',
      customeraddress: 'Kuwait City',
      shopname: 'PetHub',
      shopaddress: 'Jabriya'),

  // Add more ProductDetails objects as needed
];
