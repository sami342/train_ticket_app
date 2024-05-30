import 'package:book_train_ticket/Database/my_ticket.dart';
import 'package:book_train_ticket/Screens/passenger_conirm.dart';
import 'package:book_train_ticket/utils/app_info_list.dart';
import 'package:book_train_ticket/utils/app_layout.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:book_train_ticket/widget/ticket_container.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Tickets extends StatefulWidget {
  final List<MyTicketGenerte> datalist;

  const Tickets(
      {super.key,
        required this.datalist,});

  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  int numberOFchildandAdult = 0;
  bool isvisibel = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: styles.bgColor,
      appBar: AppBar(
        title: const Text('Tickets'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Row(
            children: [
              const Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Reference number',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.1),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isvisibel = !isvisibel;
                    });
                  },
                  child: const Text('Find'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Text(
                          "AA",
                          style: styles.headLineStyle3
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      Expanded(child: Container()),
                      const TicketContainer(),
                      Expanded(
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 24,
                              child: LayoutBuilder(builder:
                                  (BuildContext context,
                                      BoxConstraints constraints) {
                                return Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    (constraints.constrainWidth() / 6).floor(),
                                    (index) => const SizedBox(
                                      width: 3,
                                      height: 1,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            const Center(
                              child: Icon(
                                Icons.train,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const TicketContainer(),
                      Expanded(child: Container()),
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Text(
                          "DD",
                          style: styles.headLineStyle3
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.3,
                        child: Text(
                          "Adiss Abeba",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                      Text(
                        "11H 30M ",
                        style:
                            styles.headLineStyle4.copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        width: screenWidth * 0.3,
                        child: Text(
                          " Dire Dawa",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Text(
                          " Date",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      Text(
                        "Departure",
                        style:
                            styles.headLineStyle4.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Text(
                          "Seat",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Text(
                          " May 24",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                      Text(
                        "7:30 AM",
                        style:
                            styles.headLineStyle4.copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Text(
                          "21",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.3,
                        child: Text(
                          " Passengers",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Text(
                          " Status",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.black38),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Text(
                          "booked",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.lightGreen),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.5,
                        child: Text(
                          " Ticket Reference",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.black38),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Text(
                          "536428231",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Text(
                          " First Name",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.black38),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Text(
                          "samuel",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Text(
                          " Last Name",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Text(
                          "Kebede",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Text(
                          " Price",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.black38),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Text(
                          "750ETB",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.5,
                        child: Text(
                          " Payment Method",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.black38),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Text(
                          "Chapa",
                          style:
                              styles.headLineStyle4.copyWith(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Visibility(
            visible: isvisibel,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    "Other passengers",
                    style: styles.headLineStyle3.copyWith(color: Colors.black),
                  )),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "First Name",
                          style: styles.headLineStyle3
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          "Last Name",
                          style: styles.headLineStyle3
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          "Type",
                          style: styles.headLineStyle3
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  // Expanded should not be used here
                  ListView.builder(
                    shrinkWrap: true,
                    // Ensure that it doesn't take more space than needed
                    itemCount: passengers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              passengers[index]['name'],
                              style: styles.headLineStyle4
                                  .copyWith(color: Colors.grey),
                            ),
                            Text(
                              passengers[index]['age'],
                              style: styles.headLineStyle4
                                  .copyWith(color: Colors.grey),
                            ),
                            Text(
                              passengers[index]['age'],
                              style: styles.headLineStyle4
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
