import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import '../Database/notify.dart';
import '../utils/shared_preference.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<String>? _documentIds;
  final List<Notify> _notifications = []; // To store fetched notifications

  @override
  void initState() {
    super.initState();
    getDocumentIdsFromPrefs();
  }

  Future<void> getDocumentIdsFromPrefs() async {
    final bookingStorage = BookingStorage();

    List<String>? ids =
        await bookingStorage.getNotificationDocumentIdsFromPrefs();
    setState(() {
      _documentIds = ids;
    });
    fetchDataForTrip();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styles.bgColor,
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          Notify notification = _notifications[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Refrence Number:",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        notification.reference,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    notification.message,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    notification.date,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> fetchDataForTrip() async {
    if (_documentIds == null || _documentIds!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('No passenger Ticket History found.'),
      ));
      return;
    }

    Set<String> processedReferences = Set<String>();

    for (String docId in _documentIds!) {
      if (processedReferences.contains(docId)) continue;

      Notify? notification =
          await Notify.getNotificationData(docId); // Static call

      if (notification != null) {
        setState(() {
          _notifications.add(notification);
        });
        processedReferences.add(docId);
      } else {
      }
    }
  }
}
