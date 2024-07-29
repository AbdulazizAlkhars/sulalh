import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:intl/intl.dart';

import '../../Theme/Fonts.dart';
import 'data.dart';
import 'pregnancy_details.dart';

class MammalsListPage extends StatefulWidget {
  @override
  _MammalsListPageState createState() => _MammalsListPageState();
}

class _MammalsListPageState extends State<MammalsListPage> {
  final List<PregnancyDetails> pregnancyDetailsList = [
    PregnancyDetails(
      animalName: 'Suhail',
      animalSpecies: 'Cat',
      breedingDate: DateTime.now().subtract(Duration(days: 8)),
    ),
    PregnancyDetails(
      animalName: 'Azam',
      animalSpecies: 'Dog',
      breedingDate: DateTime.now().subtract(Duration(days: 1)),
    ),
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  int selectedSpeciesIndex = 0;
  String selectedBreed = '';
  DateTime? selectedDate;
  void _addPregnancyDetails() {
    DateTime breedingDate =
        DateFormat('yyyy-MM-dd').parse(_dateController.text);
    setState(() {
      pregnancyDetailsList.add(PregnancyDetails(
        animalName: _nameController.text,
        animalSpecies: animalSpecies[selectedSpeciesIndex]['name'],
        breedingDate: breedingDate,
      ));
    });
    _nameController.clear();
    _dateController.clear();
    selectedSpeciesIndex = 0;
    selectedBreed = '';
    Navigator.of(context).pop();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  void _showAddPregnancyDetailsModalSheet() {
    showModalBottomSheet(
      showDragHandle: true,
      backgroundColor: AppColors.grayscale00,
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      'Add Pregnant Animal',
                      style: AppFonts.title4(color: AppColors.grayscale100),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            animalSpecies.asMap().entries.map((speciesEntry) {
                          final int speciesIndex = speciesEntry.key;
                          final species = speciesEntry.value;
                          final speciesName = species['name'];
                          final speciesImageAsset = species['imageAsset'];

                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setModalState(() {
                                    selectedSpeciesIndex = speciesIndex;
                                    selectedBreed =
                                        ''; // Reset selected breed when changing species
                                  });
                                },
                                child: SizedBox(
                                  height: 100,
                                  width: 70,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: selectedSpeciesIndex ==
                                                      speciesIndex
                                                  ? Colors.green
                                                      .withOpacity(0.5)
                                                  : Colors.transparent,
                                              spreadRadius: 5,
                                              blurRadius: 2,
                                            ),
                                          ],
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.grey[200],
                                          radius: 25,
                                          backgroundImage:
                                              AssetImage(speciesImageAsset),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Flexible(
                                        child: Text(
                                          speciesName,
                                          style: const TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Enter The Name Of Mother',
                    style: AppFonts.body1(color: AppColors.grayscale100),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(
                          color: AppColors.grayscale20), // Outline color
                      color: Colors.white, // Background color
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: "Enter the Name",
                          hintStyle: TextStyle(
                              color: AppColors
                                  .grayscale30), // Change hint text color

                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                          selectedDate == null
                              ? "Select the Breeding Date"
                              : DateFormat('yyyy-MM-dd').format(selectedDate!),
                          style: AppFonts.headline4(
                              color: AppColors.grayscale100)),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: AppColors.primary50,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Calendar',
                                  style: AppFonts.body1(
                                      color: AppColors.grayscale00),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.calendar_today,
                                  color: AppColors.grayscale00,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _addPregnancyDetails,
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.primary50,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        'Add Animal',
                        style: AppFonts.body1(color: AppColors.grayscale0),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayscale00,
      appBar: AppBar(
        backgroundColor: AppColors.grayscale00,
        surfaceTintColor: AppColors.grayscale00,
        title: Text(
          'Pregnant Mammals',
          style: AppFonts.title4(color: AppColors.grayscale100),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary50,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: AppColors.grayscale00,
                ),
                onPressed: _showAddPregnancyDetailsModalSheet,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: pregnancyDetailsList.length,
        itemBuilder: (context, index) {
          final details = pregnancyDetailsList[index];
          return ListTile(
            title: Text(
              details.animalName,
              style: AppFonts.title5(color: AppColors.grayscale100),
            ),
            subtitle: Text(
              details.animalSpecies,
              style: AppFonts.headline4(color: AppColors.grayscale100),
            ),
            trailing: Text(
              DateFormat('dd/MM/yyyy').format(details.breedingDate),
              style: AppFonts.body1(color: AppColors.primary40),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PregnancyDetailPage(details: details),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
