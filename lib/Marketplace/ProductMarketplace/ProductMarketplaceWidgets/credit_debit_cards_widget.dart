import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';

class CardWidget extends StatelessWidget {
  final ATMCardInfo cardInfo;
  final bool isSelected;
  final Function() onSelect;

  const CardWidget({
    Key? key,
    required this.cardInfo,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maskedCardNumber =
        maskCardNumber(cardInfo.cardNumber); // Mask card number

    final cardType = detectCCType(cardInfo.cardNumber);

    String cardImagePath = '';

    if (cardType == CreditCardType.visa) {
      cardImagePath = 'assets/PaymentPNGs/VISA.png';
    } else if (cardType == CreditCardType.mastercard) {
      cardImagePath = 'assets/PaymentPNGs/Mastercard.png';
    } else if (cardType == CreditCardType.americanExpress) {
      cardImagePath = 'assets/PaymentPNGs/AmericanExpress.png';
    } else if (cardType == CreditCardType.discover) {
      cardImagePath = 'assets/PaymentPNGs/Discover.png';
    }

    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SizedBox(
          height: 25,
          width: 25,
          child: Image.asset(cardImagePath),
        ),
        title: Text(
          maskedCardNumber,
          style: AppFonts.body2(
            color: AppColors.grayscale90,
          ),
        ),
        trailing: GestureDetector(
          onTap: onSelect,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.064,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppColors.primary20 : AppColors.grayscale30,
                width: isSelected ? 6.0 : 1.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String maskCardNumber(String cardNumber) {
  const int visibleDigits = 4;
  final int totalDigits = cardNumber.length;

  if (totalDigits <= visibleDigits) {
    return cardNumber; // No masking required
  }

  final int maskedDigits = totalDigits - visibleDigits;
  final String maskedPart = List.filled(maskedDigits, "*").join("");
  final String visiblePart = cardNumber.substring(totalDigits - visibleDigits);

  // Insert space for every four digits
  final String maskedWithSpaces = maskedPart.splitMapJoin(
    RegExp(r'.{4}'),
    onMatch: (m) => '${m.group(0)} ',
    onNonMatch: (n) => n,
  );

  return "$maskedWithSpaces$visiblePart";
}

class _DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    var newSelection = newValue.selection;

    if (newText.length == 3 && newText.substring(2, 3) != ":") {
      newText = '${newText.substring(0, 2)}:${newText.substring(2)}';
      if (newSelection.start >= 2) {
        newSelection = TextSelection.fromPosition(
          TextPosition(offset: newSelection.start + 1),
        );
      }
    } else if (newText.length > 5) {
      newText = newText.substring(0, 5);
      if (newSelection.start > 5) {
        newSelection = TextSelection.fromPosition(
          const TextPosition(offset: 5),
        );
      }
    }

    return TextEditingValue(
      text: newText,
      selection: newSelection,
      composing: TextRange.empty,
    );
  }
}

enum CreditCardType {
  visa,
  mastercard,
  americanExpress,
  discover,
}

CreditCardType detectCCType(String cardNumber) {
  // Perform your logic to detect the credit card type here
  // This is just a sample implementation
  if (cardNumber.startsWith('4')) {
    return CreditCardType.visa;
  } else if (cardNumber.startsWith('5')) {
    return CreditCardType.mastercard;
  } else if (cardNumber.startsWith('3')) {
    return CreditCardType.americanExpress;
  } else if (cardNumber.startsWith('6')) {
    return CreditCardType.discover;
  } else {
    return CreditCardType.visa; // Default to Visa
  }
}

class ATMCardInfo {
  final String cardHolderName;
  final String expiryDate;
  final String cardNumber;
  final String cvcNumber;

  ATMCardInfo(
      this.cardHolderName, this.cardNumber, this.cvcNumber, this.expiryDate);
}
