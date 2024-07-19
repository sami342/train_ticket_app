import 'package:book_train_ticket/Database/city_abrivation.dart';
import 'package:book_train_ticket/Screens/see_ticket_details.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../Database/readFirebase.dart';
import '../utils/shared_preference.dart';
import '../widget/ticket_container.dart';

class MyTrip extends StatefulWidget {
  MyTrip({
    Key? key,
  }) : super(key: key);

  @override
  MyTripState createState() => MyTripState();
}

class MyTripState extends State<MyTrip> with SingleTickerProviderStateMixin {
  List<String>? _documentIds;
  final List<User?> _pastTrips = [];
  final List<User?> _upcomingTrips = [];
  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    fetchDataForTrip();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> fetchDataForTrip() async {
    List<String>? documentIds = await BookingStorage()
        .getPassengerDocumentIdsFromPrefs();

    if (documentIds != null && documentIds.isNotEmpty) {
      setState(() {
        _documentIds = documentIds;
      });

      print('this is -----------${_documentIds}');

      Set<String> processedReferences = Set<
          String>(); // To track processed references

      for (String docId in documentIds) {
        if (processedReferences.contains(docId))
          continue; // Skip if already processed

        User? user = await getUserData(docId);

        if (user != null) {
          if (user.date != null) {
            if (user.date!.isBefore(DateTime.now())) {
              _pastTrips.add(user);
            } else {
              _upcomingTrips.add(user);
            }
          }
        } else {
          print("Error fetching data for docId: $docId");
        }
      }

      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('No passenger Ticket History found.'),
      ));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styles.bgColor,
      appBar: AppBar(
        title: const Text('My Trip'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Past Trips'),
            Tab(text: 'Upcoming Trips'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Widget for the "Past Trips" tab
          _buildTripList(_pastTrips),
          // Widget for the "Upcoming Trips" tab
          _buildTripList(_upcomingTrips),
        ],
      ),
    );
  }

  Widget _buildTripList(List<User?> trips) {
    return trips.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
      itemCount: trips.length,
      itemBuilder: (context, index) {
        User? user = trips[index];
        if (user == null) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.all(14.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeeTicketDetail(user: user),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(left: 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0XFF526799),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      border: Border(bottom: BorderSide(color: Colors.white)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '${user.firstName.toUpperCase()} ${user.lastName
                                  .toUpperCase()}',
                              style: styles.headLineStyle3
                                  .copyWith(color: Colors.white)),

                          // Adjust spacing between icon and text

                          // Left arrow icon
                        ],
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                        const Text(
                        "Ticket",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const Gap(180),
                      user.BookReference.isEmpty
                          ? Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape
                              .circle, // Makes the container circular
                        ),
                        padding: const EdgeInsets.all(8.0),

                        child: const Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 24.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        ),
                      ): Text(
                    user.BookReference,
                    style: const TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    ),
                  ),

                ],
              ),
              ],
            ),
            // Add any additional widgets or content here
            ],
          ),
        ),

        ),

        Container(
        decoration: const BoxDecoration(
        color: Color(0XFF526799),
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(0),
        ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
        children: [
        // Blue part of the ticket
        Row(
        children: [
        Text(
        CityAbbreviation.getAbbreviation(
        user.Departure),
        style: styles.headLineStyle3
            .copyWith(color: Colors.white),
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
        BoxConstraints
        constraints) {
        return Flex(
        direction: Axis.horizontal,
        mainAxisAlignment:
        MainAxisAlignment
            .spaceBetween,
        children: List.generate(
        (constraints.constrainWidth() /
        6)
            .floor(),
        (index) => const SizedBox(
        width: 3,
        height: 1,
        child: DecoratedBox(
        decoration: BoxDecoration(
        color: Colors.white,
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
        color: Colors.white,
        ),
        ),
        ],
        ),
        ),
        const TicketContainer(),
        Expanded(child: Container()),
        Text(
        CityAbbreviation.getAbbreviation(
        user.Arrival),
        style: styles.headLineStyle3
            .copyWith(color: Colors.white),
        ),
        ],
        ),
        const Gap(3),
        Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
        SizedBox(
        width: 100,
        child: Text(
        user.Departure,
        style: styles.headLineStyle4
            .copyWith(color: Colors.grey),
        ),
        ),
        const Icon(Icons.double_arrow,
        color: Colors.white),
        SizedBox(
        width: 100,
        child: Text(
        user.Arrival,
        textAlign: TextAlign.end,
        style: styles.headLineStyle4
            .copyWith(color: Colors.grey),
        ),
        ),
        ],
        ),
        ],
        ),
        ),
        // Yellow part of the tickets
        Container(
        color: Colors.white,
        child: Row(
        children: [
        const SizedBox(
        height: 20,
        width: 10,
        child: DecoratedBox(
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
        ),
        ),
        ),
        ),
        Expanded(
        child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: LayoutBuilder(
        builder: (BuildContext context,
        BoxConstraints constraints) {
        return Flex(
        direction: Axis.horizontal,
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: List.generate(
        (constraints.constrainWidth() / 15)
            .floor(),
        (index) => const SizedBox(
        width: 5,
        height: 1,
        child: DecoratedBox(
        decoration: BoxDecoration(
        color: Colors.white,
        ),
        ),
        ),
        ),
        );
        },
        ),
        ),
        ),
        const SizedBox(
        height: 20,
        width: 10,
        child: DecoratedBox(
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        ),
        ),
        ),
        ),
        ],
        ),
        ),
        // Bottom part of the orang section
        Container(
        decoration: const BoxDecoration(
        color: Colors.white,

        ),
        padding: const EdgeInsets.only(
        left: 16, top: 10, right: 16, bottom: 16),
        child: Column(
        children: [
        Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
        Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
        Text(
        DateFormat('MMM-dd yyyy').format(user.date!),
        style: styles.headLineStyle3.copyWith(color: Colors.black),
        ),
        const Gap(5),
        Text(
        "Date",
        style: styles.headLineStyle3
            .copyWith(color: Colors.grey),
        )
        ],
        ),
        Column(
        crossAxisAlignment:
        CrossAxisAlignment.center,
        children: [
        Text(
        user.cargo,
        style: styles.headLineStyle3
            .copyWith(color: Colors.black),
        ),
        const Gap(5),
        Text(
        "cargo",
        style: styles.headLineStyle3
            .copyWith(color: Colors.grey),
        ),
        ],
        ),
        Column(
        crossAxisAlignment:
        CrossAxisAlignment.end,
        children: [
        Text(
        '${user.seat}',
        style: styles.headLineStyle3
            .copyWith(color: Colors.black),
        ),
        const Gap(5),
        Text(
        "Seat",
        style: styles.headLineStyle3
            .copyWith(color: Colors.grey),
        ),
        ],
        ),
        ],
        ),
        ],
        ),
        ),
        Container(
        decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
        ),
        border: Border(top: BorderSide(color: Colors.black)),
        ),
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(

        children: [
        Text("See Details", style: styles.headLineStyle3
            .copyWith(color: Colors.black),),
        const Gap(15),
        // Add any additional widgets or content here
        const Icon(Icons.keyboard_arrow_right)
        ],
        ),
        ),

        ),
        ],
        ),
        ),
        )
        ,

        );
      },
    );
  }
}
