
import 'dart:convert';

import 'package:book_train_ticket/Database/passenger.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Screens/ticket_generate.dart';

class MyTicketApp extends StatefulWidget {

  final String ticketReference;

  const MyTicketApp({super.key,required this.ticketReference});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyTicketApp> {
  List<Passenger> dataList = [];


  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://192.168.43.243/finalProjectTRain/ticket_generate.php?ticket_reference=${widget.ticketReference}'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      setState(() {
        dataList = jsonResponse.map((data) => Passenger.fromJson(data)).toList();
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
            :Tickets(dataList:dataList),
      ),
    );
  }
}

