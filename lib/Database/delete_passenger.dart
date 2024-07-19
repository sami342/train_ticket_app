import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Screens/bottom_dar.dart';

class DeletePassenger extends StatefulWidget {
  final String ticketReference;
  final String phoneNumber;
  final String Firstname;

  const DeletePassenger({
    Key? key,
    required this.ticketReference,
    required this.phoneNumber,
    required this.Firstname,
  }) : super(key: key);

  @override
  State<DeletePassenger> createState() => _DeletePassengerState();
}

class _DeletePassengerState extends State<DeletePassenger> {
  String _message = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    deletePassenger();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomBar(),
                    ),
                  );// Navigate back to the previous screen
                },
                child: Text(_message),
              ),
      ),
    );
  }

  Future<void> deletePassenger() async {
    final response = await http.post(
      Uri.parse(
          'http://192.168.43.243/finalProjectTRain/cancel.php?ticket_reference=${widget.ticketReference}&phone_number=${widget.phoneNumber}&first_name=${widget.Firstname}'),
    );

    setState(() {
      _isLoading = false;

      if (response.statusCode == 200) {
        _message = 'Successfully canceled your ticket.';
      } else {
        _message = 'Failed to cancel your ticket. Please try again.';
      }
    });
  }
}
