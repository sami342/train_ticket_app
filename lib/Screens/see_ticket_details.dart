import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../Database/readFirebase.dart';
import '../Screens/see_ticket_details_appBar.dart';

class SeeTicketDetail extends StatefulWidget {
  final User user;

  const SeeTicketDetail({Key? key, required this.user}) : super(key: key);

  @override
  _SeeTicketDetailState createState() => _SeeTicketDetailState();
}

class _SeeTicketDetailState extends State<SeeTicketDetail> {
  @override
  void initState() {
    super.initState();
    // Initialize state if needed
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SeeTicketDetailAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Ticket", style: styles.headLineStyle2),
                      Text(
                        widget.user.BookReference,
                        style: styles.headLineStyle3
                            .copyWith(color: Colors.red),
                      ),
                      Text(
                        widget.user.newdate,
                        style: styles.headLineStyle4
                            .copyWith(color: Colors.lightGreen),
                      ),
                    ],
                  ),
                  const Divider(),
                  const Gap(10),
                  Text("Ticket Details", style: styles.headLineStyle2),
                  const Divider(),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width:screenWidth*0.4,
                        child: Text("Departure Place"
                          ,style:
                              styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),

                      SizedBox(
                        width:screenWidth*0.3,
                        child: Text(widget.user.Departure,
                            style: styles.headLineStyle3
                                .copyWith(color: Colors.grey)),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width:screenWidth*0.4,
                        child: Text(
                          "Arrival Place",
                          style:
                              styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width:screenWidth*0.2,
                        child: Text(
                          widget.user.Arrival,
                          style:
                              styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width:screenWidth*0.4,
                        child: Text(
                          "Departure Time",
                          style:
                              styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width:screenWidth*0.2,
                        child: Text(
                          "7:30 AM",
                          style:
                              styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width:screenWidth*0.4,
                        child: Text(
                          "Arrival Time",
                          style:
                              styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width:screenWidth*0.2,
                        child: Text(
                          "6:30 PM",
                          style:
                              styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width:screenWidth*0.4,
                        child: Text(
                          "Departure Date",
                          style:
                              styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width:screenWidth*0.27,
                        child: Text(
                          DateFormat('MMM-dd yyyy').format(widget.user.date!),
                          style:
                              styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),


                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width:screenWidth*0.4,
                        child: Text(
                          "Class",
                          style:
                              styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width:screenWidth*0.2,
                        child: Text(
                          "noraml",
                          style:
                              styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width:screenWidth*0.4,
                        child: Text(
                          "Booking Number",
                          style:
                              styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width:screenWidth*0.2,
                        child: Text(
                          widget.user.bookReference,
                          style:
                              styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  const Divider(),
                  Text("Passenger Info", style: styles.headLineStyle2),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width:screenWidth*0.4,
                        child: Text(
                          "First Name",
                          style:
                          styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width:screenWidth*0.2,
                        child: Text(
                            widget.user.firstName.toUpperCase(),
                          style:
                          styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width:screenWidth*0.4,
                        child: Text(
                          "Middle Name",
                          style:
                          styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width:screenWidth*0.2,
                        child: Text(
                          widget.user.middleName.toUpperCase(),
                          style:
                          styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width:screenWidth*0.4,
                        child: Text(
                          "Last Name",
                          style:
                          styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width:screenWidth*0.2,
                        child: Text(
                          widget.user.lastName.toUpperCase(),
                          style:
                          styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width:screenWidth*0.4,
                        child: Text(
                          "Gender",
                          style:
                          styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width:screenWidth*0.2,
                        child: Text(
                          widget.user.gender,
                          style:
                          styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width:screenWidth*0.4,
                        child: Text(
                          "Age",
                          style:
                          styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width:screenWidth*0.2,
                        child: Text(
                         ' ${widget.user.dateOfBirth}',
                          style:
                          styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width:screenWidth*0.4,
                        child: Text(
                          "Phone",
                          style:
                          styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width:screenWidth*0.3,
                        child: Text(
                          ' ${widget.user.phoneNumber}',
                          style:
                          styles.headLineStyle3.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),

                  const Divider(),
                  Text("Price Details", style: styles.headLineStyle2),
                  const Divider(),
                  const Gap(20),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Payment Option",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                      Text(
                        widget.user.paymentOption,
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Status",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                      Text(
                        widget.user.status,
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.green),
                      ),
                      Text(
                        '${widget.user.price} ETB',
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.green),
                      ),
                    ],
                  ),
                  const Gap(50),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
