import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:dotted_border/dotted_border.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/ListOfBreedingEvents.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/ListOfChildren.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/ListOfParents.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/ListOfPartners.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:hathera_demo/Widgets/TagChips.dart';

// ignore: must_be_immutable
class OvigenifnoPage extends StatefulWidget {
  final String fieldName;
  final String fieldContent;
  final TextEditingController notesController;
  final String selectedOviSire;
  final String selectedDate;
  final String selectedOviDam;
  TextEditingController nameController;
  TextEditingController frequencyEggsController;
  TextEditingController numberofEggsController;
  // final DateTime? selectedOviDate;
  final List<String> selectedOviChips;
  final Map<String, DateTime?> selectedOviDates;
  final bool showAdditionalFields;
  final String selectedOviDateType;
  final String selectedOviGender;
  final bool addOviParents;
  final bool addOviChildren;
  final File? selectedOviImage;
  final String selectedAnimalType;
  final String selectedAnimalSpecies;
  final String selectedAnimalBreed;

  OvigenifnoPage({
    super.key,
    required this.fieldName,
    required this.fieldContent,
    required this.notesController,
    required this.selectedOviSire,
    required this.selectedOviDam,
    // required this.selectedOviDate,
    required this.selectedOviChips,
    required this.selectedOviDates,
    required this.showAdditionalFields,
    required this.selectedOviDateType,
    required this.selectedOviGender,
    required this.addOviParents,
    required this.addOviChildren,
    required this.selectedOviImage,
    required this.nameController,
    required this.selectedDate,
    required this.frequencyEggsController,
    required this.numberofEggsController,
    required this.selectedAnimalType,
    required this.selectedAnimalSpecies,
    required this.selectedAnimalBreed,
  });

  @override
  // ignore: library_private_types_in_public_api
  _OvigenifnoPage createState() => _OvigenifnoPage();
}

class _OvigenifnoPage extends State<OvigenifnoPage>
    with SingleTickerProviderStateMixin {
  TextEditingController _medicalNeedsController = TextEditingController();
  bool _isEditMode = false;

  Widget _buildDisplayMode() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _medicalNeedsController.text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Picked File To Be Here',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditMode() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Stack(
            children: [
              TextFormField(
                maxLines: 6, // Set the maximum number of lines
                controller: _medicalNeedsController,
                decoration: InputDecoration(
                  hintText:
                      'Add Additional Information If Needed', // Add your hint text here
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                ),
                textInputAction:
                    TextInputAction.done, // Change the keyboard action
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    // Clear the text field
                    _medicalNeedsController.clear();
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              // Add your logic to open the file manager and select files here
            },
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(20),
              dashPattern: const [7, 7],
              strokeWidth: 1,
              color: Colors.grey,
              child: SizedBox(
                width: double.infinity, // Set the width of the container
                height: 150, // Set the height of the container
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.file_open_outlined,
                        size: 35,
                      ),
                      onPressed: () {
                        // Handle back button press
                        // Add your code here
                      },
                    ),
                    const Text(
                      'Upload File, PDF, Jpeg, PNG',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _medicalNeedsController.text = "";
  }

  @override
  void dispose() {
    _tabController.dispose();
    _medicalNeedsController.dispose();
    super.dispose();
  }

  String calculateAge(DateTime? selectedDate) {
    if (selectedDate == null) {
      return 'Not Selected'; // Handle the case when the date is not selected
    }

    final currentDate = DateTime.now();
    final ageInYears = currentDate.year - selectedDate.year;
    return '$ageInYears Years';
  }

  DateTime? parseSelectedDate(String? selectedDate) {
    if (selectedDate == null) {
      return null; // Return null if the date is not selected
    }

    try {
      return DateFormat('dd.MM.yyyy').parse(selectedDate);
    } catch (e) {
      return null; // Return null if there is an error parsing the date
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = parseSelectedDate(widget.selectedDate);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/AccountProfile/image 20.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // Handle back button press
                  // Add your code here
                },
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // Handle edit button press
                    // Add your code here
                  },
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 100),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      FractionalTranslation(
                        translation: const Offset(0.0, -0.6),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.grey[200],
                          child: const Icon(
                            Icons.photo_library_outlined,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: const Offset(
                      0.0, -60.0), // Adjust the Y offset to move the text up
                  child: Column(
                    children: [
                      Text(
                        widget.nameController.text,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        'ID# 12345',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: widget.selectedOviChips.map((chip) {
                          return CustomTag(
                            label: chip,
                            selected: true, // Since these are selected chips
                            onTap: () {},
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),
                      IntrinsicWidth(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 242, 122),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: const Row(
                            children: [
                              Icon(Icons.home, color: Colors.black),
                              SizedBox(width: 8),
                              Text(
                                'My Farm',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TabBar(
                          controller: _tabController,
                          indicator: BoxDecoration(
                            color: const Color.fromARGB(255, 36, 86, 38),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: Colors.transparent,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.grey,
                          tabs: const [
                            Tab(
                              text: 'General',
                            ),
                            Tab(
                              text: 'Breeding',
                            ),
                            Tab(
                              text: 'Medical',
                            ),
                          ],
                        ),
                      ),

                      // Tab Bar View
                      // Tab Bar View
                      // Tab Bar View
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height - 190 - 20 - 50,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            // General Tabbar Starts
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                      height:
                                          15), // Add spacing between the boxes
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 251, 247, 206),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              widget.selectedAnimalType,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              'Type',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              widget.selectedAnimalSpecies,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              'Species',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              widget.selectedOviGender,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              'Sex',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'General Information',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 13),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      children: [
                                        const Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Age',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 0,
                                          child: Text(
                                            calculateAge(selectedDate),
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: selectedDate != null
                                                  ? Colors.black
                                                  : Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      children: [
                                        const Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Breed',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 0,
                                          child: Text(
                                            widget.selectedAnimalBreed,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      children: [
                                        const Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Date Of Hatching',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 0,
                                          child: widget.selectedOviDates
                                                      .containsKey(
                                                          'Date Of Hatching') &&
                                                  widget.selectedOviDates[
                                                          'Date Of Hatching'] !=
                                                      null
                                              ? Text(
                                                  DateFormat('dd.MM.yyyy')
                                                      .format(
                                                    widget.selectedOviDates[
                                                        'Date Of Hatching']!,
                                                  ),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                )
                                              : const Text(
                                                  'ADD',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors
                                                        .blue, // You can customize the button's color
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      children: [
                                        const Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Date Of Death',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 0,
                                          child: widget.selectedOviDates
                                                      .containsKey(
                                                          'Date Of Death') &&
                                                  widget.selectedOviDates[
                                                          'Date Of Death'] !=
                                                      null
                                              ? Text(
                                                  DateFormat('dd.MM.yyyy')
                                                      .format(
                                                    widget.selectedOviDates[
                                                        'Date Of Death']!,
                                                  ),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                )
                                              : const Text(
                                                  'ADD',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors
                                                        .blue, // You can customize the button's color
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      children: [
                                        const Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Date Of Sale',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 0,
                                          child: widget.selectedOviDates
                                                      .containsKey(
                                                          'Date Of Sale') &&
                                                  widget.selectedOviDates[
                                                          'Date Of Sale'] !=
                                                      null
                                              ? Text(
                                                  DateFormat('dd.MM.yyyy')
                                                      .format(
                                                    widget.selectedOviDates[
                                                        'Date Of Sale']!,
                                                  ),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                )
                                              : const Text(
                                                  'ADD',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors
                                                        .blue, // You can customize the button's color
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            widget.fieldName,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 0,
                                          child: Text(
                                            widget.fieldContent,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Additonal Notes',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),

                                  const SizedBox(height: 12),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text(
                                      widget.notesController.text,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Uploaded Files To Be Here',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
// General Tabbar Ends
                            //Breeding Tabbbar View Starts
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 15),
                                  // Add spacing between the boxes
                                  Visibility(
                                    visible:
                                        widget.selectedOviGender == 'Female',
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(8),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 251, 247, 206),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Pregnant',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              const Text(
                                                'Current Status',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 251, 247, 206),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              widget.selectedOviDates.entries
                                                          .toList()[0]
                                                          .value !=
                                                      null
                                                  ? DateFormat('dd.MM.yyyy')
                                                      .format(widget
                                                          .selectedOviDates
                                                          .entries
                                                          .toList()[0]
                                                          .value!)
                                                  : '',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              widget.selectedOviGender == 'Male'
                                                  ? 'Date Of Mating'
                                                  : 'Last Hatching Date',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              widget.selectedOviDates.entries
                                                          .toList()[0]
                                                          .value !=
                                                      null
                                                  ? DateFormat('dd.MM.yyyy')
                                                      .format(widget
                                                          .selectedOviDates
                                                          .entries
                                                          .toList()[0]
                                                          .value!)
                                                  : '',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              widget.selectedOviGender == 'Male'
                                                  ? 'Next Date Of Mating'
                                                  : 'Frequency Of Laying Eggs',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 13),
                                  ListTile(
                                    leading: const CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(164, 76, 175, 79),
                                      child: Icon(Icons.history,
                                          color: Colors.white),
                                    ),
                                    title: const Text('Breeding History'),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.arrow_right),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ListOfBreedingEvents(
                                                // Pass any required parameters here
                                                breedingNotesController:
                                                    TextEditingController(),
                                                breedingEventNumberController:
                                                    TextEditingController(),
                                                selectedBreedSire: '',
                                                selectedBreedDam: '',
                                                selectedBreedPartner: '',
                                                selectedBreedChildren: '',
                                                selectedBreedingDate: '',
                                                selectedDeliveryDate: '',
                                              ),
                                            ));
                                        // Add your onPressed logic here
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    leading: const CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(164, 76, 175, 79),
                                      child: Icon(Icons.bedroom_parent,
                                          color: Colors.white),
                                    ),
                                    title: const Text('Parents'),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.arrow_right),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ListOfParents(
                                              selectedOviSire:
                                                  widget.selectedOviSire,
                                              selectedOviDam:
                                                  widget.selectedOviDam,

                                              // Convert DateTime to String
                                            ),
                                          ),
                                        );

                                        // Add your onPressed logic here
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    leading: const CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(164, 76, 175, 79),
                                      child: Icon(Icons.route,
                                          color: Colors.white),
                                    ),
                                    title: const Text('Family Tree'),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.arrow_right),
                                      onPressed: () {
                                        // Add your onPressed logic here
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    leading: const CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(164, 76, 175, 79),
                                      child: Icon(Icons.man_outlined,
                                          color: Colors.white),
                                    ),
                                    title: const Text('Male Mates'),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.arrow_right),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ListOfPartners()));
                                        // Add your onPressed logic here
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    leading: const CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(164, 76, 175, 79),
                                      child: Icon(Icons.child_friendly,
                                          color: Colors.white),
                                    ),
                                    title: const Text('Children'),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.arrow_right),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ListOfChildren()));
                                        // Add your onPressed logic here
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Breeding Tabbbar View Ends

                            // Medical Tabbar View Starts
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 15),
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 251, 247, 206),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              '01.01.2023',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              'Next Vaccination',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 251, 247, 206),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              '12.02.2023',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              'Last Check Up',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '02.08.2023',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              'Next Check Up',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Medical Needs',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                          ),
                                        ),
                                        _isEditMode
                                            ? ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                ),
                                                onPressed: () {
                                                  // Handle save button press
                                                  // Add your code here to save the edited text
                                                  setState(() {
                                                    _isEditMode = false;
                                                  });
                                                },
                                                child: Text(
                                                  'Save',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                            : IconButton(
                                                icon: const Icon(
                                                  Icons.edit_square,
                                                  color: const Color.fromARGB(
                                                      255, 36, 86, 38),
                                                ),
                                                onPressed: () {
                                                  // Enter edit mode
                                                  setState(() {
                                                    _isEditMode = true;
                                                  });
                                                },
                                              ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _isEditMode
                                      ? _buildEditMode()
                                      : _buildDisplayMode(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Visibility(
                                    visible:
                                        widget.selectedOviGender == 'Female',
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Text(
                                            'Pregnancy Check',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const SizedBox(height: 13),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Row(
                                            children: [
                                              const Expanded(
                                                flex: 2,
                                                child: Text(
                                                  'Count On Pregnancies',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 0,
                                                child: Text(
                                                  '1',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Row(
                                            children: [
                                              const Expanded(
                                                flex: 2,
                                                child: Text(
                                                  'Pregnancy Status',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 0,
                                                child: Text(
                                                  'Not Pregnant >',
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Row(
                                            children: [
                                              const Expanded(
                                                flex: 2,
                                                child: Text(
                                                  'Date Of Mating',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 0,
                                                child: widget.selectedOviDates
                                                            .containsKey(
                                                                'Date Of Hatching') &&
                                                        widget.selectedOviDates[
                                                                'Date Of Hatching'] !=
                                                            null
                                                    ? Text(
                                                        DateFormat('dd.MM.yyyy')
                                                            .format(
                                                          widget.selectedOviDates[
                                                              'Date Of Hatching']!,
                                                        ),
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                        ),
                                                      )
                                                    : const Text(
                                                        'ADD',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors
                                                              .blue, // You can customize the button's color
                                                        ),
                                                      ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Row(
                                            children: [
                                              const Expanded(
                                                flex: 2,
                                                child: Text(
                                                  'Date Of Sonar',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 0,
                                                child: widget.selectedOviDates
                                                            .containsKey(
                                                                'Date Of Death') &&
                                                        widget.selectedOviDates[
                                                                'Date Of Death'] !=
                                                            null
                                                    ? Text(
                                                        DateFormat('dd.MM.yyyy')
                                                            .format(
                                                          widget.selectedOviDates[
                                                              'Date Of Death']!,
                                                        ),
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                        ),
                                                      )
                                                    : const Text(
                                                        'ADD',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors
                                                              .blue, // You can customize the button's color
                                                        ),
                                                      ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Row(
                                            children: [
                                              const Expanded(
                                                flex: 2,
                                                child: Text(
                                                  'Exp. Delivery Date',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 0,
                                                child: widget.selectedOviDates
                                                            .containsKey(
                                                                'Date Of Sale') &&
                                                        widget.selectedOviDates[
                                                                'Date Of Sale'] !=
                                                            null
                                                    ? Text(
                                                        DateFormat('dd.MM.yyyy')
                                                            .format(
                                                          widget.selectedOviDates[
                                                              'Date Of Sale']!,
                                                        ),
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                        ),
                                                      )
                                                    : const Text(
                                                        'ADD',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors
                                                              .blue, // You can customize the button's color
                                                        ),
                                                      ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            widget.fieldName,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 0,
                                          child: Text(
                                            widget.fieldContent,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Additonal Notes',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text(
                                      widget.notesController.text,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Medical Tabbar View Ends
                          ],
                        ),
                      ),
                      Container()
                    ],
                  ),
                ),

                // Tab Bar
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildInfoBox(String label) {
  return Container(
    width: 100,
    height: 40,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 242, 122),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Center(
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    ),
  );
}
