// ignore: depend_on_referenced_packages

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/FamilyTree.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/ListOfBreedingEvents.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/ListOfChildren.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/ListOfParents.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/ListOfPartners.dart';
import 'package:hathera_demo/Animal_Information/EnlargedAnimalPic.dart';
import 'package:hathera_demo/CreateAnimals/ListOfAnimals.dart';
import 'package:hathera_demo/Riverpod/Globalvariables.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';
import 'package:hathera_demo/Widgets/Button.dart';
import 'package:hathera_demo/Widgets/UploadFiles.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:hathera_demo/Widgets/TagChips.dart';

// ignore: table
class OvigenifnoPage extends ConsumerStatefulWidget {
  final OviVariables OviDetails;

  OvigenifnoPage({
    required this.OviDetails,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _OvigenifnoPage createState() => _OvigenifnoPage();
}

class _OvigenifnoPage extends ConsumerState<OvigenifnoPage>
    with SingleTickerProviderStateMixin {
  TextEditingController _medicalNeedsController = TextEditingController();
  bool _isEditMode = false;
  String newpregnantStatus = '';
  String pregnantStatuses = '';
  String newmatingdate = 'ADD';
  String newsonardate = 'ADD';
  String newexpdeliverydate = 'ADD';
  DateTime? selectedmatingDate;
  DateTime? selectedsonarDate;
  DateTime? selectedexpdeliveryDate;
  List<String> vaccineNames = ["Vaccine 1", "Vaccine 2", "Vaccine 3"];
  List<String> checkUpNames = ["Check Up 1", "Check Up 2", "Check Up 3"];
  List<String> surgeryNames = ["Surgery 1", "Surgery 2", "Surgery 3"];
  List<VaccineDetails> vaccineDetailsList = [];
  List<MedicalCheckupDetails> medicalCheckupDetailsList = [];
  List<SurgeryDetails> surgeryDetailsList = [];
  // String medicalNeeds = '';

  Widget _buildDisplayMode() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextButton(
        onPressed: () {},
        child: Text(
          widget.OviDetails.medicalNeeds.isNotEmpty
              ? widget.OviDetails.medicalNeeds
              : 'Be sure to include joint support medicine, antibiotics, anti-inflammatory medication, and topical antiseptics when packing your first-aid kit for your horses. If you have the essentials, you can keep your four-legged friends in the best condition possible.',
          // _medicalNeedsController.text.isNotEmpty
          //     ? _medicalNeedsController.text
          //     :
          style: AppFonts.body2(color: AppColors.grayscale70),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          const Icon(
            Icons.file_copy_outlined,
            color: AppColors.primary30,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'fileName',
              style: AppFonts.body1(color: AppColors.grayscale90),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ]);
  }

  void _showmatingDatePickerModalSheet() async {
    final DateTime? matingDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (matingDate != null && matingDate != selectedmatingDate) {
      setState(() {
        selectedmatingDate = matingDate;
        newmatingdate = DateFormat.yMMMd().format(matingDate);
      });
    }
  }

  void _showsonarDatePickerModalSheet() async {
    final DateTime? sonarDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (sonarDate != null && sonarDate != selectedsonarDate) {
      setState(() {
        selectedsonarDate = sonarDate;
        newsonardate = DateFormat.yMMMd().format(sonarDate);
      });
    }
  }

  void _showexpdeliveryDatePickerModalSheet() async {
    final DateTime? expdeliveryDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (expdeliveryDate != null && expdeliveryDate != selectedexpdeliveryDate) {
      setState(() {
        selectedexpdeliveryDate = expdeliveryDate;
        newexpdeliverydate = DateFormat.yMMMd().format(expdeliveryDate);
      });
    }
  }

  void _showPregnantStatusSelection() {
    double sheetHeight = MediaQuery.of(context).size.height * 0.35;
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: sheetHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Pregnancy Status',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text('Not Pregnant'),
                            trailing: pregnantStatuses == 'Not Pregnant'
                                ? Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.green,
                                        width: 6.0,
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                            onTap: () {
                              setState(() {
                                pregnantStatuses = 'Not Pregnant';
                              });
                            },
                          ),
                          ListTile(
                            title: const Text('Pregnant'),
                            trailing: pregnantStatuses == 'Pregnant'
                                ? Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.green,
                                        width: 6.0,
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                            onTap: () {
                              setState(() {
                                pregnantStatuses = 'Pregnant';
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ButtonWidget(
                      onPressed: () {
                        setState(() {
                          newpregnantStatus = pregnantStatuses;
                        });
                        Navigator.pop(context);
                      },
                      buttonText: 'Confirm',
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((_) {
      setState(() {
        newpregnantStatus = pregnantStatuses;
      });
    });
  }

  Widget _buildEditMode() {
    return Column(
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
                icon: const Icon(Icons.clear),
                onPressed: () {
                  // Clear the text field
                  _medicalNeedsController.clear();
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 270,
          width: double.infinity,
          child: Focus(
            onFocusChange: (hasFocus) {}, // Dummy onFocusChange callback
            child: const FileUploaderField(),
          ),
        ),
      ],
    );
  }

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _medicalNeedsController.text = widget.OviDetails.medicalNeeds;
  }

  @override
  void dispose() {
    _tabController.dispose();
    // _medicalNeedsController.dispose();
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
    final selectedDate = parseSelectedDate(widget.OviDetails.dateOfBirth);
    double heightMediaQuery = MediaQuery.of(context).size.height / 812;
    double widthMediaQuery = MediaQuery.of(context).size.width / 375;

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/graphic/Animal_p.png",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            top: 8.0,
            left: 8.0,
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
                },
              ),
            ),
          ),
          Positioned(
            top: 8.0,
            right: 8.0,
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
          Positioned(
            top: MediaQuery.of(context).size.height * 0.228,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      MediaQuery.of(context).size.width * 0.085),
                  topRight: Radius.circular(
                      MediaQuery.of(context).size.width * 0.085),
                ),
              ),
              child: const SizedBox(), // Add your content here
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 160),
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EnlargedAnimalImageScreen(
                                    image: widget.OviDetails.selectedOviImage,
                                  ),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.16,
                              backgroundColor: Colors.grey[100],
                              backgroundImage:
                                  widget.OviDetails.selectedOviImage != null
                                      ? FileImage(
                                          widget.OviDetails.selectedOviImage!)
                                      : null,
                              child: widget.OviDetails.selectedOviImage == null
                                  ? const Icon(
                                      Icons.camera_alt_outlined,
                                      size: 50,
                                      color: Colors.grey,
                                    )
                                  : null,
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
                        Text(widget.OviDetails.animalName,
                            style:
                                AppFonts.title4(color: AppColors.grayscale90)),
                        Text(
                          '#1234',
                          style: AppFonts.body2(color: AppColors.grayscale70),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.019,
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children:
                              widget.OviDetails.selectedOviChips.map((chip) {
                            return CustomTag(
                              label: chip,
                              selected: true, // Since these are selected chips
                              onTap: () {},
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        IntrinsicWidth(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.secondary40,
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.91,
                          height: MediaQuery.of(context).size.height * 0.05,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: AppColors.grayscale30,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: TabBar(
                            controller: _tabController,
                            indicator: BoxDecoration(
                              color: AppColors.primary50,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorColor: Colors.transparent,
                            labelColor: AppColors.grayscale0,
                            unselectedLabelColor: AppColors.grayscale60,
                            labelStyle:
                                AppFonts.body2(color: AppColors.grayscale0),
                            tabs: [
                              Tab(
                                text: 'General'.tr,
                              ),
                              Tab(
                                text: 'Breeding'.tr,
                              ),
                              Tab(
                                text: 'Medical'.tr,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.91,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              // General Tabbar Starts
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.017,
                                    ),
                                    Container(
                                      height: 70,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF9F5EC),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  widget.OviDetails
                                                      .selectedAnimalType,
                                                  style: AppFonts.body2(
                                                      color: AppColors
                                                          .grayscale90),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  'Type'.tr,
                                                  style: AppFonts.body2(
                                                      color: AppColors
                                                          .grayscale90),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  widget.OviDetails
                                                      .selectedAnimalSpecies,
                                                  style: AppFonts.body2(
                                                      color: AppColors
                                                          .grayscale90),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  'Species'.tr,
                                                  style: AppFonts.body2(
                                                      color: AppColors
                                                          .grayscale90),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  widget.OviDetails
                                                      .selectedOviGender,
                                                  style: AppFonts.body2(
                                                      color: AppColors
                                                          .grayscale90),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  'Sex'.tr,
                                                  style: AppFonts.body2(
                                                      color: AppColors
                                                          .grayscale90),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                    ),
                                    Text(
                                      'General Information'.tr,
                                      style: AppFonts.title5(
                                          color: AppColors.grayscale90),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Age'.tr,
                                          style: AppFonts.body2(
                                            color: AppColors.grayscale70,
                                          ),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {},
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
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Breed'.tr,
                                          style: AppFonts.body2(
                                            color: AppColors.grayscale70,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          widget.OviDetails.selectedAnimalBreed,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Date Of Hatching'.tr,
                                          style: AppFonts.body2(
                                            color: AppColors.grayscale70,
                                          ),
                                        ),
                                        const Spacer(),
                                        widget.OviDetails.selectedOviDates
                                                    .containsKey(
                                                        'Date Of Hatching'
                                                            .tr) &&
                                                widget.OviDetails
                                                            .selectedOviDates[
                                                        'Date Of Hatching'
                                                            .tr] !=
                                                    null
                                            ? Text(
                                                DateFormat('dd.MM.yyyy').format(
                                                  widget.OviDetails
                                                          .selectedOviDates[
                                                      'Date Of Hatching'.tr]!,
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
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Date Of Death'.tr,
                                          style: AppFonts.body2(
                                            color: AppColors.grayscale70,
                                          ),
                                        ),
                                        const Spacer(),
                                        widget.OviDetails.selectedOviDates
                                                    .containsKey(
                                                        'Date Of Death'.tr) &&
                                                widget.OviDetails
                                                            .selectedOviDates[
                                                        'Date Of Death'.tr] !=
                                                    null
                                            ? Text(
                                                DateFormat('dd.MM.yyyy').format(
                                                  widget.OviDetails
                                                          .selectedOviDates[
                                                      'Date Of Death'.tr]!,
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
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Date Of Sale'.tr,
                                          style: AppFonts.body2(
                                            color: AppColors.grayscale70,
                                          ),
                                        ),
                                        const Spacer(),
                                        widget.OviDetails.selectedOviDates
                                                    .containsKey(
                                                        'Date Of Sale'.tr) &&
                                                widget.OviDetails
                                                            .selectedOviDates[
                                                        'Date Of Sale'.tr] !=
                                                    null
                                            ? Text(
                                                DateFormat('dd.MM.yyyy').format(
                                                  widget.OviDetails
                                                          .selectedOviDates[
                                                      'Date Of Sale'.tr]!,
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
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          widget.OviDetails.fieldName,
                                          style: AppFonts.body2(
                                            color: AppColors.grayscale70,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          widget.OviDetails.fieldContent,
                                          style: AppFonts.body2(
                                            color: AppColors.grayscale70,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Text(
                                      'Additonal Notes'.tr,
                                      style: AppFonts.title5(
                                          color: AppColors.grayscale90),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Text(
                                      widget.OviDetails.notes,
                                      style: AppFonts.body2(
                                        color: AppColors.grayscale70,
                                      ),
                                    ),
                                    Text(
                                      'Uploaded Files To Be Here',
                                      style: AppFonts.title5(
                                          color: AppColors.grayscale90),
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
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.017,
                                    ),
                                    Visibility(
                                      visible:
                                          widget.OviDetails.selectedOviGender ==
                                              'Female',
                                      child: Container(
                                        height: 70,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF9F5EC),
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  'Pregnant',
                                                  style: AppFonts.body2(
                                                      color: AppColors
                                                          .grayscale90),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  'Current Status',
                                                  style: AppFonts.caption2(
                                                      color: AppColors
                                                          .grayscale70),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.017,
                                    ),
                                    Container(
                                      height: 70,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF9F5EC),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  widget
                                                              .OviDetails
                                                              .selectedOviDates
                                                              .entries
                                                              .toList()[0]
                                                              .value !=
                                                          null
                                                      ? DateFormat('dd.MM.yyyy')
                                                          .format(widget
                                                              .OviDetails
                                                              .selectedOviDates
                                                              .entries
                                                              .toList()[0]
                                                              .value!)
                                                      : '',
                                                  style: AppFonts.body2(
                                                      color: AppColors
                                                          .grayscale90),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.01,
                                                ),
                                                Text(
                                                  widget.OviDetails
                                                                  .selectedOviGender ==
                                                              'Male' &&
                                                          widget.OviDetails
                                                                  .selectedAnimalType ==
                                                              'Mammal'
                                                      ? 'Date Of Mating'
                                                      : 'Last Hatching Date',
                                                  style: AppFonts.body2(
                                                      color: AppColors
                                                          .grayscale90),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  widget.OviDetails
                                                      .layingFrequency,
                                                  style: AppFonts.body2(
                                                      color: AppColors
                                                          .grayscale90),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.01,
                                                ),
                                                Text(
                                                  widget.OviDetails
                                                                  .selectedOviGender ==
                                                              'Male' &&
                                                          widget.OviDetails
                                                                  .selectedAnimalType ==
                                                              'Mammal'
                                                      ? 'Next Date Of Mating'
                                                      : 'Frequency Of Laying Eggs',
                                                  style: AppFonts.body2(
                                                      color: AppColors
                                                          .grayscale90),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.017,
                                    ),
                                    ListTile(
                                      contentPadding: const EdgeInsets.only(
                                          right: 0, left: 0),
                                      leading: Image.asset(
                                          'assets/icons/frame/24px/breeding_history.png'),
                                      title: Text(
                                        'Breeding History',
                                        style: AppFonts.headline3(
                                            color: AppColors.grayscale90),
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(Icons.chevron_right_rounded,
                                            size: 24 * widthMediaQuery),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ListOfBreedingEvents(
                                                  OviDetails: widget.OviDetails,
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
                                      contentPadding: const EdgeInsets.only(
                                          right: 0, left: 0),
                                      leading: Image.asset(
                                          'assets/icons/frame/24px/parents.png'),
                                      title: Text(
                                        'Parents',
                                        style: AppFonts.headline3(
                                            color: AppColors.grayscale90),
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(Icons.chevron_right_rounded,
                                            size: 24 * widthMediaQuery),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ListOfParents(
                                                selectedOviSire: widget
                                                    .OviDetails.selectedOviSire,
                                                selectedOviDam: widget
                                                    .OviDetails.selectedOviDam,
                                                selectedMammalSire: '',
                                                selectedMammalDam: '',

                                                // Convert DateTime to String
                                              ),
                                            ),
                                          );

                                          // Add your onPressed logic here
                                        },
                                      ),
                                    ),
                                    ListTile(
                                      contentPadding: const EdgeInsets.only(
                                          right: 0, left: 0),
                                      leading: Image.asset(
                                          'assets/icons/frame/24px/family_tree.png'),
                                      title: Text(
                                        'Family Tree',
                                        style: AppFonts.headline3(
                                            color: AppColors.grayscale90),
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(Icons.chevron_right_rounded,
                                            size: 24 * widthMediaQuery),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const FamilyTree(

                                                      // Convert DateTime to String
                                                      ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    ListTile(
                                      contentPadding: const EdgeInsets.only(
                                          right: 0, left: 0),
                                      leading: Image.asset(
                                          'assets/icons/frame/24px/male_mates.png'),
                                      title: Text(
                                        'Mates',
                                        style: AppFonts.headline3(
                                            color: AppColors.grayscale90),
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(Icons.chevron_right_rounded,
                                            size: 24 * widthMediaQuery),
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
                                      contentPadding: EdgeInsets.only(
                                          right: 0,
                                          left: 0,
                                          bottom: 32 * heightMediaQuery),
                                      leading: Image.asset(
                                          'assets/icons/frame/24px/children.png'),
                                      title: Text(
                                        'Children',
                                        style: AppFonts.headline3(
                                            color: AppColors.grayscale90),
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(Icons.chevron_right_rounded,
                                            size: 24 * widthMediaQuery),
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
                                      height: 70,
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF9F5EC),
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
                                                style: AppFonts.body2(
                                                    color:
                                                        AppColors.grayscale90),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Next Vaccination',
                                                style: AppFonts.body2(
                                                    color:
                                                        AppColors.grayscale90),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.017,
                                    ),
                                    Container(
                                      height: 70,
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF9F5EC),
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
                                                style: AppFonts.body2(
                                                    color:
                                                        AppColors.grayscale90),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Last Check Up',
                                                style: AppFonts.body2(
                                                    color:
                                                        AppColors.grayscale90),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                '02.08.2023',
                                                style: AppFonts.body2(
                                                    color:
                                                        AppColors.grayscale90),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Next Check Up',
                                                style: AppFonts.body2(
                                                    color:
                                                        AppColors.grayscale90),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Medical Needs',
                                          style: AppFonts.title5(
                                              color: AppColors.grayscale90),
                                        ),
                                        _isEditMode
                                            ? ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                ),
                                                onPressed: () {
                                                  final updatedOviDetails =
                                                      widget.OviDetails
                                                          .copyWith(
                                                    medicalNeeds:
                                                        _medicalNeedsController
                                                            .text,
                                                  );

                                                  final oviAnimals = ref
                                                      .read(ovianimalsProvider);
                                                  final index =
                                                      oviAnimals.indexOf(
                                                          widget.OviDetails);
                                                  if (index >= 0) {
                                                    oviAnimals[index] =
                                                        updatedOviDetails;
                                                  }
                                                  setState(() {
                                                    _isEditMode = false;
                                                  });
                                                },
                                                child: const Text(
                                                  'Save',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                            : IconButton(
                                                icon: Image.asset(
                                                  'assets/icons/frame/24px/24_Edit.png',
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
                                    _isEditMode
                                        ? _buildEditMode()
                                        : _buildDisplayMode(),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Visibility(
                                      visible:
                                          widget.OviDetails.selectedOviGender ==
                                              'Female',
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Pregnancy Check',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 13),
                                          Row(
                                            children: [
                                              const Text(
                                                'Count On Pregnancies',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const Spacer(),
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text(
                                                  '1',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                'Pregnancy Status',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              ),
                                              const Spacer(),
                                              TextButton(
                                                onPressed:
                                                    _showPregnantStatusSelection,
                                                child: Text(
                                                  '$newpregnantStatus >',
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color.fromARGB(
                                                          255, 36, 86, 38)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                'Date Of Mating',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const Spacer(),
                                              TextButton(
                                                onPressed:
                                                    _showmatingDatePickerModalSheet,
                                                child: Text(
                                                  '$newmatingdate >',
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFF245626)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                'Date Of Sonar',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const Spacer(),
                                              TextButton(
                                                onPressed:
                                                    _showsonarDatePickerModalSheet,
                                                child: Text(
                                                  '$newsonardate >',
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFF245626)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                'Exp. Delivery Date',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const Spacer(),
                                              TextButton(
                                                onPressed:
                                                    _showexpdeliveryDatePickerModalSheet,
                                                child: Text(
                                                  '$newexpdeliverydate >',
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFF245626)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        const Text(
                                          'Vaccination',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        TextButton(
                                          onPressed:
                                              _showexpdeliveryDatePickerModalSheet,
                                          child: const Text(
                                            'View More ',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF245626)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        vaccineDetailsList.isNotEmpty
                                            ? ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    vaccineDetailsList.length,
                                                shrinkWrap:
                                                    true, // This allows the ListView to take only necessary space
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return ListTile(
                                                    contentPadding:
                                                        const EdgeInsets.all(0),
                                                    title: Text(
                                                      vaccineDetailsList[index]
                                                          .vaccineName,
                                                      style: AppFonts.headline3(
                                                          color: AppColors
                                                              .grayscale90),
                                                    ),
                                                    trailing: const Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .file_copy_outlined,
                                                          color: AppColors
                                                              .primary40,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .chevron_right_rounded,
                                                          color: AppColors
                                                              .primary40,
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {},
                                                    subtitle: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          DateFormat(
                                                                  'yyyy-MM-dd')
                                                              .format(vaccineDetailsList[
                                                                      index]
                                                                  .firstDoseDate!),
                                                          style: AppFonts.body2(
                                                              color: AppColors
                                                                  .grayscale70),
                                                        ),
                                                        Text(
                                                          DateFormat(
                                                                  'yyyy-MM-dd')
                                                              .format(vaccineDetailsList[
                                                                      index]
                                                                  .secondDoseDate!),
                                                          style: AppFonts.body2(
                                                              color: AppColors
                                                                  .grayscale70),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              )
                                            : ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                padding: EdgeInsets.zero,
                                                itemCount: 2,
                                                shrinkWrap:
                                                    true, // This allows the ListView to take only necessary space
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return ListTile(
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            0,
                                                            10 *
                                                                heightMediaQuery,
                                                            0,
                                                            10 *
                                                                heightMediaQuery),
                                                    leading: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Vaccine 1",
                                                            style: AppFonts.headline3(
                                                                color: AppColors
                                                                    .grayscale90),
                                                          ),
                                                          Text(
                                                            '15.01.2022',
                                                            style: AppFonts.body2(
                                                                color: AppColors
                                                                    .grayscale70),
                                                          ),
                                                        ]),
                                                    trailing: const Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .file_copy_outlined,
                                                          color: AppColors
                                                              .primary40,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .chevron_right_rounded,
                                                          color: AppColors
                                                              .primary40,
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {},
                                                  );
                                                },
                                              ),
                                        TextButton(
                                          onPressed: () {
                                            // Show the VaccineEntryPage as a modal sheet
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return VaccineEntryPage(
                                                  onSave: (vaccineName,
                                                      firstDoseDate,
                                                      secondDoseDate) {
                                                    // Save vaccine details to the list
                                                    setState(() {
                                                      vaccineDetailsList.add(
                                                        VaccineDetails(
                                                          vaccineName:
                                                              vaccineName,
                                                          firstDoseDate:
                                                              firstDoseDate,
                                                          secondDoseDate:
                                                              secondDoseDate,
                                                        ),
                                                      );
                                                    });
                                                  },
                                                );
                                              },
                                            );
                                          },
                                          child:
                                              const Text('Add Vaccination +'),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Medical Checkup',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        TextButton(
                                          onPressed:
                                              _showexpdeliveryDatePickerModalSheet,
                                          child: const Text(
                                            'View More ',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF245626)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        medicalCheckupDetailsList.isNotEmpty
                                            ? ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    medicalCheckupDetailsList
                                                        .length,
                                                shrinkWrap:
                                                    true, // This allows the ListView to take only necessary space
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return ListTile(
                                                    contentPadding:
                                                        const EdgeInsets.all(0),
                                                    title: Text(
                                                      medicalCheckupDetailsList[
                                                              index]
                                                          .checkupName,
                                                      style: AppFonts.headline3(
                                                          color: AppColors
                                                              .grayscale90),
                                                    ),
                                                    trailing: const Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .file_copy_outlined,
                                                          color: AppColors
                                                              .primary40,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .chevron_right_rounded,
                                                          color: AppColors
                                                              .primary40,
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {},
                                                    subtitle: Text(
                                                      '${DateFormat('yyyy-MM-dd').format(medicalCheckupDetailsList[index].checkupDate!)} ',
                                                      style: AppFonts.body2(
                                                          color: AppColors
                                                              .grayscale70),
                                                    ),
                                                  );
                                                },
                                              )
                                            : ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                padding: EdgeInsets.zero,
                                                itemCount: 3,
                                                shrinkWrap:
                                                    true, // This allows the ListView to take only necessary space
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return ListTile(
                                                    contentPadding:
                                                        const EdgeInsets.all(0),
                                                    leading: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Check-Up 1",
                                                            style: AppFonts.headline3(
                                                                color: AppColors
                                                                    .grayscale90),
                                                          ),
                                                          Text(
                                                            '15.01.2022',
                                                            style: AppFonts.body2(
                                                                color: AppColors
                                                                    .grayscale70),
                                                          ),
                                                        ]),
                                                    trailing: const Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .file_copy_outlined,
                                                          color: AppColors
                                                              .primary40,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .chevron_right_rounded,
                                                          color: AppColors
                                                              .primary40,
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {},
                                                  );
                                                },
                                              ),
                                        TextButton(
                                          onPressed: () {
                                            // Show the VaccineEntryPage as a modal sheet
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return MedicalCheckupEntryPage(
                                                  onSave: (
                                                    checkupName,
                                                    checkupDate,
                                                  ) {
                                                    // Save vaccine details to the list
                                                    setState(() {
                                                      medicalCheckupDetailsList
                                                          .add(
                                                        MedicalCheckupDetails(
                                                          checkupName:
                                                              checkupName,
                                                          checkupDate:
                                                              checkupDate,
                                                        ),
                                                      );
                                                    });
                                                  },
                                                );
                                              },
                                            );
                                          },
                                          child: const Text(
                                              'Add Examination Results +'),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Surgery Records',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        TextButton(
                                          onPressed:
                                              _showexpdeliveryDatePickerModalSheet,
                                          child: const Text(
                                            'View More ',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF245626)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        surgeryDetailsList.isNotEmpty
                                            ? ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    surgeryDetailsList.length,
                                                shrinkWrap:
                                                    true, // This allows the ListView to take only necessary space
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return ListTile(
                                                    contentPadding:
                                                        const EdgeInsets.all(0),
                                                    title: Text(
                                                      surgeryDetailsList[index]
                                                          .surgeryName,
                                                      style: AppFonts.headline3(
                                                          color: AppColors
                                                              .grayscale90),
                                                    ),
                                                    trailing: const Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .file_copy_outlined,
                                                          color: AppColors
                                                              .primary40,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .chevron_right_rounded,
                                                          color: AppColors
                                                              .primary40,
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {},
                                                    subtitle: Text(
                                                      '${DateFormat('yyyy-MM-dd').format(surgeryDetailsList[index].surgeryDate!)} ',
                                                      style: AppFonts.body2(
                                                          color: AppColors
                                                              .grayscale70),
                                                    ),
                                                  );
                                                },
                                              )
                                            : ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                padding: EdgeInsets.zero,
                                                itemCount: 2,
                                                shrinkWrap:
                                                    true, // This allows the ListView to take only necessary space
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return ListTile(
                                                    contentPadding:
                                                        const EdgeInsets.all(0),
                                                    leading: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Surgeries 1",
                                                            style: AppFonts.headline3(
                                                                color: AppColors
                                                                    .grayscale90),
                                                          ),
                                                          Text(
                                                            '15.01.2022',
                                                            style: AppFonts.body2(
                                                                color: AppColors
                                                                    .grayscale70),
                                                          ),
                                                        ]),
                                                    trailing: const Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .file_copy_outlined,
                                                          color: AppColors
                                                              .primary40,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .chevron_right_rounded,
                                                          color: AppColors
                                                              .primary40,
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {},
                                                  );
                                                },
                                              ),
                                        TextButton(
                                          onPressed: () {
                                            // Show the VaccineEntryPage as a modal sheet
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return SurgeryEntryPage(
                                                  onSave: (
                                                    surgeryName,
                                                    surgeryDate,
                                                  ) {
                                                    // Save vaccine details to the list
                                                    setState(() {
                                                      surgeryDetailsList.add(
                                                        SurgeryDetails(
                                                          surgeryName:
                                                              surgeryName,
                                                          surgeryDate:
                                                              surgeryDate,
                                                        ),
                                                      );
                                                    });
                                                  },
                                                );
                                              },
                                            );
                                          },
                                          child: const Text(
                                            "Add Surgery Results +",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 50,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  widget.OviDetails.notes,
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
          ),
        ],
      ),
    ));
  }
}

class VaccineEntryPage extends StatefulWidget {
  final Function(String, DateTime?, DateTime?) onSave;

  const VaccineEntryPage({super.key, required this.onSave});

  @override
  // ignore: library_private_types_in_public_api
  _VaccineEntryPageState createState() => _VaccineEntryPageState();
}

class _VaccineEntryPageState extends State<VaccineEntryPage> {
  TextEditingController vaccineNameController = TextEditingController();
  DateTime? firstDoseDate;
  DateTime? secondDoseDate;

  @override
  void dispose() {
    vaccineNameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isFirstDose) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: isFirstDose
          ? firstDoseDate ?? DateTime.now()
          : secondDoseDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        if (isFirstDose) {
          firstDoseDate = selectedDate;
        } else {
          secondDoseDate = selectedDate;
        }
      });
    }
  }

  void _saveDataAndNavigateBack() {
    String newVaccineName = vaccineNameController.text;
    widget.onSave(newVaccineName, firstDoseDate, secondDoseDate);

    // Close the modal sheet and return to MyPage
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Add Vaccination",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Vaccine",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: vaccineNameController,
              decoration: InputDecoration(
                labelText: 'Vaccine Name',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      vaccineNameController.clear();
                    });
                  },
                ),
                hintText: 'Enter Vaccine Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
              ),
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 20),
            const Text('Add Date Of Vaccination:'),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today,
                      color: Color(0xFF245626)),
                  onPressed: () {
                    _selectDate(context, true);
                  },
                ),
              ),
              readOnly: true,
              controller: TextEditingController(
                text: firstDoseDate == null
                    ? 'Date Of Vaccination'
                    : '${firstDoseDate?.toLocal()}'.split(' ')[0],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Add Next Date Of Vaccination:'),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today,
                      color: Color(0xFF245626)),
                  onPressed: () {
                    _selectDate(context, false);
                  },
                ),
              ),
              readOnly: true,
              controller: TextEditingController(
                text: secondDoseDate == null
                    ? 'Next Date Of Vaccination'
                    : '${secondDoseDate?.toLocal()}'.split(' ')[0],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Handle file upload logic here
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: 150,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_open_outlined,
                      size: 35,
                    ),
                    Text(
                      'Upload File, PDF, Jpeg, PNG',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double
                  .infinity, // Make the button expand to full screen width
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  // Save data and navigate back to MyPage
                  _saveDataAndNavigateBack();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 36, 86, 38),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MedicalCheckupEntryPage extends StatefulWidget {
  final Function(String, DateTime?) onSave;

  const MedicalCheckupEntryPage({super.key, required this.onSave});

  @override
  // ignore: library_private_types_in_public_api
  _MedicalCheckupEntryPageState createState() =>
      _MedicalCheckupEntryPageState();
}

class _MedicalCheckupEntryPageState extends State<MedicalCheckupEntryPage> {
  TextEditingController checkupNameController = TextEditingController();
  DateTime? checkupDate;

  @override
  void dispose() {
    checkupNameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: checkupDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        checkupDate = selectedDate;
      });
    }
  }

  void _saveDataAndNavigateBack() {
    String newCheckupName = checkupNameController.text;
    widget.onSave(newCheckupName, checkupDate);

    // Close the modal sheet and return to MyPage
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Add Medical Checkup",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Checkup",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: checkupNameController,
              decoration: InputDecoration(
                labelText: 'Checkup Name',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      checkupNameController.clear();
                    });
                  },
                ),
                hintText: 'Enter Checkup Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
              ),
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 20),
            const Text('Add Checkup Date:'),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today,
                      color: Color(0xFF245626)),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
              ),
              readOnly: true,
              controller: TextEditingController(
                text: checkupDate == null
                    ? 'Checkup Date'
                    : DateFormat('yyyy-MM-dd').format(checkupDate!),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Handle file upload logic here
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: 150,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_open_outlined,
                      size: 35,
                    ),
                    Text(
                      'Upload File, PDF, Jpeg, PNG',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveDataAndNavigateBack,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 36, 86, 38),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SurgeryEntryPage extends StatefulWidget {
  final Function(String, DateTime?) onSave;

  const SurgeryEntryPage({super.key, required this.onSave});

  @override
  // ignore: library_private_types_in_public_api
  _SurgeryEntryPageState createState() => _SurgeryEntryPageState();
}

class _SurgeryEntryPageState extends State<SurgeryEntryPage> {
  TextEditingController surgeryNameController = TextEditingController();
  DateTime? surgeryDate;

  @override
  void dispose() {
    surgeryNameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: surgeryDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        surgeryDate = selectedDate;
      });
    }
  }

  void _saveDataAndNavigateBack() {
    String newSurgeryName = surgeryNameController.text;
    widget.onSave(newSurgeryName, surgeryDate);

    // Close the modal sheet and return to MyPage
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Add Surgery",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Surgery",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: surgeryNameController,
              decoration: InputDecoration(
                labelText: 'Surgery Name',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      surgeryNameController.clear();
                    });
                  },
                ),
                hintText: 'Enter Surgery Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
              ),
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 20),
            const Text('Add Surgery Date:'),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today,
                      color: Color(0xFF245626)),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
              ),
              readOnly: true,
              controller: TextEditingController(
                text: surgeryDate == null
                    ? 'Surgery Date'
                    : DateFormat('yyyy-MM-dd').format(surgeryDate!),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Handle file upload logic here
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: 150,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_open_outlined,
                      size: 35,
                    ),
                    Text(
                      'Upload File, PDF, Jpeg, PNG',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveDataAndNavigateBack,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 36, 86, 38),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VaccineDetails {
  final String vaccineName;
  final DateTime? firstDoseDate;
  final DateTime? secondDoseDate;

  VaccineDetails({
    required this.vaccineName,
    this.firstDoseDate,
    this.secondDoseDate,
  });
}

class MedicalCheckupDetails {
  final String checkupName;
  final DateTime? checkupDate;

  MedicalCheckupDetails({
    required this.checkupName,
    this.checkupDate,
  });
}

class SurgeryDetails {
  final String surgeryName;
  final DateTime? surgeryDate;

  SurgeryDetails({
    required this.surgeryName,
    this.surgeryDate,
  });
}
