import 'dart:convert';
import 'package:book_train_ticket/Database/my_ticket.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Screens/ticket_generate.dart';

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  String ticketReference = 'Client-202417'; // Provide the ticket reference here
  List<MyTicketGenerte> ticketData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
    print(ticketData);
  }
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://192.168.43.243/finalprojectTrain/ticket_generate.php?ticket_reference=$ticketReference'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      setState(() {
        ticketData = jsonResponse.map((data) => MyTicketGenerte.fromJson(data)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ticketData.isEmpty
          ? const Center(child: Text('No data found'))
          :Tickets(datalist: ticketData,),
    );
  }
}
