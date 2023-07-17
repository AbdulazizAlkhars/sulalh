import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _PauseAll = false;
  bool _SysNotifications = false;
  bool _AnimalNotifications = false;
  bool _Collaboration = false;

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
                value: _PauseAll,
                onChanged: (value) {
                  setState(() {
                    _PauseAll = value;
                    if (value) {
                      // Disable other switches and turn them off
                      _SysNotifications = false;
                      _AnimalNotifications = false;
                      _Collaboration = false;
                    }
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                'System Notifications',
                style: TextStyle(
                  color: (_PauseAll) ? Colors.grey : null,
                ),
              ),
              trailing: Switch(
                value: _SysNotifications,
                onChanged: (_PauseAll)
                    ? null // Disable the switch when "Pause All" is turned on
                    : (value) {
                        setState(() {
                          _SysNotifications = value;
                        });
                      },
              ),
            ),
            ListTile(
              title: Text(
                'Animal Management',
                style: TextStyle(
                  color: (_PauseAll) ? Colors.grey : null,
                ),
              ),
              trailing: Switch(
                value: _AnimalNotifications,
                onChanged: (_PauseAll)
                    ? null // Disable the switch when "Pause All" is turned on
                    : (value) {
                        setState(() {
                          _AnimalNotifications = value;
                        });
                      },
              ),
            ),
            ListTile(
              title: Text(
                'Collaboration',
                style: TextStyle(
                  color: (_PauseAll) ? Colors.grey : null,
                ),
              ),
              trailing: Switch(
                value: _Collaboration,
                onChanged: (_PauseAll)
                    ? null // Disable the switch when "Pause All" is turned on
                    : (value) {
                        setState(() {
                          _Collaboration = value;
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
