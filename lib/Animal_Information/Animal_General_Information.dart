import 'package:flutter/material.dart';

class AnimalgenifnoPage extends StatefulWidget {
  @override
  _AnimalgenifnoPage createState() => _AnimalgenifnoPage();
}

class _AnimalgenifnoPage extends State<AnimalgenifnoPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
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
                    const Text(
                      'Shirley',
                      style: TextStyle(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildInfoBox('Borrowed'),
                        const SizedBox(width: 8),
                        _buildInfoBox('Lactating'),
                        const SizedBox(width: 8),
                        _buildInfoBox('Favourite'),
                        const SizedBox(width: 8),
                      ],
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
                        tabs: [
                          const Tab(
                            text: 'General',
                          ),
                          const Tab(
                            text: 'Breeding',
                          ),
                          const Tab(
                            text: 'Medical',
                          ),
                        ],
                      ),
                    ),

                    // Tab Bar View
                    // Tab Bar View
                    // Tab Bar View
                    SingleChildScrollView(
                      child: SizedBox(
                        height:
                            MediaQuery.of(context).size.height - 100 - 20 - 50,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            Column(
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
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'Mammals',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
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
                                            '2 Years',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Age',
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
                                            'Female',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
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
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Date Of Birth',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: Text(
                                          '12.02.2023',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Date Of Weaning',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: Text(
                                          '12.05.2023',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Date Of Death',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          '',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ), // Example date, replace with actual date or empty string
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: Text(
                                          'Add >',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 36, 86, 38),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Date Of Mating',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          '',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ), // Example date, replace with actual date or empty string
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: Text(
                                          'Add >',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 36, 86, 38),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Date Of Sale',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: Text(
                                          'Add >',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 36, 86, 38),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Date Of Sale',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: Text(
                                          'Add >',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 36, 86, 38),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Date Of Sale',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: Text(
                                          'Add >',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 36, 86, 38),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Date Of Sale',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: Text(
                                          'Add >',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 36, 86, 38),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Date Of Sale',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: Text(
                                          'Add >',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 36, 86, 38),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              color: Colors
                                  .green, // Placeholder color for Breeding tab view
                            ),
                            Container(
                              color: Colors
                                  .blue, // Placeholder color for Medical Notes tab view
                            ),
                          ],
                        ),
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
