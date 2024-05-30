
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Screens/schedulepage.dart';
import '../Screens/Scheduel_display.dart';
import 'my_data.dart';

class MyApp extends StatefulWidget {
  final int? selectedDay;
  DateTime dateTime;
  final int? numberofChild;
  final int? numberOfAdult;
  MyApp({required this.selectedDay,required this.numberOfAdult, required this.numberofChild,required this.dateTime});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<MyData> dataList = [];


  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://192.168.43.243/finalprojectTrain/database.php'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      setState(() {
        dataList = jsonResponse.map((data) => MyData.fromJson(data)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: dataList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            :scheduleTry(datalist:dataList,numberOfAdult: widget.numberOfAdult, numberofChild: widget.numberofChild, SelectedDate: widget.selectedDay, initialDate: widget.dateTime,), // Pass the dataList to the Schedule class
      ),
    );
  }
}

void main() {
  runApp(MyApp(selectedDay: null, numberOfAdult:0, numberofChild: 0, dateTime: DateTime.now()),);
}
