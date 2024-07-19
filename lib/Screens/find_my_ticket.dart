import 'package:book_train_ticket/Database/ticket_generate.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../Database/family_ticket_Generate_API.dart';

class FindMyTicket extends StatefulWidget {
  const FindMyTicket({super.key});

  @override
  State<FindMyTicket> createState() => _FindMyTicketState();
}

class _FindMyTicketState extends State<FindMyTicket> {
  final TextEditingController _referenceController = TextEditingController();
  // final TextEditingController _phonetextfieldcontroller =
  //     TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
  //  double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: styles.bgColor,
      appBar: AppBar(
        title: const Text("Tickets"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white), // Border color
                borderRadius: BorderRadius.circular(8), // Border radius
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectedIndex == 0 ? Colors.blue : Colors.grey,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      'Single Ticket',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectedIndex == 1 ? Colors.blue : Colors.grey,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      'Family Tickets',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white), // Border color
                borderRadius: BorderRadius.circular(8), // Border radius
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: _referenceController,
                        decoration: const InputDecoration(
                          labelText: 'Reference number',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 20.0, // Set your desired font size here
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyTicketApp(
                              ticketReference: _referenceController.text),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FamilyTicketGenerateAPI(
                              ticketReference: _referenceController.text),
                        ),
                      );
                    }
                  },
                  child: const Text('Find'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
