import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Screens/single_ticket_find.dart';
import 'my_data.dart';

class SingleTicket extends StatefulWidget {
  final int selectedDay;
  final DateTime dateTime;
  final int numberOfChild;
  final int numberOfAdult;
  final String departurePlace;
  final String ArrivalPlace;

  const SingleTicket({
    super.key,
    required this.selectedDay,
    required this.numberOfAdult,
    required this.numberOfChild,
    required this.dateTime,
    required this.ArrivalPlace,
    required this.departurePlace,
  });

  @override
  SingleTicketState createState() => SingleTicketState();
}

class SingleTicketState extends State<SingleTicket> {
  List<MyData> dataList = [];

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('http://192.168.43.243/finalprojectTRain/database.php'),
    );

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
            :SingleTicketFind(tickets:dataList, arrivalPlace: widget.ArrivalPlace, departuredate:widget.dateTime, numberOfAdult: widget.numberOfAdult, numberOfChild: widget.numberOfChild, CargoType: '', departurePlace: widget.departurePlace,),
      ),
    );
  }
}
