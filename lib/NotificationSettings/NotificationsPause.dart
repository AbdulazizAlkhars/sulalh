import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _notification1 = false;
  bool _notification2 = false;
  bool _notification3 = false;
  bool _notification4 = false;

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
      body: Container(
        // padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text(
                'Pause All',
              ),
              trailing: Switch(
                value: _notification1,
                onChanged: (value) {
                  setState(() {
                    _notification1 = value;
                    if (value) {
                      // Disable other switches and turn them off
                      _notification2 = false;
                      _notification3 = false;
                      _notification4 = false;
                    }
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                'System Notifications',
                style: TextStyle(
                  color: (_notification1) ? Colors.grey : null,
                ),
              ),
              trailing: Switch(
                value: _notification2,
                onChanged: (_notification1)
                    ? null // Disable the switch when "Pause All" is turned on
                    : (value) {
                        setState(() {
                          _notification2 = value;
                        });
                      },
              ),
            ),
            ListTile(
              title: Text(
                'Animal Management',
                style: TextStyle(
                  color: (_notification1) ? Colors.grey : null,
                ),
              ),
              trailing: Switch(
                value: _notification3,
                onChanged: (_notification1)
                    ? null // Disable the switch when "Pause All" is turned on
                    : (value) {
                        setState(() {
                          _notification3 = value;
                        });
                      },
              ),
            ),
            ListTile(
              title: Text(
                'Collaboration',
                style: TextStyle(
                  color: (_notification1) ? Colors.grey : null,
                ),
              ),
              trailing: Switch(
                value: _notification4,
                onChanged: (_notification1)
                    ? null // Disable the switch when "Pause All" is turned on
                    : (value) {
                        setState(() {
                          _notification4 = value;
                        });
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
