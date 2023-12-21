import 'package:flutter/material.dart';

class NotificationData {
  final String text;
  final Color color;
  final IconData iconData;

  NotificationData({
    required this.text,
    required this.color,
    required this.iconData,
  });
}

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key});

  // Dummy notification data with text, color, and icon
  final List<NotificationData> notifications = [
    NotificationData(
      text: "New message from John. Reply now and answer your friend.",
      color: Colors.blue,
      iconData: Icons.arrow_downward,
    ),
    NotificationData(
      text: "You've got a new follower. See how to get more followers.",
      color: Colors.green,
      iconData: Icons.notifications,
    ),
    NotificationData(
      text: "Reminder: Meeting at 2 PM. Be on time my friend.",
      color: Colors.orange,
      iconData: Icons.percent,
    ),
    NotificationData(
      text: "Special offer: Buy 1 Get 1 Free! Only this month.",
      color: Colors.deepPurple,
      iconData: Icons.local_offer,
    ),
    NotificationData(
      text: "Weather update: Rain expected today and heavy snowfall tomorrow.",
      color: Colors.teal,
      iconData: Icons.wb_sunny_outlined,
    ),
    NotificationData(
      text: "Congratulations! You've earned a badge.",
      color: Colors.amber,
      iconData: Icons.arrow_downward,
    ),
    NotificationData(
      text: "Event alert: Tomorrow's bayan.",
      color: Colors.deepOrange,
      iconData: Icons.event_available,
    ),
    NotificationData(
      text: "You've got a new follower. See how to get more followers.",
      color: Colors.green,
      iconData: Icons.notifications,
    ),
    NotificationData(
      text: "Reminder: Meeting at 2 PM. Be on time my friend.",
      color: Colors.orange,
      iconData: Icons.percent,
    ),
    NotificationData(
      text: "Special offer: Buy 1 Get 1 Free! Only this month.",
      color: Colors.deepPurple,
      iconData: Icons.local_offer,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F6CFF),
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: notifications[index].color,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Icon(
                                notifications[index].iconData,
                                color: notifications[index].color,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 250,
                            child: Text(
                              notifications[index].text,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            '6 hours ago',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 0.5,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
