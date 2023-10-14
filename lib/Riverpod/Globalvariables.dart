import 'dart:io';

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
final proflePictureProvider = StateProvider<File?>((ref) => null);
final selectedAnimalTypeProvider = StateProvider<String>((ref) => '');
final selectedAnimalSpeciesProvider = StateProvider<String>((ref) => '');
final selectedAnimalBreedsProvider = StateProvider<String>((ref) => '');
final selectedAnimalImageProvider = StateProvider<File?>((ref) => null);
final animalNameProvider = StateProvider<String>((ref) => '');
final animalSireDetailsProvider = StateProvider<String>((ref) => 'Add');
final animalDamDetailsProvider = StateProvider<String>((ref) => 'Add');
