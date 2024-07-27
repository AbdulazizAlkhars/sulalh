import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';
import 'package:intl/intl.dart';

import 'data.dart';

class PregnancyDetails {
  final String animalName;
  final String animalSpecies;
  final DateTime breedingDate;

  PregnancyDetails({
    required this.animalName,
    required this.animalSpecies,
    required this.breedingDate,
  });
}

class PregnancyDetailPage extends StatelessWidget {
  final PregnancyDetails details;

  PregnancyDetailPage({required this.details});

  String getDailyInfo(String species, int day, String type) {
    return dailyData[species]?[day]?[type] ??
        '$species $type info for day $day not available';
  }

  String getDailyImage(String species, int day) {
    return dailyData[species]?[day]?['image'] ?? 'assets/default_fetus.png';
  }

  @override
  Widget build(BuildContext context) {
    final int daysPregnant =
        DateTime.now().difference(details.breedingDate).inDays;

    return Scaffold(
      backgroundColor: AppColors.grayscale00,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Mom & Baby Today',
          style: AppFonts.headline3(color: AppColors.grayscale100),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(-3, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                  ),
                ),
                child: Image.asset(
                  getDailyImage(details.animalSpecies, daysPregnant),
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Mum ${details.animalName}',
                          style: AppFonts.title4(color: AppColors.grayscale100),
                        ),
                        Spacer(),
                        Icon(
                          Icons.av_timer,
                          size: 20,
                          color: AppColors.primary40,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Day $daysPregnant Pregnant',
                          style:
                              AppFonts.headline4(color: AppColors.grayscale100),
                        ),
                      ],
                    ),
                    Text(
                      '${details.animalSpecies}',
                      style: AppFonts.headline4(color: AppColors.grayscale100),
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.primary50, AppColors.primary20],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(-3, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    "Mother's Health",
                                    style: AppFonts.title4(
                                        color: AppColors.grayscale00),
                                  ),
                                ),
                                Icon(
                                  Icons.medical_services_outlined,
                                  size: 20,
                                  color: AppColors.grayscale00,
                                ),
                              ],
                            ),
                            Text(
                              getDailyInfo(details.animalSpecies, daysPregnant,
                                  'health'),
                              style: AppFonts.headline4(
                                  color: AppColors.grayscale00),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.primary50, AppColors.primary20],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(3, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Fetus's Condition",
                                  style: AppFonts.title4(
                                      color: AppColors.grayscale00),
                                ),
                                Icon(
                                  Icons.child_care_rounded,
                                  size: 20,
                                  color: AppColors.grayscale00,
                                ),
                              ],
                            ),
                            Text(
                              getDailyInfo(details.animalSpecies, daysPregnant,
                                  'fetushealth'),
                              style: AppFonts.headline4(
                                  color: AppColors.grayscale00),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.primary50, AppColors.primary20],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(-3, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                "Mother's Behavior",
                                style: AppFonts.title4(
                                    color: AppColors.grayscale00),
                              ),
                            ),
                            Text(
                              getDailyInfo(details.animalSpecies, daysPregnant,
                                  'behavior'),
                              style: AppFonts.headline4(
                                  color: AppColors.grayscale00),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.primary50, AppColors.primary20],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(3, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Tips for Today',
                                style: AppFonts.title4(
                                    color: AppColors.grayscale00),
                              ),
                            ),
                            Text(
                              getDailyInfo(
                                  details.animalSpecies, daysPregnant, 'tips'),
                              style: AppFonts.headline4(
                                  color: AppColors.grayscale00),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20.0),
                    //     border: Border.all(color: AppColors.grayscale20),
                    //     color: AppColors.grayscale00,
                    //   ),
                    //   height: 260,
                    //   child: PageView(
                    //     scrollDirection: Axis.horizontal,
                    //     children: [
                    //       _buildCard(
                    //           title: "Mother's Health",
                    //           content: getDailyInfo(
                    //               details.animalSpecies, daysPregnant, 'health'),
                    //           color: AppColors.grayscale10),
                    //       _buildCard(
                    //           title: "Fetus's Condition",
                    //           content: getDailyInfo(details.animalSpecies,
                    //               daysPregnant, 'fetushealth'),
                    //           color: AppColors.grayscale10),
                    //       _buildCard(
                    //           title: "Mother's Behavior",
                    //           content: getDailyInfo(details.animalSpecies,
                    //               daysPregnant, 'behavior'),
                    //           color: AppColors.grayscale10),
                    //       _buildCard(
                    //           title: 'Tips for Day $daysPregnant',
                    //           content: getDailyInfo(
                    //               details.animalSpecies, daysPregnant, 'tips'),
                    //           color: AppColors.grayscale10),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//   Widget _buildCard({
//     required String title,
//     required String content,
//     required Color color,
//   }) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       elevation: 1,
//       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       color: color,
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Text(
//                   title,
//                   style: AppFonts.title4(color: AppColors.grayscale100),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 content,
//                 style: AppFonts.headline4(color: AppColors.grayscale80),
//                 textAlign: TextAlign.justify,
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Swipe to see more',
//                     style: AppFonts.body1(color: AppColors.primary30),
//                   ),
//                   Icon(Icons.chevron_right, color: AppColors.primary30),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
}
