import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hathera_demo/CreateAnimals/ListOfAnimals.dart';

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
final OviAnimalsProvider = StateProvider<List<OviVariables>>((ref) => []);
final layingFrequencyProvider = StateProvider<String>((ref) => '');
final eggsPerMonthProvider = StateProvider<String>((ref) => '');
final selectedBreedingStageProvider = StateProvider<String>((ref) => '');
final selectedDateProvider = StateProvider<String>((ref) => '');
final fieldNameProvider = StateProvider<String>((ref) => '');
final fieldContentProvider = StateProvider<String>((ref) => '');
final additionalnotesProvider = StateProvider<String>((ref) => '');
final selectedOviGenderProvider = StateProvider<String>((ref) => '');
final selectedOviDatesProvider =
    StateProvider<Map<String, DateTime?>>((ref) => {});

final selectedOviChipsProvider = StateProvider<List<String>>((ref) => []);
final customOviTextFieldsProvider = StateProvider<List<Widget>>((ref) => []);
final selectedFiltersProvider = StateProvider<List<String>>((ref) => []);
final dateOfBirthProvider = StateProvider<String>((ref) => '');
