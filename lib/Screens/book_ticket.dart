import 'package:book_train_ticket/Screens/schedle_list.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class bookTicket extends StatefulWidget {
  const bookTicket({super.key});

  @override
  State<bookTicket> createState() => _bookTicketState();
}

class _bookTicketState extends State<bookTicket> {
  final TextEditingController _dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String name = "";
  bool isVisible = false;
  var glowing = false;
  var valueChoose = "1";
  String dropDoownValue = '1';
  int selectedIndex = -1;
  int selectedIndexchild = -1;



  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return ListView(
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
                  onTap: () {
                    _selectDate();
                  },
                ),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 170,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.location_on),
                            labelText: "Departure",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            )),
                        validator: (value) {},
                        onTap: () {},
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 170,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.location_on),
                            labelText: "Arrival",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            )),
                        validator: (value) {},
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
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
                child:  Padding(
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
                                        color: Colors.black38,
                                        fontSize: 20),
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
                                          .copyWith(
                                          color: Colors.black12),
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
                                      });
                                    },
                                    child: Container(
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: selectedIndex == index
                                            ? Colors.black
                                            : Colors.black12,
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                      margin: const EdgeInsets.only(
                                          right: 10),
                                      child: Center(
                                        child: Text(
                                          (index+1).toString(),
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
                                      });
                                    },
                                    child: Container(
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: selectedIndexchild == index
                                            ? Colors.black
                                            : Colors.black12,
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                      margin: const EdgeInsets.only(
                                          right: 10),
                                      child: Center(
                                        child: Text(
                                          (index+1).toString(),
                                          style: TextStyle(
                                            color: selectedIndexchild ==
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
                    ],
                  ),
                ),
              ),
              const Gap(10),
              ElevatedButton(
                onPressed: () {
                  if(selectedIndexchild==-1||selectedIndex==-1){
                    selectedIndex=0;
                    selectedIndexchild=0;
                  }
                  else if(selectedIndexchild!=-1||selectedIndex!=-1){

                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const schedule()));
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
    );
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
