import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SavePassenger extends StatefulWidget {
  final List<Map<String, dynamic>> user;
  final String departurePlace;
  final String arrivalPlace;
  final String travelClass;
  final String cargo;
  final List<int> seat;
  final String price;
  final String date;
  final String textReference;
  final String paymentoption;

  SavePassenger({
    super.key,
    required this.user,
    required this.departurePlace,
    required this.arrivalPlace,
    required this.travelClass,
    required this.cargo,
    required this.seat,
    required this.price,
    required this.date,
    required this.textReference,
    required this.paymentoption,

  });

  @override
  SavePassengerState createState() => SavePassengerState();
}

class SavePassengerState extends State<SavePassenger> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _savePassengers();

  }

  Future<void> _savePassengers() async {
    for (int passenger = 0; passenger < widget.user.length; passenger++) {
      await _savePassenger(passenger);
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _savePassenger(int passenger) async {
    final url = Uri.parse('http://192.168.43.243/finalProjectTRain/savePassenger.php');
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'FirstName':widget.user[passenger]["Firstname"],
          'MiddleName': widget.user[passenger]["middlename"],
          'LastName': widget.user[passenger]["Lastname"],
          'Age':21,//int.parse(widget.user[passenger]["Age"]),
          'Sex':widget.user[passenger]["Gender"],
          'DeparturePlace': widget.departurePlace,
          'ArrivalPlace': widget.arrivalPlace,
          'Class': widget.travelClass,
          'Cargo': widget.cargo,
          'Seat': widget.seat[passenger],
          'Phone': widget.user[0]["phone"],
          'Date': widget.date,
          'Price': widget.price,
          'TextReference': widget.textReference,
          'PaymentOption': widget.paymentoption,

        }),
      );

      if (response.statusCode == 200) {
      //  print('Passenger added successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passenger added successfully')),
        );
      } else {
       // print('Failed to add passenger');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add passenger')),
        );
      }
    } catch (e) {
     // print('Error occurred: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error occurred while adding passenger')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Saving Your Info...'),
            InkWell(
              child: const Icon(Icons.home),
              onTap: () {
                Navigator.of(context)
                    .popUntil((route) => route.isFirst);
              },
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : const Text('Thank you for choosing us !'),
      ),
    );
  }
}
