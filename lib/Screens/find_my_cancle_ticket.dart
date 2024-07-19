import 'package:book_train_ticket/Database/city_abrivation.dart';
import 'package:flutter/material.dart';
import 'package:book_train_ticket/utils/app_style.dart';

import '../Database/delete_passenger.dart';
import '../Database/passenger.dart';
import '../widget/ticket_container.dart';

class cancelMyTicket extends StatefulWidget {
  List<Passenger> dataList;
  final String phoneNumber;
  final String reference;
   cancelMyTicket({super.key,required this.dataList, required this.reference,required this.phoneNumber});

  @override
  State<cancelMyTicket> createState() => _cancelTicketState();
}

class _cancelTicketState extends State<cancelMyTicket> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Center(child: Text("Cancel Ticket")),
            InkWell(
              child: const Icon(Icons.home),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Cancel Booking?'),
                      content: const Text(
                          'Are you sure you want to cancel the booking?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                            // Navigate to the first screen
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey, // Border color
                  width: 2.0, // Border width
                ),
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
                            CityAbbreviation.getAbbreviation(
                                widget.dataList[0].DeparturePlace),
                            style: styles.headLineStyle3.copyWith(color: Colors.black),
                          ),
                        ),
                        Expanded(child: Container()),
                        const TicketContainer(),
                        Expanded(
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 24,
                                child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                                  return Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            style: styles.headLineStyle3.copyWith(color: Colors.black),
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
                            style: styles.headLineStyle4.copyWith(color: Colors.black),
                          ),
                        ),
                        Text(
                          "11H 30M ",
                          style: styles.headLineStyle4.copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          width: screenWidth * 0.3,
                          child: Text(
                            widget.dataList[0].ArivalPlace,
                            style: styles.headLineStyle4.copyWith(color: Colors.black),
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
                            style: styles.headLineStyle4.copyWith(color: Colors.black),
                          ),
                        ),
                        Text(
                          "Cargo",
                          style: styles.headLineStyle4.copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          width: screenWidth * 0.2,
                          child: Text(
                            "Seat",
                            style: styles.headLineStyle4.copyWith(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.25,
                          child: Text(
                            widget.dataList[0].Date,
                            style: styles.headLineStyle4.copyWith(color: Colors.black),
                          ),
                        ),
                        Text(
                          widget.dataList[0].Cargo,
                          style: styles.headLineStyle4.copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          width: screenWidth * 0.25,
                          child: Text(
                            widget.dataList[0].Seat,
                            style: styles.headLineStyle4.copyWith(color: Colors.black),
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
                            " Class",
                            style: styles.headLineStyle4
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.2,
                          child: Text(
                            widget.dataList[0].Class,
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
                          width:screenWidth * 0.2,
                          child: Text(
                            " Status",
                            style:styles.headLineStyle4
                                .copyWith(color: Colors.black),
                          ),
                        ),

                        SizedBox(
                          width:screenWidth * 0.2,
                          child: Text(
                            "booked",
                            style:styles.headLineStyle4
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
                          width:screenWidth * 0.5,
                          child: Text(
                            " Price",
                            style:styles.headLineStyle4
                                .copyWith(color: Colors.black),
                          ),
                        ),

                        SizedBox(
                          width:screenWidth * 0.2,
                          child: Text(
                            '${widget.dataList[0].Price} ETB',
                            style:styles.headLineStyle4
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
                          width:screenWidth * 0.5,
                          child: Text(
                            " Ticket Reference",
                            style:styles.headLineStyle4
                                .copyWith(color: Colors.black),
                          ),
                        ),

                        SizedBox(
                          width:screenWidth * 0.25,
                          child: Text(
                            widget.dataList[0].TextReference,
                            style:styles.headLineStyle4
                                .copyWith(color: Colors.black),
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
                          width:screenWidth * 0.2,
                          child: Text(
                            " First Name",
                            style:styles.headLineStyle4
                                .copyWith(color: Colors.black),
                          ),
                        ),

                        SizedBox(
                          width:screenWidth * 0.2,
                          child: Text(
                            widget.dataList[0].FirstName,
                            style:styles.headLineStyle4
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
                          width:screenWidth * 0.3,
                          child: Text(
                            " Middle Name",
                            style:styles.headLineStyle4
                                .copyWith(color: Colors.black),
                          ),
                        ),

                        SizedBox(
                          width:screenWidth * 0.2,
                          child: Text(
                            widget.dataList[0].MiddleName,
                            style:styles.headLineStyle4
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
                          width:screenWidth * 0.2,
                          child: Text(
                            " Last Name",
                            style:styles.headLineStyle4
                                .copyWith(color: Colors.black),
                          ),
                        ),

                        SizedBox(
                          width:screenWidth * 0.2,
                          child: Text(
                            widget.dataList[0].LastName,
                            style:styles.headLineStyle4
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Divider(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width:screenWidth * 0.5,
                          child: Text(
                            " Payment Method",
                            style:styles.headLineStyle4
                                .copyWith(color: Colors.black),
                          ),
                        ),

                        SizedBox(
                          width:screenWidth * 0.2,
                          child: Text(
                            "Chapa",
                            style:styles.headLineStyle4
                                .copyWith(color: Colors.red),
                          ),
                        ),
                      ],
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
                  setState(() {
                    cancelMyTicketnow();
                  }
                  );
                },
                child: const Text('Cancle Ticket'),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void cancelTicket() {
    // Implement your logic for canceling the booked ticket here
  //  print('Cancelled ticket with reference number: ');
    // Show a confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ticket Cancelled'),
          content: const Text('Ticket with reference number has been cancelled.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void cancelMyTicketnow() {
    // Implement your logic for canceling the booked ticket here
    //print('Cancelled ticket with reference number: ');
    // Show a confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Cancellation'),
          content: const Text(
              'Do you want to cancel this ticket?\n\nEvery Ticket cancel steps with the company Term and Rule'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DeletePassenger(ticketReference:widget.reference, phoneNumber: widget.phoneNumber,Firstname: widget.dataList[0].FirstName,),
                  ),
                );
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

}
