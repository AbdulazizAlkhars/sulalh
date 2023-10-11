import 'package:flutter_riverpod/flutter_riverpod.dart';

final firstNameProvider = StateProvider<String>((ref) => '');
final lastNameProvider = StateProvider<String>((ref) => '');
final phoneNumberProvider = StateProvider<String>((ref) => '');
final emailProvider = StateProvider<String>((ref) => '');
final emailAddressVisibilityProvider = StateProvider<bool>((ref) => false);
final phoneNumberVisibilityProvider = StateProvider<bool>((ref) => false);
final selectedCountryCodeProvider = StateProvider<String>((ref) => '+971');
final selectedSearchFarmProvider =
    StateProvider<Map<String, dynamic>?>(((ref) => null));
final selectedSearchAnimalProvider =
    StateProvider<Map<String, dynamic>?>(((ref) => null));
