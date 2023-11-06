import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hathera_demo/CreateAnimals/CreateOviparousMammal.dart';
import 'package:hathera_demo/Riverpod/Globalvariables.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

class SelectedOptionsPage extends ConsumerStatefulWidget {
  final String selectedAnimalType;
  final String selectedAnimalSpecies;
  final String selectedAnimalBreed;

  const SelectedOptionsPage({
    super.key,
    required this.selectedAnimalType,
    required this.selectedAnimalSpecies,
    required this.selectedAnimalBreed,
  });

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
          'Create Animal',
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
            Text('Chosen Options',
                style: AppFonts.headline2(color: AppColors.grayscale90)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.009,
            ),
            Text(
              'You can apply any changes',
              style: AppFonts.body2(color: AppColors.grayscale60),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.029,
            ),
            Row(
              children: [
                Text(
                  'Animal Type',
                  style: AppFonts.body2(color: AppColors.grayscale70),
                ),
                const Spacer(),
                Text(
                  widget.selectedAnimalType,
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
                  'Animal Species',
                  style: AppFonts.body2(color: AppColors.grayscale70),
                ),
                const Spacer(),
                Text(
                  widget.selectedAnimalSpecies,
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
                  'Animal Breed',
                  style: AppFonts.body2(color: AppColors.grayscale70),
                ),
                const Spacer(),
                Text(
                  widget.selectedAnimalBreed,
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
            if (widget.selectedAnimalType == 'Mammal') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateOviCumMammal(),
                ),
              );
            } else if (widget.selectedAnimalType == 'Oviparous') {
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
          child: const Text(
            'Create Animal',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
