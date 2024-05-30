import 'package:http/http.dart' as http;
import 'dart:convert';
import 'my_data.dart';

class DatabaseHelper {
  static Future<List<MyData>> fetchData() async {
    final response = await http.get(Uri.parse('http://192.168.43.243/finalProjectTRain/database.php'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => MyData.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
