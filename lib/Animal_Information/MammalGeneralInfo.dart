// import 'dart:io';
// // ignore: depend_on_referenced_packages
// import 'package:dotted_border/dotted_border.dart';
// import 'package:hathera_demo/Animal_Information/BreedingSection/FamilyTree.dart';
// import 'package:hathera_demo/Animal_Information/BreedingSection/ListOfBreedingEvents.dart';
// import 'package:hathera_demo/Animal_Information/BreedingSection/ListOfChildren.dart';
// import 'package:hathera_demo/Animal_Information/BreedingSection/ListOfParents.dart';
// import 'package:hathera_demo/Animal_Information/BreedingSection/ListOfPartners.dart';
// import 'package:hathera_demo/Widgets/Button.dart';
// // ignore: depend_on_referenced_packages
// import 'package:intl/intl.dart';
// import 'package:flutter/material.dart';
// import 'package:hathera_demo/Widgets/TagChips.dart';

// // ignore: must_be_immutable
// class MammalGenInfo extends StatefulWidget {
//   final String mammalfieldName;
//   final String mammalfieldContent;
//   final TextEditingController mammalnotesController;
//   final String selectedMammalSire;
//   final String selectedMammalDate;
//   final String selectedMammalDam;
//   TextEditingController mammalnameController;
//   TextEditingController frequencyEggsController;
//   TextEditingController numberofEggsController;
//   // final DateTime? selectedOviDate;
//   final List<String> selectedMammalChips;
//   final Map<String, DateTime?> selectedMammalDates;
//   final bool showMammalAdditionalFields;
//   final String selectedMammalDateType;
//   final String selectedMammalGender;
//   final bool addMammalParents;
//   final bool addMammalChildren;
//   final File? selectedMammalImage;
//   final String selectedAnimalType;
//   final String selectedAnimalSpecies;
//   final String selectedAnimalBreed;

//   MammalGenInfo({
//     super.key,
//     required this.mammalfieldName,
//     required this.mammalfieldContent,
//     required this.mammalnotesController,
//     required this.selectedMammalSire,
//     required this.selectedMammalDam,
//     // required this.selectedOviDate,
//     required this.selectedMammalChips,
//     required this.selectedMammalDates,
//     required this.showMammalAdditionalFields,
//     required this.selectedMammalDateType,
//     required this.selectedMammalGender,
//     required this.addMammalParents,
//     required this.addMammalChildren,
//     required this.selectedMammalImage,
//     required this.mammalnameController,
//     required this.selectedMammalDate,
//     required this.frequencyEggsController,
//     required this.numberofEggsController,
//     required this.selectedAnimalType,
//     required this.selectedAnimalSpecies,
//     required this.selectedAnimalBreed,
//   });

//   @override
//   // ignore: library_private_types_in_public_api
//   _MammalGenInfo createState() => _MammalGenInfo();
// }

// class _MammalGenInfo extends State<MammalGenInfo>
//     with SingleTickerProviderStateMixin {
//   TextEditingController _MammalmedicalNeedsController = TextEditingController();
//   bool _isMammalEditMode = false;
//   String newMammalpregnantStatus = '';
//   String mammalpregnantStatuses = '';
//   String newmammalmatingdate = 'ADD';
//   String newmammalsonardate = 'ADD';
//   String newmammalexpdeliverydate = 'ADD';
//   DateTime? selectedmammalmatingDate;
//   DateTime? selectedmammalsonarDate;
//   DateTime? selectedmammalexpdeliveryDate;
//   List<String> mammalvaccineNames = ["Vaccine 1", "Vaccine 2", "Vaccine 3"];
//   List<String> mammalcheckUpNames = ["Check Up 1", "Check Up 2", "Check Up 3"];
//   List<String> mammalsurgeryNames = ["Surgery 1", "Surgery 2", "Surgery 3"];
//   List<VaccineDetails> mammalvaccineDetailsList = [];
//   List<MedicalCheckupDetails> mammalmedicalCheckupDetailsList = [];
//   List<SurgeryDetails> mammalsurgeryDetailsList = [];

//   Widget _buildDisplayMode() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             _MammalmedicalNeedsController.text,
//             style: const TextStyle(
//               fontSize: 14,
//               color: Colors.black,
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           const Text(
//             'Picked File To Be Here',
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showmatingDatePickerModalSheet() async {
//     final DateTime? matingDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (matingDate != null && matingDate != selectedmammalmatingDate) {
//       setState(() {
//         selectedmammalmatingDate = matingDate;
//         newmammalmatingdate = DateFormat.yMMMd().format(matingDate);
//       });
//     }
//   }

//   void _showsonarDatePickerModalSheet() async {
//     final DateTime? sonarDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (sonarDate != null && sonarDate != selectedmammalsonarDate) {
//       setState(() {
//         selectedmammalsonarDate = sonarDate;
//         newmammalsonardate = DateFormat.yMMMd().format(sonarDate);
//       });
//     }
//   }

//   void _showexpdeliveryDatePickerModalSheet() async {
//     final DateTime? expdeliveryDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (expdeliveryDate != null &&
//         expdeliveryDate != selectedmammalexpdeliveryDate) {
//       setState(() {
//         selectedmammalexpdeliveryDate = expdeliveryDate;
//         newmammalexpdeliverydate = DateFormat.yMMMd().format(expdeliveryDate);
//       });
//     }
//   }

//   void _showPregnantStatusSelection() {
//     double sheetHeight = MediaQuery.of(context).size.height * 0.35;
//     showModalBottomSheet(
//       context: context,
//       showDragHandle: true,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return SizedBox(
//               height: sheetHeight,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.all(16.0),
//                     child: Text(
//                       'Pregnancy Status',
//                       style:
//                           TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Flexible(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           ListTile(
//                             title: const Text('Not Pregnant'),
//                             trailing: mammalpregnantStatuses == 'Not Pregnant'
//                                 ? Container(
//                                     width: 25,
//                                     height: 25,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color: Colors.green,
//                                         width: 6.0,
//                                       ),
//                                     ),
//                                   )
//                                 : Container(
//                                     width: 25,
//                                     height: 25,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color: Colors.grey,
//                                         width: 2.0,
//                                       ),
//                                     ),
//                                   ),
//                             onTap: () {
//                               setState(() {
//                                 mammalpregnantStatuses = 'Not Pregnant';
//                               });
//                             },
//                           ),
//                           ListTile(
//                             title: const Text('Pregnant'),
//                             trailing: mammalpregnantStatuses == 'Pregnant'
//                                 ? Container(
//                                     width: 25,
//                                     height: 25,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color: Colors.green,
//                                         width: 6.0,
//                                       ),
//                                     ),
//                                   )
//                                 : Container(
//                                     width: 25,
//                                     height: 25,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color: Colors.grey,
//                                         width: 2.0,
//                                       ),
//                                     ),
//                                   ),
//                             onTap: () {
//                               setState(() {
//                                 mammalpregnantStatuses = 'Pregnant';
//                               });
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: ButtonWidget(
//                       onPressed: () {
//                         setState(() {
//                           newMammalpregnantStatus = mammalpregnantStatuses;
//                         });
//                         Navigator.pop(context);
//                       },
//                       buttonText: 'Confirm',
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     ).then((_) {
//       setState(() {
//         newMammalpregnantStatus = mammalpregnantStatuses;
//       });
//     });
//   }

//   Widget _buildEditMode() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               TextFormField(
//                 maxLines: 6, // Set the maximum number of lines
//                 controller: _MammalmedicalNeedsController,
//                 decoration: InputDecoration(
//                   hintText:
//                       'Add Additional Information If Needed', // Add your hint text here
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(
//                       vertical: 12.0, horizontal: 16.0),
//                 ),
//                 textInputAction:
//                     TextInputAction.done, // Change the keyboard action
//               ),
//               Positioned(
//                 top: 0,
//                 right: 0,
//                 child: IconButton(
//                   icon: const Icon(Icons.clear),
//                   onPressed: () {
//                     // Clear the text field
//                     _MammalmedicalNeedsController.clear();
//                   },
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           GestureDetector(
//             onTap: () {
//               // Add your logic to open the file manager and select files here
//             },
//             child: DottedBorder(
//               borderType: BorderType.RRect,
//               radius: const Radius.circular(20),
//               dashPattern: const [7, 7],
//               strokeWidth: 1,
//               color: Colors.grey,
//               child: SizedBox(
//                 width: double.infinity, // Set the width of the container
//                 height: 150, // Set the height of the container
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(
//                       icon: const Icon(
//                         Icons.file_open_outlined,
//                         size: 35,
//                       ),
//                       onPressed: () {
//                         // Handle back button press
//                         // Add your code here
//                       },
//                     ),
//                     const Text(
//                       'Upload File, PDF, Jpeg, PNG',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     _MammalmedicalNeedsController.text = "";
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     _MammalmedicalNeedsController.dispose();
//     super.dispose();
//   }

//   String calculateAge(DateTime? selectedDate) {
//     if (selectedDate == null) {
//       return 'Not Selected'; // Handle the case when the date is not selected
//     }

//     final currentDate = DateTime.now();
//     final ageInYears = currentDate.year - selectedDate.year;
//     return '$ageInYears Years';
//   }

//   DateTime? parseSelectedDate(String? selectedDate) {
//     if (selectedDate == null) {
//       return null; // Return null if the date is not selected
//     }

//     try {
//       return DateFormat('dd.MM.yyyy').parse(selectedDate);
//     } catch (e) {
//       return null; // Return null if there is an error parsing the date
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final selectedDate = parseSelectedDate(widget.selectedMammalDate);

//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/AccountProfile/image 20.png'),
//           fit: BoxFit.fill,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           leading: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white,
//               ),
//               child: IconButton(
//                 icon: const Icon(
//                   Icons.arrow_back,
//                   color: Colors.black,
//                 ),
//                 onPressed: () {
//                   Navigator.pop(context);
//                   // Handle back button press
//                   // Add your code here
//                 },
//               ),
//             ),
//           ),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white,
//                 ),
//                 child: IconButton(
//                   icon: const Icon(
//                     Icons.edit,
//                     color: Colors.black,
//                   ),
//                   onPressed: () {
//                     // Handle edit button press
//                     // Add your code here
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             margin: const EdgeInsets.only(top: 100),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(30),
//                 topRight: Radius.circular(30),
//               ),
//             ),
//             child: Column(
//               children: [
//                 const SizedBox(height: 20),
//                 Align(
//                   alignment: Alignment.topCenter,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       FractionalTranslation(
//                         translation: const Offset(0.0, -0.6),
//                         child: CircleAvatar(
//                           radius: 70,
//                           backgroundColor: Colors.grey[100],
//                           backgroundImage: widget.selectedMammalImage != null
//                               ? FileImage(widget.selectedMammalImage!)
//                               : null,
//                           child: widget.selectedMammalImage == null
//                               ? const Icon(
//                                   Icons.camera_alt_outlined,
//                                   size: 50,
//                                   color: Colors.grey,
//                                 )
//                               : null,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: const Offset(
//                       0.0, -60.0), // Adjust the Y offset to move the text up
//                   child: Column(
//                     children: [
//                       Text(
//                         widget.mammalnameController.text,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 25,
//                           color: Colors.black,
//                         ),
//                       ),
//                       const Text(
//                         'ID# 12345',
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 16,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Wrap(
//                         spacing: 8.0,
//                         runSpacing: 8.0,
//                         children: widget.selectedMammalChips.map((chip) {
//                           return CustomTag(
//                             label: chip,
//                             selected: true, // Since these are selected chips
//                             onTap: () {},
//                           );
//                         }).toList(),
//                       ),
//                       const SizedBox(height: 10),
//                       IntrinsicWidth(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 255, 242, 122),
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16, vertical: 8),
//                           child: const Row(
//                             children: [
//                               Icon(Icons.home, color: Colors.black),
//                               SizedBox(width: 8),
//                               Text(
//                                 'My Farm',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         width: double.infinity,
//                         margin: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 10),
//                         height: 50,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[300],
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                         child: TabBar(
//                           controller: _tabController,
//                           indicator: BoxDecoration(
//                             color: const Color.fromARGB(255, 36, 86, 38),
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                           indicatorSize: TabBarIndicatorSize.tab,
//                           indicatorColor: Colors.transparent,
//                           labelColor: Colors.white,
//                           unselectedLabelColor: Colors.grey,
//                           tabs: const [
//                             Tab(
//                               text: 'General',
//                             ),
//                             Tab(
//                               text: 'Breeding',
//                             ),
//                             Tab(
//                               text: 'Medical',
//                             ),
//                           ],
//                         ),
//                       ),

//                       // Tab Bar View
//                       // Tab Bar View
//                       // Tab Bar View
//                       SizedBox(
//                         height:
//                             MediaQuery.of(context).size.height - 190 - 20 - 50,
//                         child: TabBarView(
//                           controller: _tabController,
//                           children: [
//                             // General Tabbar Starts
//                             SingleChildScrollView(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const SizedBox(
//                                       height:
//                                           15), // Add spacing between the boxes
//                                   Container(
//                                     width: double.infinity,
//                                     padding: const EdgeInsets.all(8),
//                                     margin: const EdgeInsets.symmetric(
//                                         horizontal: 16, vertical: 10),
//                                     decoration: BoxDecoration(
//                                       color: const Color.fromARGB(
//                                           255, 251, 247, 206),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       children: [
//                                         Column(
//                                           children: [
//                                             Text(
//                                               widget.selectedAnimalType,
//                                               style: const TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                               ),
//                                             ),
//                                             const SizedBox(height: 8),
//                                             const Text(
//                                               'Type',
//                                               style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 14,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Column(
//                                           children: [
//                                             Text(
//                                               widget.selectedAnimalSpecies,
//                                               style: const TextStyle(
//                                                 fontSize: 14,
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                             const SizedBox(height: 8),
//                                             const Text(
//                                               'Species',
//                                               style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 14,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Column(
//                                           children: [
//                                             Text(
//                                               widget.selectedMammalGender,
//                                               style: const TextStyle(
//                                                 fontSize: 14,
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                             const SizedBox(height: 8),
//                                             const Text(
//                                               'Sex',
//                                               style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 14,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   const Padding(
//                                     padding: EdgeInsets.all(8.0),
//                                     child: Text(
//                                       'General Information',
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 13),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 16),
//                                     child: Row(
//                                       children: [
//                                         const Expanded(
//                                           flex: 2,
//                                           child: Text(
//                                             'Age',
//                                             style: TextStyle(
//                                               fontSize: 14,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 0,
//                                           child: Text(
//                                             calculateAge(selectedDate),
//                                             style: TextStyle(
//                                               fontSize: 14,
//                                               color: selectedDate != null
//                                                   ? Colors.black
//                                                   : Colors.red,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 12),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 16),
//                                     child: Row(
//                                       children: [
//                                         const Expanded(
//                                           flex: 2,
//                                           child: Text(
//                                             'Breed',
//                                             style: TextStyle(
//                                                 fontSize: 14,
//                                                 color: Colors.black),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 0,
//                                           child: Text(
//                                             widget.selectedAnimalBreed,
//                                             style: const TextStyle(
//                                                 fontSize: 14,
//                                                 color: Colors.black),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 12),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 16),
//                                     child: Row(
//                                       children: [
//                                         const Expanded(
//                                           flex: 2,
//                                           child: Text(
//                                             'Date Of Hatching',
//                                             style: TextStyle(
//                                               fontSize: 14,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 0,
//                                           child: widget.selectedMammalDates
//                                                       .containsKey(
//                                                           'Date Of Hatching') &&
//                                                   widget.selectedMammalDates[
//                                                           'Date Of Hatching'] !=
//                                                       null
//                                               ? Text(
//                                                   DateFormat('dd.MM.yyyy')
//                                                       .format(
//                                                     widget.selectedMammalDates[
//                                                         'Date Of Hatching']!,
//                                                   ),
//                                                   style: const TextStyle(
//                                                     fontSize: 14,
//                                                     color: Colors.black,
//                                                   ),
//                                                 )
//                                               : const Text(
//                                                   'ADD',
//                                                   style: TextStyle(
//                                                     fontSize: 14,
//                                                     color: Colors
//                                                         .blue, // You can customize the button's color
//                                                   ),
//                                                 ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 12),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 16),
//                                     child: Row(
//                                       children: [
//                                         const Expanded(
//                                           flex: 2,
//                                           child: Text(
//                                             'Date Of Death',
//                                             style: TextStyle(
//                                               fontSize: 14,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 0,
//                                           child: widget.selectedMammalDates
//                                                       .containsKey(
//                                                           'Date Of Death') &&
//                                                   widget.selectedMammalDates[
//                                                           'Date Of Death'] !=
//                                                       null
//                                               ? Text(
//                                                   DateFormat('dd.MM.yyyy')
//                                                       .format(
//                                                     widget.selectedMammalDates[
//                                                         'Date Of Death']!,
//                                                   ),
//                                                   style: const TextStyle(
//                                                     fontSize: 14,
//                                                     color: Colors.black,
//                                                   ),
//                                                 )
//                                               : const Text(
//                                                   'ADD',
//                                                   style: TextStyle(
//                                                     fontSize: 14,
//                                                     color: Colors
//                                                         .blue, // You can customize the button's color
//                                                   ),
//                                                 ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 12),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 16),
//                                     child: Row(
//                                       children: [
//                                         const Expanded(
//                                           flex: 2,
//                                           child: Text(
//                                             'Date Of Sale',
//                                             style: TextStyle(
//                                               fontSize: 14,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 0,
//                                           child: widget.selectedMammalDates
//                                                       .containsKey(
//                                                           'Date Of Sale') &&
//                                                   widget.selectedMammalDates[
//                                                           'Date Of Sale'] !=
//                                                       null
//                                               ? Text(
//                                                   DateFormat('dd.MM.yyyy')
//                                                       .format(
//                                                     widget.selectedMammalDates[
//                                                         'Date Of Sale']!,
//                                                   ),
//                                                   style: const TextStyle(
//                                                     fontSize: 14,
//                                                     color: Colors.black,
//                                                   ),
//                                                 )
//                                               : const Text(
//                                                   'ADD',
//                                                   style: TextStyle(
//                                                     fontSize: 14,
//                                                     color: Colors
//                                                         .blue, // You can customize the button's color
//                                                   ),
//                                                 ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 12),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 16),
//                                     child: Row(
//                                       children: [
//                                         Expanded(
//                                           flex: 2,
//                                           child: Text(
//                                             widget.mammalfieldName,
//                                             style: const TextStyle(
//                                                 fontSize: 14,
//                                                 color: Colors.black),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 0,
//                                           child: Text(
//                                             widget.mammalfieldContent,
//                                             style: const TextStyle(
//                                               fontSize: 16,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 25),
//                                   const Padding(
//                                     padding: EdgeInsets.all(8.0),
//                                     child: Text(
//                                       'Additonal Notes',
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),

//                                   const SizedBox(height: 12),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 16),
//                                     child: Text(
//                                       widget.mammalnotesController.text,
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 20),
//                                   const Padding(
//                                     padding: EdgeInsets.all(8.0),
//                                     child: Text(
//                                       'Uploaded Files To Be Here',
//                                       style: TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
// // General Tabbar Ends
//                             //Breeding Tabbbar View Starts
//                             SingleChildScrollView(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const SizedBox(height: 15),
//                                   // Add spacing between the boxes
//                                   Visibility(
//                                     visible:
//                                         widget.selectedMammalGender == 'Female',
//                                     child: Container(
//                                       width: double.infinity,
//                                       padding: const EdgeInsets.all(8),
//                                       margin: const EdgeInsets.symmetric(
//                                           horizontal: 16, vertical: 10),
//                                       decoration: BoxDecoration(
//                                         color: const Color.fromARGB(
//                                             255, 251, 247, 206),
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       child: const Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: [
//                                           Column(
//                                             children: [
//                                               Text(
//                                                 'Pregnant',
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 14,
//                                                 ),
//                                               ),
//                                               SizedBox(height: 8),
//                                               Text(
//                                                 'Current Status',
//                                                 style: TextStyle(
//                                                   color: Colors.grey,
//                                                   fontSize: 14,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     width: double.infinity,
//                                     padding: const EdgeInsets.all(8),
//                                     margin: const EdgeInsets.symmetric(
//                                         horizontal: 16, vertical: 10),
//                                     decoration: BoxDecoration(
//                                       color: const Color.fromARGB(
//                                           255, 251, 247, 206),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       children: [
//                                         Column(
//                                           children: [
//                                             Text(
//                                               widget.selectedMammalDates.entries
//                                                           .toList()[0]
//                                                           .value !=
//                                                       null
//                                                   ? DateFormat('dd.MM.yyyy')
//                                                       .format(widget
//                                                           .selectedMammalDates
//                                                           .entries
//                                                           .toList()[0]
//                                                           .value!)
//                                                   : '',
//                                               style: const TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                               ),
//                                             ),
//                                             const SizedBox(height: 8),
//                                             Text(
//                                               widget.selectedMammalGender ==
//                                                       'Male'
//                                                   ? 'Date Of Mating'
//                                                   : 'Last Hatching Date',
//                                               style: const TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 14,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Column(
//                                           children: [
//                                             Text(
//                                               widget.selectedMammalDates.entries
//                                                           .toList()[0]
//                                                           .value !=
//                                                       null
//                                                   ? DateFormat('dd.MM.yyyy')
//                                                       .format(widget
//                                                           .selectedMammalDates
//                                                           .entries
//                                                           .toList()[0]
//                                                           .value!)
//                                                   : '',
//                                               style: const TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                               ),
//                                             ),
//                                             const SizedBox(height: 8),
//                                             Text(
//                                               widget.selectedMammalGender ==
//                                                       'Male'
//                                                   ? 'Next Date Of Mating'
//                                                   : 'Frequency Of Laying Eggs',
//                                               style: const TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 14,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),

//                                   const SizedBox(height: 13),
//                                   ListTile(
//                                     leading: const CircleAvatar(
//                                       backgroundColor:
//                                           Color.fromARGB(164, 76, 175, 79),
//                                       child: Icon(Icons.history,
//                                           color: Colors.white),
//                                     ),
//                                     title: const Text('Breeding History'),
//                                     trailing: IconButton(
//                                       icon: const Icon(Icons.arrow_right),
//                                       onPressed: () {
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) =>
//                                                   ListOfBreedingEvents(
//                                                 // Pass any required parameters here
//                                                 breedingNotesController:
//                                                     TextEditingController(),
//                                                 breedingEventNumberController:
//                                                     TextEditingController(),
//                                                 selectedBreedSire: '',
//                                                 selectedBreedDam: '',
//                                                 selectedBreedPartner: '',
//                                                 selectedBreedChildren: '',
//                                                 selectedBreedingDate: '',
//                                                 selectedDeliveryDate: '',
//                                               ),
//                                             ));
//                                         // Add your onPressed logic here
//                                       },
//                                     ),
//                                   ),
//                                   ListTile(
//                                     leading: const CircleAvatar(
//                                       backgroundColor:
//                                           Color.fromARGB(164, 76, 175, 79),
//                                       child: Icon(Icons.bedroom_parent,
//                                           color: Colors.white),
//                                     ),
//                                     title: const Text('Parents'),
//                                     trailing: IconButton(
//                                       icon: const Icon(Icons.arrow_right),
//                                       onPressed: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) => ListOfParents(
//                                               selectedMammalSire:
//                                                   widget.selectedMammalSire,
//                                               selectedMammalDam:
//                                                   widget.selectedMammalDam,
//                                               selectedOviSire: '',
//                                               selectedOviDam: '',

//                                               // Convert DateTime to String
//                                             ),
//                                           ),
//                                         );

//                                         // Add your onPressed logic here
//                                       },
//                                     ),
//                                   ),
//                                   ListTile(
//                                     leading: const CircleAvatar(
//                                       backgroundColor:
//                                           Color.fromARGB(164, 76, 175, 79),
//                                       child: Icon(Icons.route,
//                                           color: Colors.white),
//                                     ),
//                                     title: const Text('Family Tree'),
//                                     trailing: IconButton(
//                                       icon: const Icon(Icons.arrow_right),
//                                       onPressed: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) => FamilyTree(

//                                                 // Convert DateTime to String
//                                                 ),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                   ListTile(
//                                     leading: const CircleAvatar(
//                                       backgroundColor:
//                                           Color.fromARGB(164, 76, 175, 79),
//                                       child: Icon(Icons.man_outlined,
//                                           color: Colors.white),
//                                     ),
//                                     title: const Text('Male Mates'),
//                                     trailing: IconButton(
//                                       icon: const Icon(Icons.arrow_right),
//                                       onPressed: () {
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     ListOfPartners()));
//                                         // Add your onPressed logic here
//                                       },
//                                     ),
//                                   ),
//                                   ListTile(
//                                     leading: const CircleAvatar(
//                                       backgroundColor:
//                                           Color.fromARGB(164, 76, 175, 79),
//                                       child: Icon(Icons.child_friendly,
//                                           color: Colors.white),
//                                     ),
//                                     title: const Text('Children'),
//                                     trailing: IconButton(
//                                       icon: const Icon(Icons.arrow_right),
//                                       onPressed: () {
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     ListOfChildren()));
//                                         // Add your onPressed logic here
//                                       },
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             //Breeding Tabbbar View Ends

//                             // Medical Tabbar View Starts
//                             SingleChildScrollView(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const SizedBox(height: 15),
//                                   Container(
//                                     width: double.infinity,
//                                     padding: const EdgeInsets.all(8),
//                                     margin: const EdgeInsets.symmetric(
//                                         horizontal: 16, vertical: 10),
//                                     decoration: BoxDecoration(
//                                       color: const Color.fromARGB(
//                                           255, 251, 247, 206),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: const Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       children: [
//                                         Column(
//                                           children: [
//                                             Text(
//                                               '01.01.2023',
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                               ),
//                                             ),
//                                             SizedBox(height: 8),
//                                             Text(
//                                               'Next Vaccination',
//                                               style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 14,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     width: double.infinity,
//                                     padding: const EdgeInsets.all(8),
//                                     margin: const EdgeInsets.symmetric(
//                                         horizontal: 16, vertical: 10),
//                                     decoration: BoxDecoration(
//                                       color: const Color.fromARGB(
//                                           255, 251, 247, 206),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: const Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       children: [
//                                         Column(
//                                           children: [
//                                             Text(
//                                               '12.02.2023',
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                               ),
//                                             ),
//                                             SizedBox(height: 8),
//                                             Text(
//                                               'Last Check Up',
//                                               style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 14,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Column(
//                                           children: [
//                                             Text(
//                                               '02.08.2023',
//                                               style: TextStyle(
//                                                 fontSize: 14,
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                             SizedBox(height: 8),
//                                             Text(
//                                               'Next Check Up',
//                                               style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 14,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 20),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 16),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         const Text(
//                                           'Medical Needs',
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 25,
//                                           ),
//                                         ),
//                                         _isMammalEditMode
//                                             ? ElevatedButton(
//                                                 style: ElevatedButton.styleFrom(
//                                                   elevation: 0,
//                                                   backgroundColor:
//                                                       Colors.transparent,
//                                                 ),
//                                                 onPressed: () {
//                                                   // Handle save button press
//                                                   // Add your code here to save the edited text
//                                                   setState(() {
//                                                     _isMammalEditMode = false;
//                                                   });
//                                                 },
//                                                 child: const Text(
//                                                   'Save',
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 ),
//                                               )
//                                             : IconButton(
//                                                 icon: const Icon(
//                                                   Icons.edit_square,
//                                                   color: Color.fromARGB(
//                                                       255, 36, 86, 38),
//                                                 ),
//                                                 onPressed: () {
//                                                   // Enter edit mode
//                                                   setState(() {
//                                                     _isMammalEditMode = true;
//                                                   });
//                                                 },
//                                               ),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   _isMammalEditMode
//                                       ? _buildEditMode()
//                                       : _buildDisplayMode(),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Visibility(
//                                     visible:
//                                         widget.selectedMammalGender == 'Female',
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 16),
//                                           child: Text(
//                                             'Pregnancy Check',
//                                             style: TextStyle(
//                                                 fontSize: 18,
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                         const SizedBox(height: 13),
//                                         const Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 16),
//                                           child: Row(
//                                             children: [
//                                               Expanded(
//                                                 flex: 2,
//                                                 child: Text(
//                                                   'Count On Pregnancies',
//                                                   style: TextStyle(
//                                                     fontSize: 14,
//                                                     color: Colors.black,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 flex: 0,
//                                                 child: Text(
//                                                   '1',
//                                                   style: TextStyle(
//                                                     fontSize: 14,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         const SizedBox(height: 12),
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 16),
//                                           child: Row(
//                                             children: [
//                                               const Expanded(
//                                                 flex: 2,
//                                                 child: Text(
//                                                   'Pregnancy Status',
//                                                   style: TextStyle(
//                                                       fontSize: 14,
//                                                       color: Colors.black),
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                   flex: 0,
//                                                   child: TextButton(
//                                                     onPressed:
//                                                         _showPregnantStatusSelection,
//                                                     child: Text(
//                                                       '$newMammalpregnantStatus >',
//                                                       style: const TextStyle(
//                                                           fontSize: 14,
//                                                           color: Color.fromARGB(
//                                                               255, 36, 86, 38)),
//                                                     ),
//                                                   )),
//                                             ],
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 16),
//                                           child: Row(
//                                             children: [
//                                               const Expanded(
//                                                 flex: 2,
//                                                 child: Text(
//                                                   'Date Of Mating',
//                                                   style: TextStyle(
//                                                     fontSize: 14,
//                                                     color: Colors.black,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 flex: 0,
//                                                 child: TextButton(
//                                                   onPressed:
//                                                       _showmatingDatePickerModalSheet,
//                                                   child: Text(
//                                                     '$newmammalmatingdate >',
//                                                     style: const TextStyle(
//                                                         fontSize: 14,
//                                                         color:
//                                                             Color(0xFF245626)),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 16),
//                                           child: Row(
//                                             children: [
//                                               const Expanded(
//                                                 flex: 2,
//                                                 child: Text(
//                                                   'Date Of Sonar',
//                                                   style: TextStyle(
//                                                     fontSize: 14,
//                                                     color: Colors.black,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 flex: 0,
//                                                 child: TextButton(
//                                                   onPressed:
//                                                       _showsonarDatePickerModalSheet,
//                                                   child: Text(
//                                                     '$newmammalsonardate >',
//                                                     style: const TextStyle(
//                                                         fontSize: 14,
//                                                         color:
//                                                             Color(0xFF245626)),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 16),
//                                           child: Row(
//                                             children: [
//                                               const Expanded(
//                                                 flex: 2,
//                                                 child: Text(
//                                                   'Exp. Delivery Date',
//                                                   style: TextStyle(
//                                                     fontSize: 14,
//                                                     color: Colors.black,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 flex: 0,
//                                                 child: TextButton(
//                                                   onPressed:
//                                                       _showexpdeliveryDatePickerModalSheet,
//                                                   child: Text(
//                                                     '$newmammalexpdeliverydate >',
//                                                     style: const TextStyle(
//                                                         fontSize: 14,
//                                                         color:
//                                                             Color(0xFF245626)),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 12),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 16),
//                                     child: Row(
//                                       children: [
//                                         const Expanded(
//                                           flex: 2,
//                                           child: Text(
//                                             'Vaccination',
//                                             style: TextStyle(
//                                                 fontSize: 18,
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 0,
//                                           child: TextButton(
//                                             onPressed:
//                                                 _showexpdeliveryDatePickerModalSheet,
//                                             child: const Text(
//                                               'View More ',
//                                               style: TextStyle(
//                                                   fontSize: 14,
//                                                   color: Color(0xFF245626)),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       const SizedBox(height: 10),
//                                       SingleChildScrollView(
//                                         child: ListView.builder(
//                                           itemCount:
//                                               mammalvaccineDetailsList.length,
//                                           shrinkWrap:
//                                               true, // This allows the ListView to take only necessary space
//                                           itemBuilder: (BuildContext context,
//                                               int index) {
//                                             return ListTile(
//                                               title: Text(
//                                                   mammalvaccineDetailsList[
//                                                           index]
//                                                       .mammalvaccineName),
//                                               trailing: const Icon(Icons
//                                                   .edit), // Add an edit icon as trailing
//                                               onTap: () {
//                                                 // Handle the edit action here
//                                               },
//                                               subtitle: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     DateFormat('yyyy-MM-dd').format(
//                                                         mammalvaccineDetailsList[
//                                                                 index]
//                                                             .firstDoseDate!),
//                                                   ),
//                                                   Text(
//                                                     DateFormat('yyyy-MM-dd').format(
//                                                         mammalvaccineDetailsList[
//                                                                 index]
//                                                             .secondDoseDate!),
//                                                   ),
//                                                 ],
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                       TextButton(
//                                         onPressed: () {
//                                           // Show the VaccineEntryPage as a modal sheet
//                                           showModalBottomSheet(
//                                             context: context,
//                                             builder: (BuildContext context) {
//                                               return VaccineEntryPage(
//                                                 onSave: (vaccineName,
//                                                     firstDoseDate,
//                                                     secondDoseDate) {
//                                                   // Save vaccine details to the list
//                                                   setState(() {
//                                                     mammalvaccineDetailsList
//                                                         .add(
//                                                       VaccineDetails(
//                                                         mammalvaccineName:
//                                                             vaccineName,
//                                                         firstDoseDate:
//                                                             firstDoseDate,
//                                                         secondDoseDate:
//                                                             secondDoseDate,
//                                                       ),
//                                                     );
//                                                   });
//                                                 },
//                                               );
//                                             },
//                                           );
//                                         },
//                                         child: const Text('Add Vaccination +'),
//                                       ),
//                                     ],
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 16),
//                                     child: Row(
//                                       children: [
//                                         const Expanded(
//                                           flex: 2,
//                                           child: Text(
//                                             'Medical Checkup',
//                                             style: TextStyle(
//                                                 fontSize: 18,
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 0,
//                                           child: TextButton(
//                                             onPressed:
//                                                 _showexpdeliveryDatePickerModalSheet,
//                                             child: const Text(
//                                               'View More ',
//                                               style: TextStyle(
//                                                   fontSize: 14,
//                                                   color: Color(0xFF245626)),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       const SizedBox(height: 10),
//                                       SingleChildScrollView(
//                                         child: ListView.builder(
//                                           itemCount:
//                                               mammalmedicalCheckupDetailsList
//                                                   .length,
//                                           shrinkWrap:
//                                               true, // This allows the ListView to take only necessary space
//                                           itemBuilder: (BuildContext context,
//                                               int index) {
//                                             return ListTile(
//                                               title: Text(
//                                                   mammalmedicalCheckupDetailsList[
//                                                           index]
//                                                       .mammalcheckupName),
//                                               trailing: const Icon(Icons
//                                                   .edit), // Add an edit icon as trailing
//                                               onTap: () {
//                                                 // Handle the edit action here
//                                               },
//                                               subtitle: Text(
//                                                 '${DateFormat('yyyy-MM-dd').format(mammalmedicalCheckupDetailsList[index].mammalcheckupDate!)} ',
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                       TextButton(
//                                         onPressed: () {
//                                           // Show the VaccineEntryPage as a modal sheet
//                                           showModalBottomSheet(
//                                             context: context,
//                                             builder: (BuildContext context) {
//                                               return MedicalCheckupEntryPage(
//                                                 onSave: (
//                                                   checkupName,
//                                                   checkupDate,
//                                                 ) {
//                                                   // Save vaccine details to the list
//                                                   setState(() {
//                                                     mammalmedicalCheckupDetailsList
//                                                         .add(
//                                                       MedicalCheckupDetails(
//                                                         mammalcheckupName:
//                                                             checkupName,
//                                                         mammalcheckupDate:
//                                                             checkupDate,
//                                                       ),
//                                                     );
//                                                   });
//                                                 },
//                                               );
//                                             },
//                                           );
//                                         },
//                                         child: const Text(
//                                             'Add Examination Results +'),
//                                       ),
//                                     ],
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 16),
//                                     child: Row(
//                                       children: [
//                                         const Expanded(
//                                           flex: 2,
//                                           child: Text(
//                                             'Surgery Records',
//                                             style: TextStyle(
//                                                 fontSize: 18,
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 0,
//                                           child: TextButton(
//                                             onPressed:
//                                                 _showexpdeliveryDatePickerModalSheet,
//                                             child: const Text(
//                                               'View More ',
//                                               style: TextStyle(
//                                                   fontSize: 14,
//                                                   color: Color(0xFF245626)),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       SingleChildScrollView(
//                                         child: ListView.builder(
//                                           itemCount:
//                                               mammalsurgeryDetailsList.length,
//                                           shrinkWrap:
//                                               true, // This allows the ListView to take only necessary space
//                                           itemBuilder: (BuildContext context,
//                                               int index) {
//                                             return ListTile(
//                                               title: Text(
//                                                   mammalsurgeryDetailsList[
//                                                           index]
//                                                       .mammalsurgeryName),
//                                               trailing: const Icon(Icons
//                                                   .edit), // Add an edit icon as trailing
//                                               onTap: () {
//                                                 // Handle the edit action here
//                                               },
//                                               subtitle: Text(
//                                                 '${DateFormat('yyyy-MM-dd').format(mammalsurgeryDetailsList[index].mammalsurgeryDate!)} ',
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                       TextButton(
//                                         onPressed: () {
//                                           // Show the VaccineEntryPage as a modal sheet
//                                           showModalBottomSheet(
//                                             context: context,
//                                             builder: (BuildContext context) {
//                                               return SurgeryEntryPage(
//                                                 onSave: (
//                                                   surgeryName,
//                                                   surgeryDate,
//                                                 ) {
//                                                   // Save vaccine details to the list
//                                                   setState(() {
//                                                     mammalsurgeryDetailsList
//                                                         .add(
//                                                       SurgeryDetails(
//                                                         mammalsurgeryName:
//                                                             surgeryName,
//                                                         mammalsurgeryDate:
//                                                             surgeryDate,
//                                                       ),
//                                                     );
//                                                   });
//                                                 },
//                                               );
//                                             },
//                                           );
//                                         },
//                                         child: const Text(
//                                           "Add Surgery Results +",
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Text(
//                                 'Additonal Notes',
//                                 style: TextStyle(
//                                     fontSize: 18,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             const SizedBox(height: 12),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 16),
//                               child: Text(
//                                 widget.mammalnotesController.text,
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       // Medical Tabbar View Ends
//                     ],
//                   ),
//                 ),
//                 Container()
//               ],
//             ),
//           ),

//           // Tab Bar
//         ),
//       ),
//     );
//   }
// }

// class VaccineEntryPage extends StatefulWidget {
//   final Function(String, DateTime?, DateTime?) onSave;

//   const VaccineEntryPage({super.key, required this.onSave});

//   @override
//   // ignore: library_private_types_in_public_api
//   _VaccineEntryPageState createState() => _VaccineEntryPageState();
// }

// class _VaccineEntryPageState extends State<VaccineEntryPage> {
//   TextEditingController vaccineNameController = TextEditingController();
//   DateTime? firstDoseDate;
//   DateTime? secondDoseDate;

//   @override
//   void dispose() {
//     vaccineNameController.dispose();
//     super.dispose();
//   }

//   Future<void> _selectDate(BuildContext context, bool isFirstDose) async {
//     final selectedDate = await showDatePicker(
//       context: context,
//       initialDate: isFirstDose
//           ? firstDoseDate ?? DateTime.now()
//           : secondDoseDate ?? DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (selectedDate != null) {
//       setState(() {
//         if (isFirstDose) {
//           firstDoseDate = selectedDate;
//         } else {
//           secondDoseDate = selectedDate;
//         }
//       });
//     }
//   }

//   void _saveDataAndNavigateBack() {
//     String newVaccineName = vaccineNameController.text;
//     widget.onSave(newVaccineName, firstDoseDate, secondDoseDate);

//     // Close the modal sheet and return to MyPage
//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const Text(
//               "Add Vaccination",
//               style: TextStyle(
//                 fontSize: 35,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             const Text(
//               "Vaccine",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             TextFormField(
//               controller: vaccineNameController,
//               decoration: InputDecoration(
//                 labelText: 'Vaccine Name',
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.clear),
//                   onPressed: () {
//                     setState(() {
//                       vaccineNameController.clear();
//                     });
//                   },
//                 ),
//                 hintText: 'Enter Vaccine Name',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   vertical: 12.0,
//                   horizontal: 16.0,
//                 ),
//               ),
//               textInputAction: TextInputAction.done,
//             ),
//             const SizedBox(height: 20),
//             const Text('Add Date Of Vaccination:'),
//             const SizedBox(height: 8),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 10),
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.calendar_today,
//                       color: Color(0xFF245626)),
//                   onPressed: () {
//                     _selectDate(context, true);
//                   },
//                 ),
//               ),
//               readOnly: true,
//               controller: TextEditingController(
//                 text: firstDoseDate == null
//                     ? 'Date Of Vaccination'
//                     : '${firstDoseDate?.toLocal()}'.split(' ')[0],
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text('Add Next Date Of Vaccination:'),
//             const SizedBox(height: 8),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 10),
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.calendar_today,
//                       color: Color(0xFF245626)),
//                   onPressed: () {
//                     _selectDate(context, false);
//                   },
//                 ),
//               ),
//               readOnly: true,
//               controller: TextEditingController(
//                 text: secondDoseDate == null
//                     ? 'Next Date Of Vaccination'
//                     : '${secondDoseDate?.toLocal()}'.split(' ')[0],
//               ),
//             ),
//             const SizedBox(height: 20),
//             GestureDetector(
//               onTap: () {
//                 // Handle file upload logic here
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 width: double.infinity,
//                 height: 150,
//                 child: const Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.file_open_outlined,
//                       size: 35,
//                     ),
//                     Text(
//                       'Upload File, PDF, Jpeg, PNG',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Container(
//               width: double
//                   .infinity, // Make the button expand to full screen width
//               padding: const EdgeInsets.all(16),
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Save data and navigate back to MyPage
//                   _saveDataAndNavigateBack();
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 36, 86, 38),
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                 ),
//                 child: const Text(
//                   'Save',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MedicalCheckupEntryPage extends StatefulWidget {
//   final Function(String, DateTime?) onSave;

//   const MedicalCheckupEntryPage({super.key, required this.onSave});

//   @override
//   // ignore: library_private_types_in_public_api
//   _MedicalCheckupEntryPageState createState() =>
//       _MedicalCheckupEntryPageState();
// }

// class _MedicalCheckupEntryPageState extends State<MedicalCheckupEntryPage> {
//   TextEditingController checkupNameController = TextEditingController();
//   DateTime? checkupDate;

//   @override
//   void dispose() {
//     checkupNameController.dispose();
//     super.dispose();
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final selectedDate = await showDatePicker(
//       context: context,
//       initialDate: checkupDate ?? DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (selectedDate != null) {
//       setState(() {
//         checkupDate = selectedDate;
//       });
//     }
//   }

//   void _saveDataAndNavigateBack() {
//     String newCheckupName = checkupNameController.text;
//     widget.onSave(newCheckupName, checkupDate);

//     // Close the modal sheet and return to MyPage
//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const Text(
//               "Add Medical Checkup",
//               style: TextStyle(
//                 fontSize: 35,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             const Text(
//               "Checkup",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             TextFormField(
//               controller: checkupNameController,
//               decoration: InputDecoration(
//                 labelText: 'Checkup Name',
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.clear),
//                   onPressed: () {
//                     setState(() {
//                       checkupNameController.clear();
//                     });
//                   },
//                 ),
//                 hintText: 'Enter Checkup Name',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   vertical: 12.0,
//                   horizontal: 16.0,
//                 ),
//               ),
//               textInputAction: TextInputAction.done,
//             ),
//             const SizedBox(height: 20),
//             const Text('Add Checkup Date:'),
//             const SizedBox(height: 8),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 10),
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.calendar_today,
//                       color: Color(0xFF245626)),
//                   onPressed: () {
//                     _selectDate(context);
//                   },
//                 ),
//               ),
//               readOnly: true,
//               controller: TextEditingController(
//                 text: checkupDate == null
//                     ? 'Checkup Date'
//                     : DateFormat('yyyy-MM-dd').format(checkupDate!),
//               ),
//             ),
//             const SizedBox(height: 20),
//             GestureDetector(
//               onTap: () {
//                 // Handle file upload logic here
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 width: double.infinity,
//                 height: 150,
//                 child: const Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.file_open_outlined,
//                       size: 35,
//                     ),
//                     Text(
//                       'Upload File, PDF, Jpeg, PNG',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: _saveDataAndNavigateBack,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 36, 86, 38),
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                 ),
//                 child: const Text(
//                   'Save',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SurgeryEntryPage extends StatefulWidget {
//   final Function(String, DateTime?) onSave;

//   const SurgeryEntryPage({super.key, required this.onSave});

//   @override
//   // ignore: library_private_types_in_public_api
//   _SurgeryEntryPageState createState() => _SurgeryEntryPageState();
// }

// class _SurgeryEntryPageState extends State<SurgeryEntryPage> {
//   TextEditingController surgeryNameController = TextEditingController();
//   DateTime? surgeryDate;

//   @override
//   void dispose() {
//     surgeryNameController.dispose();
//     super.dispose();
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final selectedDate = await showDatePicker(
//       context: context,
//       initialDate: surgeryDate ?? DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (selectedDate != null) {
//       setState(() {
//         surgeryDate = selectedDate;
//       });
//     }
//   }

//   void _saveDataAndNavigateBack() {
//     String newSurgeryName = surgeryNameController.text;
//     widget.onSave(newSurgeryName, surgeryDate);

//     // Close the modal sheet and return to MyPage
//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const Text(
//               "Add Surgery",
//               style: TextStyle(
//                 fontSize: 35,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             const Text(
//               "Surgery",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             TextFormField(
//               controller: surgeryNameController,
//               decoration: InputDecoration(
//                 labelText: 'Surgery Name',
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.clear),
//                   onPressed: () {
//                     setState(() {
//                       surgeryNameController.clear();
//                     });
//                   },
//                 ),
//                 hintText: 'Enter Surgery Name',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   vertical: 12.0,
//                   horizontal: 16.0,
//                 ),
//               ),
//               textInputAction: TextInputAction.done,
//             ),
//             const SizedBox(height: 20),
//             const Text('Add Surgery Date:'),
//             const SizedBox(height: 8),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 10),
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.calendar_today,
//                       color: Color(0xFF245626)),
//                   onPressed: () {
//                     _selectDate(context);
//                   },
//                 ),
//               ),
//               readOnly: true,
//               controller: TextEditingController(
//                 text: surgeryDate == null
//                     ? 'Surgery Date'
//                     : DateFormat('yyyy-MM-dd').format(surgeryDate!),
//               ),
//             ),
//             const SizedBox(height: 20),
//             GestureDetector(
//               onTap: () {
//                 // Handle file upload logic here
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 width: double.infinity,
//                 height: 150,
//                 child: const Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.file_open_outlined,
//                       size: 35,
//                     ),
//                     Text(
//                       'Upload File, PDF, Jpeg, PNG',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: _saveDataAndNavigateBack,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 36, 86, 38),
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                 ),
//                 child: const Text(
//                   'Save',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class VaccineDetails {
//   final String mammalvaccineName;
//   final DateTime? firstDoseDate;
//   final DateTime? secondDoseDate;

//   VaccineDetails({
//     required this.mammalvaccineName,
//     this.firstDoseDate,
//     this.secondDoseDate,
//   });
// }

// class MedicalCheckupDetails {
//   final String mammalcheckupName;
//   final DateTime? mammalcheckupDate;

//   MedicalCheckupDetails({
//     required this.mammalcheckupName,
//     this.mammalcheckupDate,
//   });
// }

// class SurgeryDetails {
//   final String mammalsurgeryName;
//   final DateTime? mammalsurgeryDate;

//   SurgeryDetails({
//     required this.mammalsurgeryName,
//     this.mammalsurgeryDate,
//   });
// }
