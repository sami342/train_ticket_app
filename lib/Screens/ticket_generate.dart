
import 'package:book_train_ticket/utils/app_info_list.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:book_train_ticket/widget/ticket_container.dart';
import 'package:flutter/material.dart';

import '../Database/city_abrivation.dart';
import '../Database/passenger.dart';

class Tickets extends StatefulWidget {

  List<Passenger> dataList;
   Tickets(
      {super.key,required this.dataList});

  @override
  TicketsState createState() => TicketsState();
}

class TicketsState extends State<Tickets> {
  int numberOFchildandAdult = 0;
  bool isvisibel = false;


  @override
  void initState() {
    super.initState();
    // Ensure the date is valid before parsing
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: styles.bgColor,
      appBar: AppBar(
        title: const Center(child: Text('Tickets')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
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
                        width: screenWidth * 0.1,
                        child: Text(
                          CityAbbreviation.getAbbreviation(
                              widget.dataList[0].DeparturePlace),
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
                            CityAbbreviation.getAbbreviation(
                                widget.dataList[0].ArivalPlace),
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
                          widget.dataList[0].DeparturePlace,
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.grey),
                        ),
                      ),

                      SizedBox(
                        width: screenWidth * 0.3,
                        child: Text(
                          widget.dataList[0].ArivalPlace,
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
                        "Price",
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
                        child: Text("May",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                      Text(
                       ' ${widget.dataList[0].Price}ETB',
                        style:
                            styles.headLineStyle4.copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Text(
                          widget.dataList[0].Seat,
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
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
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Text(
                          "1",
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
                        width: screenWidth * 0.4,
                        child: Text(
                          " Ticket Reference",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.black38),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.25,
                        child: Text(
                          widget.dataList[0].TextReference,
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
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
                          widget.dataList[0].FirstName,
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
                            widget.dataList[0].LastName,
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
                          " Class",
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.black38),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Text(
                           widget.dataList[0].Class,
                          style: styles.headLineStyle4
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
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
                    padding: const EdgeInsets.all(8.0),
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
                        padding: const EdgeInsets.symmetric(
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
