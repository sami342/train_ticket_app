import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../Database/databse.dart';
import '../Database/my_data.dart';
import '../Database/single_ticket.dart';

class bookTicket extends StatefulWidget {
  const bookTicket({super.key});

  @override
  State<bookTicket> createState() => _bookTicketState();
}

class _bookTicketState extends State<bookTicket> {
  final TextEditingController _dateController = TextEditingController();
  List<MyData> dataList = [];
  final _formKey = GlobalKey<FormState>();
  String name = "";
  bool isVisible = false;
  var glowing = false;
  var valueChoose = "1";
  String dropDoownValue = '1';
  int selectedIndex = -1;
  int selectedIndexchild = -1;
  int numberOfChild = 0;
  int numberOfAdult = 1;
  String? selectedDeparture, selectedArrival;
  late int selecteddate;

  late DateTime dateTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48.0, left: 30, right: 30),
            child: Column(
              children: [
                const Text(
                  "Here To Get your Ticket",
                  style: TextStyle(fontSize: 30, color: Colors.black38),
                ),
                const Gap(40),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: TextFormField(
                      controller: _dateController,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.calendar_month),
                          labelText: "Departure date",
                          labelStyle: TextStyle(
                            color: Colors.black,
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          // Check if value is null or empty
                          return "Departure Date is required";
                        } else {
                          return null;
                        }
                      },
                      onTap: () {
                        _selectDate();
                      },
                    ),
                  ),
                ),
                const Gap(20),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: "Departure",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      value: selectedDeparture,
                      // You need to maintain the selected value state
                      onChanged: (newValue) {
                        // Update the selected value state when an option is selected
                        setState(() {
                          selectedDeparture = newValue;
                        });
                      },
                      items: <String>[
                        'Adiss Abeba',
                        'Dire Dawa',
                        'Adama',
                        'Bishoftu',
                        'Messo',
                        'Mojo',
                        'Bika'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: "Arrival",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      value: selectedArrival,
                      // You need to maintain the selected value state
                      onChanged: (newValue) {
                        // Update the selected value state when an option is selected
                        setState(() {
                          selectedArrival = newValue;
                        });
                      },
                      items: <String>[
                        'Adiss Abeba',
                        'Dire Dawa',
                        'Adama',
                        'Bishoftu',
                        'Messo',
                        'Mojo',
                        'Bika'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const Gap(20),
                ElevatedButton(
                  onPressed: () {
                    _showPassengerBottomSheet(context);
                    setState(() {
                      isVisible = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Passengers",
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.black,
                          ),
                        ),
                        Text("1"),
                      ],
                    ),
                  ),
                ),
                const Gap(20),
                ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    } else {
                      if (selectedIndexchild == -1 || selectedIndex == -1) {
                        selectedIndex = 0;
                        selectedIndexchild = 0;
                      }
                      if (selectedDeparture != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SingleTicket(
                                    selectedDay: selecteddate,
                                    numberOfAdult: numberOfAdult,
                                    numberOfChild: numberOfChild,
                                    dateTime: dateTime,
                                    ArrivalPlace: selectedArrival!,
                                    departurePlace: selectedDeparture!,
                                  )),
                        );
                      } else if (selectedDeparture == null ||
                          selectedArrival == null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyApp(
                              selectedDay: selecteddate,
                              numberOfAdult: numberOfAdult,
                              numberofChild: numberOfChild,
                              dateTime: dateTime,
                            ),
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                    "Find Ticket",
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// Method to show bottom sheet
  void _showPassengerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Select number of passengers",
                      style: styles.headLineStyle4
                          .copyWith(color: Colors.black, fontSize: 22),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      // Adult selection
                      Column(
                        children: [
                          Text(
                            "Adult",
                            style: styles.headLineStyle4
                                .copyWith(color: Colors.black, fontSize: 20),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            ">12",
                            style: styles.headLineStyle4
                                .copyWith(color: Colors.black38, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                  numberOfAdult = index + 1;
                                });
                              },
                              child: Container(
                                width: 50,
                                decoration: BoxDecoration(
                                  color: selectedIndex == index
                                      ? Colors.blueGrey
                                      : Colors.black12,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: const EdgeInsets.only(right: 10),
                                child: Center(
                                  child: Text(
                                    (index + 1).toString(),
                                    style: TextStyle(
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Text(
                            "Child",
                            style: styles.headLineStyle4
                                .copyWith(color: Colors.black, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Age <=12 ",
                            style: styles.headLineStyle4
                                .copyWith(color: Colors.black38, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _getChildItemCount(numberOfAdult),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndexchild = index;
                                  numberOfChild = index + 1;
                                });
                              },
                              child: Container(
                                width: 50,
                                decoration: BoxDecoration(
                                  color: selectedIndexchild == index
                                      ? Colors.blueGrey
                                      : Colors.black12,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: const EdgeInsets.only(right: 10),
                                child: Center(
                                  child: Text(
                                    (index + 1).toString(),
                                    style: TextStyle(
                                      color: selectedIndexchild == index
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  int _getChildItemCount(int numberOfAdults) {
    if (numberOfAdults > 6) {
      return 1;
    } else if (numberOfAdults >= 4 && numberOfAdults <= 6) {
      return 3;
    } else {
      return 5;
    }
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        int day = picked.day;
        int month = picked.month;
        int year = picked.year;

        int currentday = DateTime.now().day;
        int currentmonth = DateTime.now().month;
        int currentyear = DateTime.now().year;

        if (currentyear != year) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Year Mismatch'),
                content: const Text(
                    'please select the current year and current month'),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        } else if (currentyear == year && month == currentmonth) {
          selecteddate = day - currentday;
        }
        setState(() {
          dateTime = picked;
          _dateController.text = picked.toString().split(" ")[0];
        });
      });
    }
  }


}
