import 'package:cloud_firestore/cloud_firestore.dart';

class Notify {
  final String message;
  final String reference;
  final String date;

  Notify({
    required this.message,
    required this.reference,
    required this.date,
  });

  factory Notify.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // Handling Firestore Timestamp
    DateTime parsedDate;
    if (data['date'] != null && data['date'] is Timestamp) {
      parsedDate = (data['date'] as Timestamp).toDate();
    } else {
      parsedDate = DateTime.now(); // Default to current date if none provided
    }

    return Notify(
      message: data['message'] ?? '',
      reference: data['reference'] ?? '',
      date: data['Date'] ?? '',
    );
  }

  static Future<Notify?> getNotificationData(String docId) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('notifications')
          .doc(docId)
          .get();
      if (doc.exists) {
        return Notify.fromDocument(doc);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
