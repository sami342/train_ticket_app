import 'package:book_train_ticket/Screens/schedle_list.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'one_way.dart';

class bookTicket extends StatefulWidget {
  const bookTicket({super.key});

  @override
  State<bookTicket> createState() => _bookTicketState();
}

class _bookTicketState extends State<bookTicket> {
  final TextEditingController _dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String name = "";
  var glowing = false;
  var valueChoose = "1";
  String dropDoownValue = '1';
  int selectedIndex = -1;
  int selectedIndexchild = -1;

  List listitem = ["1", "2", "3", "4", "5"];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
        color: styles.bgColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 48.0, left: 30, right: 30),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              const Text(
                "Here To Get your",
                style: TextStyle(fontSize: 30, color: Colors.black38),
              ),
              const Text(
                "Ticket",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              const Gap(40),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: TextFormField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month),
                      labelText: "Departure date",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      )),
                  validator: (value) {},
                  onTap: (){
                    _selectDate();
                  },
                ),
              ),
              const Gap(30),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                            height: 450,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Passenger Details",
                                    style: styles.headLineStyle2
                                        .copyWith(color: Colors.black),
                                  ),
                                  const Divider(),
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
                                                style: styles.headLineStyle4
                                                    .copyWith(
                                                        color: Colors.black38,
                                                        fontSize: 20),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "12+ years",
                                                  style: styles.headLineStyle4
                                                      .copyWith(
                                                          color:
                                                              Colors.black12),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Wrap(
                                            direction: Axis.horizontal,
                                            children: List.generate(5, (index) {
                                              return InkWell(
                                                onTap: () {
                                                  print("index$index");
                                                  setState(() {
                                                    selectedIndex = index;
                                                  });
                                                },
                                                child: Container(
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        selectedIndex == index
                                                            ? Colors.black
                                                            : Colors.black12,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  margin: const EdgeInsets.only(
                                                      right: 10),
                                                  child: Center(
                                                    child: Text(
                                                      index.toString(),
                                                      style: TextStyle(
                                                        color: selectedIndex ==
                                                                index
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
                                                style: styles.headLineStyle4
                                                    .copyWith(
                                                        color: Colors.black38,
                                                        fontSize: 20),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "2-11 years",
                                                style: styles.headLineStyle4
                                                    .copyWith(
                                                        color: Colors.black12),
                                              ),
                                            ],
                                          ),
                                          const Gap(10),
                                          Wrap(
                                            direction: Axis.horizontal,
                                            children: List.generate(5, (index) {
                                              return InkWell(
                                                onTap: () {
                                                  print("index$index");
                                                  setState(() {
                                                    selectedIndexchild = index;
                                                  });
                                                },
                                                child: Container(
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: selectedIndexchild ==
                                                            index
                                                        ? Colors.black
                                                        : Colors.black12,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  margin: const EdgeInsets.only(
                                                      right: 10),
                                                  child: Center(
                                                    child: Text(
                                                      index.toString(),
                                                      style: TextStyle(
                                                        color:
                                                            selectedIndexchild ==
                                                                    index
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
                                  ElevatedButton(
                                    onPressed: () {
                                    //   print("h");
                                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const oneWay()));
                                     },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black26,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Cofrim",
                                        style: TextStyle(
                                          fontSize: 15,
                                          letterSpacing: 2,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
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
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              const Gap(30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => schedule()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
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
        ));
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}
