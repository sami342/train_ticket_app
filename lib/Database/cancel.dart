import 'dart:convert';
import 'package:book_train_ticket/Database/passenger.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Screens/find_my_cancle_ticket.dart';

class MyTicketCancelApp extends StatefulWidget {
  final String ticketReference;
  final String phoneNumber;
  final String firstname;

  const MyTicketCancelApp(
      {super.key,
      required this.ticketReference,
      required this.phoneNumber,
      required this.firstname});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyTicketCancelApp> {
  List<Passenger> dataList = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'http://192.168.43.243/finalProjectTRain/ReadToCancel.php?ticket_reference=${widget.ticketReference}&phone_number=${widget.phoneNumber}&first_name=${widget.firstname}'));
    if (response.statusCode == 200) {
      dynamic jsonResponse = json.decode(response.body);
      setState(() {
        if (jsonResponse is List) {
          dataList = jsonResponse.map((data) => Passenger.fromJson(data)).toList();
        } else {
          dataList = [];
        }
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
            : cancelMyTicket(
                dataList: dataList,
                reference: widget.ticketReference,
                phoneNumber: widget.phoneNumber,
              ),
      ),
    );
  }
}
