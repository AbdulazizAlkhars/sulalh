import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/HomeScreen/GuestMode/GuestHomePage.dart';
import 'package:hathera_demo/HomeScreen/GuestMode/SearchFarms&Animals.dart';
import 'package:hathera_demo/HomeScreen/Registered/NotificationList.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';
import 'package:hathera_demo/Widgets/Tags.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RegHomePage extends StatefulWidget {
  const RegHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegHomePage createState() => _RegHomePage();
}

class _RegHomePage extends State<RegHomePage> {
  Future<void> _refreshData() async {
    setState(() {
      _chartData = getChartData();
      sumOfNextTwoCards = _chartData[0].quan + _chartData[1].quan;
    });
    await Future.delayed(const Duration(seconds: 1));
  }

  late List<AnimalData> _chartData;
  int sumOfNextTwoCards = 0;
  List<EventData> events = [
    EventData(title: 'Horse Vaccination', subtitle: '09.01.2023'),
    EventData(title: 'Cow Health Checkup', subtitle: '01.09.2023'),
  ];
  int _selectedIndex = -1;
  @override
  void initState() {
    _chartData = getChartData();
    sumOfNextTwoCards = _chartData[0].quan + _chartData[1].quan;
    super.initState();
  }

  void _updateChartData(int newQuan, String animalName) {
    for (int i = 0; i < _chartData.length; i++) {
      if (_chartData[i].animal == animalName) {
        _chartData[i] = AnimalData(animalName, newQuan, _chartData[i].color);
        break;
      }
    }
    setState(() {
      // Trigger a rebuild of the widget
      _selectedIndex =
          _chartData.indexWhere((data) => data.animal == animalName);
    });
  }

  void _showFilterModalSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Set this to true to enable full-width modal
      builder: (BuildContext context) {
        return SizedBox(
          width: double.infinity, // Stretch to screen width
          child: FractionallySizedBox(
            heightFactor: 0.62, // Set the height factor as you desire
            child: Container(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),

                    const Text(
                      'Tags',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Current State',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Tags(
                            text: 'Borrowed',
                            icon: Icons.ac_unit,
                            onPress: () {
                              // Handle tag click
                            },
                            status: TagStatus.active,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Tags(
                            text: 'Adopted',
                            icon: Icons.ac_unit,
                            onPress: () {
                              // Handle tag click
                            },
                            status: TagStatus.notActive,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Tags(
                            text: 'Donated',
                            icon: Icons.ac_unit,
                            onPress: () {
                              // Handle tag click
                            },
                            status: TagStatus.disabled,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Tags(
                            text: 'Escaped',
                            icon: Icons.ac_unit,
                            onPress: () {
                              // Handle tag click
                            },
                            status: TagStatus.active,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Tags(
                            text: 'Stolen',
                            icon: Icons.ac_unit,
                            onPress: () {
                              // Handle tag click
                            },
                            status: TagStatus.notActive,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Tags(
                            text: 'Transferred',
                            icon: Icons.ac_unit,
                            onPress: () {
                              // Handle tag click
                            },
                            status: TagStatus.disabled,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Medical State',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Tags(
                            text: 'Injured',
                            icon: Icons.ac_unit,
                            onPress: () {
                              // Handle tag click
                            },
                            status: TagStatus.active,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Tags(
                            text: 'Sick',
                            icon: Icons.ac_unit,
                            onPress: () {
                              // Handle tag click
                            },
                            status: TagStatus.notActive,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Tags(
                            text: 'Quarantined',
                            icon: Icons.ac_unit,
                            onPress: () {
                              // Handle tag click
                            },
                            status: TagStatus.disabled,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Tags(
                            text: 'Medication',
                            icon: Icons.ac_unit,
                            onPress: () {
                              // Handle tag click
                            },
                            status: TagStatus.active,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Tags(
                            text: 'Testing',
                            icon: Icons.ac_unit,
                            onPress: () {
                              // Handle tag click
                            },
                            status: TagStatus.notActive,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Others',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 42, 41, 41),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Tags(
                            text: 'Sold',
                            icon: Icons.ac_unit,
                            onPress: () {
                              // Handle tag click
                            },
                            status: TagStatus.active,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Tags(
                            text: 'Dead',
                            icon: Icons.ac_unit,
                            onPress: () {
                              // Handle tag click
                            },
                            status: TagStatus.notActive,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  const Color.fromARGB(255, 225, 225, 225),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onPressed: () {
                              // Handle cancel button press
                              Navigator.pop(context); // Close the modal sheet
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text('Clear All',
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  const Color.fromARGB(255, 36, 86, 38),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onPressed: () {
                              // Handle join farm button press
                              Navigator.pop(context); // Close the modal sheet
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                'Apply',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // You can add more widgets as needed
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              'Overview',
              style: AppFonts.title3(color: AppColors.grayscale100),
            ),
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.016),
            decoration: BoxDecoration(
              color: AppColors.grayscale10,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchPage()),
                );
              },
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.0097),
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.016),
            decoration: BoxDecoration(
              color: AppColors.grayscale10,
              borderRadius: BorderRadius.circular(50),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationList()),
                );
              },
              child: Image(
                image: AssetImage('assets/icons/frame/24px/Icon-button1.png'),
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: AppColors.primary40,
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.042,
                right: MediaQuery.of(context).size.width * 0.042,
                top: MediaQuery.of(context).size.height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Animals',
                        style: AppFonts.title4(color: AppColors.grayscale90)),
                    InkWell(
                      onTap: _showFilterModalSheet,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                          image:
                              AssetImage('assets/icons/frame/24px/filter1.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.014),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.192,
                      width: MediaQuery.of(context).size.width * 0.282,
                      child: SmallCardWidget(
                        imageAsset: "assets/icons/frame/24px/cow_chicken.png",
                        animalData: AnimalData(
                            'ALL', sumOfNextTwoCards, _chartData[0].color),
                        quan: sumOfNextTwoCards.toString(),
                        onPressed: () {
                          _updateChartData(sumOfNextTwoCards, 'ALL');
                        },
                        color: const Color.fromARGB(235, 255, 248,
                            214), // Set the color for the first card
                        isSelected: _selectedIndex == -1,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.182,
                      width: MediaQuery.of(context).size.width * 0.282,
                      child: SmallCardWidget(
                        imageAsset: "assets/icons/frame/24px/cow_framed.png",
                        animalData: _chartData[0],
                        quan: _chartData[0].quan.toString(),
                        onPressed: () {
                          _updateChartData(_chartData[0].quan, 'Mammals');
                        },
                        color: const Color.fromARGB(235, 255, 248, 214),
                        isSelected: _selectedIndex == 0,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.182,
                      width: MediaQuery.of(context).size.width * 0.282,
                      child: SmallCardWidget(
                        imageAsset:
                            "assets/icons/frame/24px/chicken_framed.png",
                        animalData: _chartData[1],
                        quan: _chartData[1].quan.toString(),
                        onPressed: () {
                          _updateChartData(_chartData[1].quan, 'Oviparous');
                        },
                        color: const Color.fromARGB(235, 255, 248, 214),
                        isSelected: _selectedIndex == 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.019),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.576,
                      height: MediaQuery.of(context).size.height * 0.27,
                      child: SfCircularChart(
                        series: <CircularSeries>[
                          DoughnutSeries<AnimalData, String>(
                            dataSource: _chartData,
                            xValueMapper: (AnimalData data, _) => data.animal,
                            yValueMapper: (AnimalData data, _) => data.quan,
                            pointColorMapper: (AnimalData data, _) =>
                                data.color,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: _buildLegendItems(),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Upcoming Events',
                  style: AppFonts.title4(color: AppColors.grayscale90),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.16,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      EventData eventData = events[index];
                      return ListTile(
                        title: Text(eventData.title,
                            style:
                                AppFonts.body1(color: AppColors.grayscale90)),
                        subtitle: Text(
                          eventData.subtitle,
                          style: AppFonts.body2(color: AppColors.grayscale60),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_rounded,
                            color: AppColors.primary40,
                            size: MediaQuery.of(context).size.width * 0.034),
                      );
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.039),
                Row(
                  children: [
                    Expanded(
                      child: CardWidget(
                        imagePath: 'assets/icons/frame/24px/Cow_Icon.png',
                        text: 'Searching For Animals'.tr,
                        buttonText: 'Find Animals',
                        onPressed: () {
                          // Handle button 1 press
                        },
                        color: const Color.fromRGBO(225, 236, 185, 1),
                      ),
                    ),
                    Expanded(
                      child: CardWidget(
                        imagePath: 'assets/icons/frame/24px/Farm_house.png',
                        text: 'Search For\nFarms',
                        buttonText: 'Find Farms',
                        onPressed: () {
                          // Handle button 2 press
                        },
                        color: const Color.fromARGB(255, 254, 255,
                            168), // Set the color for the second card
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<AnimalData> getChartData() {
    final List<AnimalData> chartData = [
      AnimalData(
        'Mammals',
        12,
        const Color.fromARGB(255, 197, 219, 158),
      ),
      AnimalData(
        'Oviparous',
        25,
        const Color.fromARGB(255, 254, 255, 168),
      ),
    ];
    return chartData;
  }

  List<Widget> _buildLegendItems() {
    return _chartData.map((data) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle, color: data.color),
          const SizedBox(width: 4),
          Text('${data.animal}: ${data.quan}'),
        ],
      );
    }).toList();
  }
}

class AnimalData {
  AnimalData(this.animal, this.quan, this.color);
  final String animal;
  final int quan;
  final Color color;
}

class EventData {
  final String title;
  final String subtitle;

  EventData({required this.title, required this.subtitle});
}

class SmallCardWidget extends StatefulWidget {
  final String imageAsset; // Use an image asset path instead of an icon
  final AnimalData animalData;
  final String quan;
  final VoidCallback onPressed;
  final Color color;
  final bool isSelected; // Added new isSelected property

  const SmallCardWidget({
    required this.imageAsset, // Pass an image asset path
    required this.animalData,
    required this.quan,
    required this.onPressed,
    required this.color,
    this.isSelected = false,
  });

  @override
  _SmallCardWidgetState createState() => _SmallCardWidgetState();
}

class _SmallCardWidgetState extends State<SmallCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        if (widget
            .isSelected) // Show the back card only when isSelected is true
          Positioned.fill(
            child: Material(
              type: MaterialType.card,
              color: const Color.fromRGBO(
                  225, 219, 190, 1), // Change the color for the back card
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.037),
            ),
          ),
        Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.0073),
          child: Material(
            type: MaterialType.card,
            elevation:
                widget.isSelected ? 10 : 0, // Set elevation based on isSelected
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * 0.037),
            color: const Color.fromRGBO(249, 245, 236, 1),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  widget.onPressed();
                });
              },
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.037),
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.042),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      widget.imageAsset, // Use the provided image asset path
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.014),
                    Text(widget.animalData.animal,
                        style: AppFonts.body2(color: AppColors.grayscale100)),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0034),
                    Text(widget.animalData.quan.toString(),
                        style:
                            AppFonts.headline4(color: AppColors.grayscale100)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
