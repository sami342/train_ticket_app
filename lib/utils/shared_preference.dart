import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
class BookingStorage {
  // Function to save passenger document IDs to Shared Preferences
  Future<void> savePassengerDocumentIdsToPrefs(List<String> documentIds) async {
    final prefs = await SharedPreferences.getInstance();
    String documentIdsJson = jsonEncode(documentIds);
    await prefs.setString('passengerDocumentIds', documentIdsJson);
  }

  // Function to retrieve a list of passenger document IDs from Shared Preferences
  Future<List<String>?> getPassengerDocumentIdsFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    String? documentIdsJson = prefs.getString('passengerDocumentIds');
    if (documentIdsJson != null) {
      List<dynamic> documentIdList = jsonDecode(documentIdsJson);
      return documentIdList.cast<String>();
    }
    return null;
  }

  Future<List<String>?> getNotificationDocumentIdsFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('notificationDocumentIds'); // Ensure correct key usage
  }

  Future<void> addNotificationDocumentId(String newId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? documentIds = prefs.getStringList('notificationDocumentIds');

    if (documentIds == null) {
      documentIds = [newId];
    } else {
      documentIds.add(newId);
    }

    await prefs.setStringList('notificationDocumentIds', documentIds);
  }
}
