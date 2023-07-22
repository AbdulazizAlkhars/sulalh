import 'package:flutter/material.dart';
import 'package:hathera_demo/FamilyTree.dart';
import 'package:hathera_demo/HomeScreen/Registered/NotificationList.dart';
import 'package:hathera_demo/Widgets/Tags.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../GuestMode/HomeScreen1.dart';

class RegHomePage extends StatefulWidget {
  @override
  _RegHomePage createState() => _RegHomePage();
}

class _RegHomePage extends State<RegHomePage> {
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
        return Container(
          width: double.infinity, // Stretch to screen width
          child: FractionallySizedBox(
            heightFactor: 0.62, // Set the height factor as you desire
            child: Container(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 16),

                    Text(
                      'Tags',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Current State',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
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
                        SizedBox(width: 8),
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
                        SizedBox(width: 8),
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
                    SizedBox(
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
                        SizedBox(width: 8),
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
                        SizedBox(width: 8),
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
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Medical State',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
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
                        SizedBox(width: 8),
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
                        SizedBox(width: 8),
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
                    SizedBox(height: 8),
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
                        SizedBox(width: 8),
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
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Others',
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 42, 41, 41),
                      ),
                    ),
                    SizedBox(
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
                        SizedBox(width: 8),
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
                    SizedBox(
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
                        SizedBox(width: 8),
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
        automaticallyImplyLeading: false,
        title: Text(
          'Overview',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnimalFamilyTree()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationList()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Animals',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: _showFilterModalSheet,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.filter_alt_outlined),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SmallCardWidget(
                    icon: Icons.book,
                    animalData: AnimalData(
                        'ALL', sumOfNextTwoCards, _chartData[0].color),
                    quan: sumOfNextTwoCards.toString(),
                    onPressed: () {
                      _updateChartData(sumOfNextTwoCards, 'ALL');
                    },
                    color: Color.fromARGB(
                        235, 255, 248, 214), // Set the color for the first card
                    isSelected: _selectedIndex == -1,
                  ),
                ),
                Expanded(
                  child: SmallCardWidget(
                    icon: Icons.music_note,
                    animalData: _chartData[0],
                    quan: _chartData[0].quan.toString(),
                    onPressed: () {
                      _updateChartData(_chartData[0].quan, 'Mammals');
                    },
                    color: Color.fromARGB(235, 255, 248, 214),
                    isSelected: _selectedIndex == 0,
                  ),
                ),
                Expanded(
                  child: SmallCardWidget(
                    icon: Icons.music_note,
                    animalData: _chartData[1],
                    quan: _chartData[1].quan.toString(),
                    onPressed: () {
                      _updateChartData(_chartData[1].quan, 'Oviparous');
                    },
                    color: Color.fromARGB(235, 255, 248, 214),
                    isSelected: _selectedIndex == 1,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 250, // Adjust the width of the chart
                    height: 250, // Adjust the height of the chart
                    child: SfCircularChart(
                      series: <CircularSeries>[
                        DoughnutSeries<AnimalData, String>(
                          dataSource: _chartData,
                          xValueMapper: (AnimalData data, _) => data.animal,
                          yValueMapper: (AnimalData data, _) => data.quan,
                          pointColorMapper: (AnimalData data, _) => data.color,
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: _buildLegendItems(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Upcoming Events',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: events.length,
              itemBuilder: (context, index) {
                EventData eventData = events[index];
                return ListTile(
                  title: Text(
                    eventData.title,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    eventData.subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                );
              },
            ),
            Row(
              children: [
                Expanded(
                  child: CardWidget(
                    icon: Icons.book,
                    text: 'Searching For Animals',
                    buttonText: 'Find Animals',
                    onPressed: () {
                      // Handle button 1 press
                    },
                    color: Color.fromARGB(
                        255, 197, 219, 158), // Set the color for the first card
                  ),
                ),
                Expanded(
                  child: CardWidget(
                    icon: Icons.music_note,
                    text: 'Search For\nFarms',
                    buttonText: 'Find Farms',
                    onPressed: () {
                      // Handle button 2 press
                    },
                    color: Color.fromARGB(255, 254, 255,
                        168), // Set the color for the second card
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<AnimalData> getChartData() {
    final List<AnimalData> chartData = [
      AnimalData(
        'Mammals',
        12,
        Color.fromARGB(255, 197, 219, 158),
      ),
      AnimalData(
        'Oviparous',
        25,
        Color.fromARGB(255, 254, 255, 168),
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
          SizedBox(width: 4),
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
  final IconData icon;
  final AnimalData animalData;
  final String quan;
  final VoidCallback onPressed;
  final Color color;
  final bool isSelected; // Added new isSelected property

  const SmallCardWidget({
    required this.icon,
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
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation:
            widget.isSelected ? 10 : 0, // Set elevation based on isSelected
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () {
            setState(() {
              widget.onPressed();
            });
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 106,
            height: 148,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: widget.color, // Set the color of the card
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  widget.icon,
                  size: 40,
                  color: Colors.black, // Set the color of the icon
                ),
                SizedBox(height: 25),
                Text(
                  widget.animalData.animal,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  widget.animalData.quan.toString(),
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
