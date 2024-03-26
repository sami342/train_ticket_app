
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'one_way.dart';

class BookTicket extends StatefulWidget {
  const BookTicket({super.key});

  @override
  State<BookTicket> createState() => _BookTicketState();
}

class _BookTicketState extends State<BookTicket> {
  final TextEditingController _dateController = TextEditingController();
  String SlectedItem = 'not selected';
  final formKey = GlobalKey<FormState>();
  bool optionWay = false;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: const Icon(
          Icons.keyboard_arrow_left,
          size: 40,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Here To Get your",
                    style: TextStyle(fontSize: 30, color: Colors.black38),
                  ),
                  const Text(
                    "Ticket",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  const Gap(10),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: _dateController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        labelText: "First Name",
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const Gap(20),
                  const SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        labelText: "Middle Name",
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const Gap(30),
                  const SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        labelText: "Last Name",
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const Gap(30),
                  const SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        labelText: "Date Of birth",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.calendar_today),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const Gap(20),
                  const Text(
                    "Gender",
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: RadioMenuButton(
                          value: 'male',
                          groupValue: SlectedItem,
                          onChanged: (SlectedvalueItem) {
                            setState(() {
                              SlectedItem = SlectedvalueItem!;
                            });
                          },
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            elevation: const MaterialStatePropertyAll(2),
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                          ),
                          child: const Text("Male"),
                        ),
                      ),
                      const Gap(20),
                      SizedBox(
                        width: 150,
                        child: RadioMenuButton(
                          value: 'female',
                          groupValue: SlectedItem,
                          onChanged: (SlectedvalueItem) {
                            setState(() {
                              SlectedItem = SlectedvalueItem!;
                            });
                          },
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            elevation: const MaterialStatePropertyAll(5),
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                          ),
                          child: const Text("Female"),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 7,
                    height: 50,
                  ),
                  const Gap(30),
                  const Text(
                    "Contacts",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  const Gap(20),
                  const SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        labelText: "Phone number",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.phone),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const Gap(20),
                  const SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const Gap(15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const oneWay()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Gap(15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
