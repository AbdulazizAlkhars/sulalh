import 'package:flutter_riverpod/flutter_riverpod.dart';

final firstNameProvider = StateProvider<String>((ref) => '');
final lastNameProvider = StateProvider<String>((ref) => '');
final phoneNumberProvider = StateProvider<String>((ref) => '');
final emailProvider = StateProvider<String>((ref) => '');
final emailAddressVisibilityProvider = StateProvider<bool>((ref) => false);
final phoneNumeberVisibilityProvider = StateProvider<bool>((ref) => false);
