import 'package:book_train_ticket/Screens/single_ticket_find.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../Database/databasefind.dart';
import '../Database/databse.dart';
import '../Database/my_data.dart';

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
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
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
                        'Meso',
                        'Mojo',
                        'Pika'
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
                        'Meso',
                        'Mojo',
                        'Pika'
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
                    setState(() {
                      isVisible = !isVisible;
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
                Visibility(
                  visible: isVisible,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Select number of passengers",
                            style: styles.headLineStyle4
                                .copyWith(color: Colors.black38),
                          ),
                        ),
                        const Gap(20),
                        Column(
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Adult",
                                      style: styles.headLineStyle4.copyWith(
                                          color: Colors.black38, fontSize: 20),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "12+ years",
                                        style: styles.headLineStyle4
                                            .copyWith(color: Colors.black12),
                                      ),
                                    ],
                                  ),
                                ),
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: List.generate(5, (index) {
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
                                                  : Colors.white,
                                              fontSize: 25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                            const Gap(20),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Child",
                                      style: styles.headLineStyle4.copyWith(
                                          color: Colors.black38, fontSize: 20),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "2-11 years",
                                      style: styles.headLineStyle4
                                          .copyWith(color: Colors.black12),
                                    ),
                                  ],
                                ),
                                const Gap(10),
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: List.generate(5, (index) {
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
                                                  : Colors.white,
                                              fontSize: 25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                            const Gap(25),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(10),
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => SingleTicketFind(
                        //       tickets: dataList,
                        //       departurePlace:selectedDeparture ?? "",
                        //       arrivalPlace: selectedArrival ?? "",
                        //       departuredate: _dateController.text,
                        //       numberOfAdult: numberOfAdult,
                        //       numberOfChild: numberOfChild,
                        //     ),
                        //   ),
                        // );
                        print(_dateController.text);
                      }

                      else if (selectedDeparture == null ||
                          selectedArrival == null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyApp(
                              selectedDay: selecteddate,
                              numberOfAdult: numberOfAdult,
                              numberofChild: numberOfChild,
                              dateTime:dateTime,
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
                content: const Text('please select the current year and current month'),
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
        }
        else if(currentyear==year && month==currentmonth){
          selecteddate=day-currentday;
        }
        dateTime=picked;
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }


  Future<void> fetchData() async {
    try {
      List<MyData> data = await DatabaseHelper.fetchData();
      setState(() {
        dataList = data;
      });
    } catch (e) {
      // Handle error
      print('Error fetching data: $e');
    }
  }
}
