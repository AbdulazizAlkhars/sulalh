import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/CreateAnimals/CreateOviparousMammal.dart';
import 'package:hathera_demo/Riverpod/Globalvariables.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

class SelectedOptionsPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<SelectedOptionsPage> createState() =>
      _SelectedOptionsPageState();
}

class _SelectedOptionsPageState extends ConsumerState<SelectedOptionsPage> {
  @override
  Widget build(BuildContext context) {
    final selectedAnimalType = ref.watch(selectedAnimalTypeProvider);
    final selectedAnimalSpecies = ref.watch(selectedAnimalSpeciesProvider);
    final selectedAnimalBreeds = ref.watch(selectedAnimalBreedsProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Create Animal'.tr,
          style: AppFonts.headline3(color: AppColors.grayscale90),
        ),
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(
              color: AppColors.grayscale10,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          onPressed: () {
            // Handle close button press
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: Container(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                color: AppColors.grayscale10,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(Icons.close_rounded, color: Colors.black),
            ),
            onPressed: () {
              // Handle close button press
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.042,
            right: MediaQuery.of(context).size.width * 0.042),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.029,
            ),
            Text('Chosen Options'.tr,
                style: AppFonts.headline2(color: AppColors.grayscale90)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.009,
            ),
            Text(
              'You can apply any changes'.tr,
              style: AppFonts.body2(color: AppColors.grayscale60),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.029,
            ),
            Row(
              children: [
                Text(
                  'Animal Type'.tr,
                  style: AppFonts.body2(color: AppColors.grayscale70),
                ),
                const Spacer(),
                Text(
                  selectedAnimalType,
                  style: AppFonts.body2(color: AppColors.grayscale90),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    color: AppColors.primary40,
                    size: MediaQuery.of(context).size.width * 0.034),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Divider(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              children: [
                Text(
                  'Animal Species'.tr,
                  style: AppFonts.body2(color: AppColors.grayscale70),
                ),
                const Spacer(),
                Text(
                  selectedAnimalSpecies,
                  style: AppFonts.body2(color: AppColors.grayscale90),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    color: AppColors.primary40,
                    size: MediaQuery.of(context).size.width * 0.034),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Divider(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              children: [
                Text(
                  'Animal Breeds'.tr,
                  style: AppFonts.body2(color: AppColors.grayscale70),
                ),
                const Spacer(),
                Text(
                  selectedAnimalBreeds,
                  style: AppFonts.body2(color: AppColors.grayscale90),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    color: AppColors.primary40,
                    size: MediaQuery.of(context).size.width * 0.034),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            ref
                .read(selectedAnimalImageProvider.notifier)
                .update((state) => null);
            ref.read(animalNameProvider.notifier).update((state) => '');
            ref
                .read(animalSireDetailsProvider.notifier)
                .update((state) => 'ADD');
            ref
                .read(animalDamDetailsProvider.notifier)
                .update((state) => 'ADD');
            ref.read(selectedOviGenderProvider.notifier).update((state) => '');
            ref.read(layingFrequencyProvider.notifier).update((state) => '');
            ref.read(eggsPerMonthProvider.notifier).update((state) => '');
            ref
                .read(selectedBreedingStageProvider.notifier)
                .update((state) => '');
            ref.read(dateOfBirthProvider.notifier).update((state) => '');
            ref.read(selectedOviDatesProvider.notifier).update((state) => {});
            ref.read(selectedOviChipsProvider.notifier).update((state) => []);
            ref.read(fieldNameProvider.notifier).update((state) => '');
            ref.read(fieldContentProvider.notifier).update((state) => '');
            ref.read(additionalnotesProvider.notifier).update((state) => '');
            if (selectedAnimalType == 'Mammal') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateOviCumMammal(),
                ),
              );
            } else if (selectedAnimalType == 'Oviparous') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateOviCumMammal(),
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 36, 86, 38),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Text(
            'Create Animal'.tr,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
