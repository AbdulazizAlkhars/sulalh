// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hathera_demo/Widgets/Button.dart';

// import '../../Theme/Colors.dart';
// import '../../Theme/Fonts.dart';

// class AddCardPage extends StatefulWidget {
//   const AddCardPage({super.key});

//   @override
//   State<AddCardPage> createState() => _AddCardPageState();
// }

// class _AddCardPageState extends State<AddCardPage> {
//   final TextEditingController cardHolderNameController =
//       TextEditingController();
//   final TextEditingController cardTypeController = TextEditingController();
//   final TextEditingController cardNumberController = TextEditingController();
//   final TextEditingController expiryDateController = TextEditingController();
//   final TextEditingController cvcController = TextEditingController();

//   List<String> cardTypes = [
//     'Visa',
//     'MasterCard',
//     'American Express',
//     'Discover',
//   ];

//   String? selectedCardType;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//             // Handle back button press
//             // Add your code here
//           },
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: IconButton(
//               icon: const Icon(Icons.close),
//               onPressed: () {
//                 Navigator.pop(context);
//                 // Handle cancel button press
//                 // Add your code here
//               },
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Add New Card',
//                     style: TextStyle(
//                       fontSize: 40,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   const Text(
//                     'Card Holder Name',
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   TextFormField(
//                     controller: cardHolderNameController,
//                     decoration: InputDecoration(
//                       labelText: 'Enter Name',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(50.0),
//                       ),
//                       contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
//                       suffixIcon: const Padding(
//                         padding: EdgeInsets.all(8.0),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   const Text(
//                     'Card Number',
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   TextFormField(
//                     controller: cardNumberController,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       labelText: 'Enter Number',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(50.0),
//                       ),
//                       contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
//                       suffixIcon: const Padding(
//                         padding: EdgeInsets.all(8.0),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'Expiration Date',
//                               style: TextStyle(
//                                 fontSize: 16,
//                               ),
//                             ),
//                             TextFormField(
//                               controller: expiryDateController,
//                               keyboardType: TextInputType.number,
//                               maxLength: 5,
//                               inputFormatters: [_DateInputFormatter()],
//                               decoration: InputDecoration(
//                                 labelText: 'MM:YY',
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(50.0),
//                                 ),
//                                 contentPadding:
//                                     const EdgeInsets.fromLTRB(20, 20, 20, 12),
//                                 suffixIcon: const Padding(
//                                   padding: EdgeInsets.all(8.0),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                           width: 16), // Add spacing between the fields
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'CVC',
//                               style: TextStyle(
//                                 fontSize: 16,
//                               ),
//                             ),
//                             TextFormField(
//                               controller: cvcController,
//                               maxLength: 3,
//                               obscureText: true,
//                               keyboardType: TextInputType.number,
//                               decoration: InputDecoration(
//                                 labelText: 'Enter CVC',
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(50.0),
//                                 ),
//                                 contentPadding:
//                                     const EdgeInsets.fromLTRB(20, 20, 20, 12),
//                                 suffixIcon: const Padding(
//                                   padding: EdgeInsets.all(8.0),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 100),
//                   Container(
//                     margin: const EdgeInsets.symmetric(vertical: 16),
//                     child: ButtonWidget(
//                       onPressed: () {
//                         final newCardInfo = CardInfo(
//                           cardHolderNameController.text,
//                           cardNumberController.text,
//                           expiryDateController.text,
//                           cvcController.text,
//                         );
//                         Navigator.pop(context, newCardInfo);
//                       },
//                       buttonText: 'Save Card',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CardInfo {
//   final String cardHolderName;
//   final String expiryDate;
//   final String cardNumber;
//   final String cvcNumber;

//   CardInfo(
//       this.cardHolderName, this.cardNumber, this.cvcNumber, this.expiryDate);
// }

// class CardWidget extends StatelessWidget {
//   final CardInfo cardInfo;
//   final bool isSelected;
//   final Function() onSelect;

//   const CardWidget({
//     Key? key,
//     required this.cardInfo,
//     required this.isSelected,
//     required this.onSelect,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final maskedCardNumber =
//         maskCardNumber(cardInfo.cardNumber); // Mask card number

//     final cardType = detectCCType(cardInfo.cardNumber);

//     String cardImagePath = '';

//     if (cardType == CreditCardType.visa) {
//       cardImagePath = 'assets/PaymentPNGs/VISA.png';
//     } else if (cardType == CreditCardType.mastercard) {
//       cardImagePath = 'assets/PaymentPNGs/Mastercard.png';
//     } else if (cardType == CreditCardType.americanExpress) {
//       cardImagePath = 'assets/PaymentPNGs/AmericanExpress.png';
//     } else if (cardType == CreditCardType.discover) {
//       cardImagePath = 'assets/PaymentPNGs/Discover.png';
//     }

//     return Card(
//       color: Colors.white,
//       elevation: 0,
//       child: ListTile(
//         contentPadding: EdgeInsets.zero,
//         leading: SizedBox(
//           height: 25,
//           width: 25,
//           child: Image.asset(cardImagePath),
//         ),
//         title: Text(
//           maskedCardNumber,
//           style: AppFonts.body2(
//             color: AppColors.grayscale90,
//           ),
//         ),
//         trailing: GestureDetector(
//           onTap: onSelect,
//           child: Container(
//             width: MediaQuery.of(context).size.width * 0.064,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: isSelected ? AppColors.primary20 : AppColors.grayscale30,
//                 width: isSelected ? 6.0 : 1.0,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   String maskCardNumber(String cardNumber) {
//     const int visibleDigits = 4;
//     final int totalDigits = cardNumber.length;

//     if (totalDigits <= visibleDigits) {
//       return cardNumber; // No masking required
//     }

//     final int maskedDigits = totalDigits - visibleDigits;
//     final String maskedPart = List.filled(maskedDigits, "*").join("");
//     final String visiblePart =
//         cardNumber.substring(totalDigits - visibleDigits);

//     // Insert space for every four digits
//     final String maskedWithSpaces = maskedPart.splitMapJoin(
//       RegExp(r'.{4}'),
//       onMatch: (m) => '${m.group(0)} ',
//       onNonMatch: (n) => n,
//     );

//     return "$maskedWithSpaces$visiblePart";
//   }
// }

// class _DateInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     var newText = newValue.text;
//     var newSelection = newValue.selection;

//     if (newText.length == 3 && newText.substring(2, 3) != ":") {
//       newText = '${newText.substring(0, 2)}:${newText.substring(2)}';
//       if (newSelection.start >= 2) {
//         newSelection = TextSelection.fromPosition(
//           TextPosition(offset: newSelection.start + 1),
//         );
//       }
//     } else if (newText.length > 5) {
//       newText = newText.substring(0, 5);
//       if (newSelection.start > 5) {
//         newSelection = TextSelection.fromPosition(
//           const TextPosition(offset: 5),
//         );
//       }
//     }

//     return TextEditingValue(
//       text: newText,
//       selection: newSelection,
//       composing: TextRange.empty,
//     );
//   }
// }

// enum CreditCardType {
//   visa,
//   mastercard,
//   americanExpress,
//   discover,
// }

// CreditCardType detectCCType(String cardNumber) {
//   // Perform your logic to detect the credit card type here
//   // This is just a sample implementation
//   if (cardNumber.startsWith('4')) {
//     return CreditCardType.visa;
//   } else if (cardNumber.startsWith('5')) {
//     return CreditCardType.mastercard;
//   } else if (cardNumber.startsWith('3')) {
//     return CreditCardType.americanExpress;
//   } else if (cardNumber.startsWith('6')) {
//     return CreditCardType.discover;
//   } else {
//     return CreditCardType.visa; // Default to Visa
//   }
// }
