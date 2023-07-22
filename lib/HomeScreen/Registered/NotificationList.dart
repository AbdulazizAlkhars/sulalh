import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'imagePath':
          'assets/Staff Images/Screenshot_20200303-215853__01.jpg.webp',
      'title': 'New Update Available!',
      'subtitle': 'Download From AppStore Now',
      'time': DateTime.now()
          .subtract(Duration(hours: 1)), // Example time (1 hour ago)
    },
    {
      'imagePath':
          'assets/Staff Images/Black-Widow-Avengers-Endgame-feature.jpg',
      'title': 'Horse Vaccination',
      'subtitle': '09.01.2023',
      'time': DateTime.now()
          .subtract(Duration(hours: 2)), // Example time (2 hours ago)
    },
    {
      'imagePath':
          'assets/Staff Images/Wanda-Dr-Strange-Multiverse-Madness-Culture.jpg.webp',
      'title': 'Mohammed',
      'subtitle': 'Request',
      'time': DateTime.now()
          .subtract(Duration(minutes: 30)), // Example time (30 minutes ago)
    },
    // Add more data here if needed
  ];

  String formatTimeAgo(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);
    if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day ago' : 'days ago'}';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour ago' : 'hours ago'}';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute ago' : 'minutes ago'}';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Notifications',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                final timeAgo = formatTimeAgo(notification['time'] as DateTime);
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage(notification['imagePath'] as String),
                  ),
                  title: Text(
                    notification['title'] as String,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(notification['subtitle'] as String),
                  trailing: (notification['subtitle'] == 'Request')
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Handle 'Yes' button click
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    const Color.fromARGB(255, 36, 86, 38),
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(12),
                              ),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                            // SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                // Handle 'No' button click
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 225, 225, 225),
                                elevation: 0,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(12),
                              ),
                              child: Icon(Icons.close),
                            ),
                          ],
                        )
                      : Text(
                          timeAgo,
                          style: TextStyle(fontSize: 13),
                        ),
                  onTap: () {
                    // Handle tap on the list item
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
