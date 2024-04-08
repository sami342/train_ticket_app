import 'package:flutter/material.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:gap/gap.dart';
import '../utils/app_info_list.dart';
import '../widget/ticket_container.dart';

import 'book_ticket.dart';
import 'other_passengers.dart';

class schedule extends StatefulWidget {
  const schedule({super.key});

  @override
  State<schedule> createState() => _scheduleState();
}

class _scheduleState extends State<schedule> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Find your ticket here",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.transparent,
          bottom:  const TabBar(
            isScrollable: true,
            indicatorColor: Colors.blue,
            labelPadding: EdgeInsets.symmetric(horizontal: 30),
            tabs: [
              Tab(
                child: Column(
                  children: [
                    Text("Monday"),
                    Text("1 Jan"),
                  ],
                ),
              ),
              Tab(
                child: Text("Tuesday\n 2 Jan"),
              ),
              Tab(
                child: Text("wednesday\n 3 Jan"),
              ),
              Tab(
                child: Text("Thursday\n 4 Jan"),
              ),
              Tab(
                child: Text("Friday\n 5 Jan"),
              ),
              Tab(
                child: Text("Saturday\n 6 Jan"),
              ),
              Tab(
                child: Text("Sunday\n 7 Jan"),
              ),
            ],
          ),
        ),
        body: Container(
          color: Colors.grey,
          child: TabBarView(
            children: [
              ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 21,
                  itemBuilder: (ctx, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ExpansionTile(
                        title: ListTile(
                          title: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    SchduleList[index]['from']['code'],
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                  Expanded(child: Container()),
                                  const TicketContainer(),
                                  Expanded(
                                    child: Stack(children: [
                                      SizedBox(
                                        height: 24,
                                        child: LayoutBuilder(builder:
                                            (BuildContext context,
                                            BoxConstraints constrainsts) {
                                          return Flex(
                                            direction: Axis.horizontal,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                              (constrainsts.constrainWidth() /
                                                  6)
                                                  .floor(),
                                                  (index) => const SizedBox(
                                                width: 3,
                                                height: 1,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey,
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
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  const TicketContainer(),
                                  Expanded(child: Container()),
                                  Text(
                                    SchduleList[index]['to']['code'],
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                              const Gap(3),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(SchduleList[index]['from']['name']),
                                  Text('${SchduleList[index]['price']}ETB'),
                                  Text(SchduleList[index]['to']['name']),
                                ],
                              ),
                              const Gap(15),
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    SchduleList[index]['time'],
                                    style: styles.headLineStyle4
                                        .copyWith(color: Colors.black12),
                                  ),
                                  Text(
                                    SchduleList[index]['departure-time'],
                                    style: styles.headLineStyle4
                                        .copyWith(color: Colors.black12),
                                  ),
                                ],
                              ),
                              const Gap(2),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Time",
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                  Text(
                                    "Destination time",
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        childrenPadding: const EdgeInsets.only(left: 10),
                        children: [
                          const Center(
                              child: Text("VIP Cargo",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500))),
                          const Divider(),
                          const SizedBox(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " Rfund Fee",
                                    ),
                                    Gap(180),
                                    Text(
                                      " 300ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Change Fee",
                                    ),
                                    Gap(170),
                                    Text(
                                      " 200ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Number of item",
                                    ),
                                    Gap(140),
                                    Text(
                                      " 3 X new ",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " 3 new thing",
                                    ),
                                    Gap(160),
                                    Text(
                                      " 3 new thing",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const bookTicket()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50),
                                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                "Select",
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                          const Center(
                            child: Text(
                              "Normal Cargo",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Divider(),
                          const SizedBox(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " Rfund Fee",
                                    ),
                                    Gap(180),
                                    Text(
                                      " 300ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Change Fee",
                                    ),
                                    Gap(170),
                                    Text(
                                      " 200ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Number of item",
                                    ),
                                    Gap(140),
                                    Text(
                                      " 3 X new ",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " 3 new thing",
                                    ),
                                    Gap(160),
                                    Text(
                                      " 3 new thing",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const bookTicket()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50),
                                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                "Select",
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                        ],
                      ),
                    );
                  }),
              ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 21,
                  itemBuilder: (ctx, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ExpansionTile(
                        title: ListTile(
                          title: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    SchduleList[index]['from']['code'],
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                  Expanded(child: Container()),
                                  const TicketContainer(),
                                  Expanded(
                                    child: Stack(children: [
                                      SizedBox(
                                        height: 24,
                                        child: LayoutBuilder(builder:
                                            (BuildContext context,
                                            BoxConstraints constrainsts) {
                                          return Flex(
                                            direction: Axis.horizontal,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                              (constrainsts.constrainWidth() /
                                                  6)
                                                  .floor(),
                                                  (index) => const SizedBox(
                                                width: 3,
                                                height: 1,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey,
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
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  const TicketContainer(),
                                  Expanded(child: Container()),
                                  Text(
                                    SchduleList[index]['to']['code'],
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                              const Gap(3),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(SchduleList[index]['from']['name']),
                                  Text('${SchduleList[index]['price']}ETB'),
                                  Text(SchduleList[index]['to']['name']),
                                ],
                              ),
                              const Gap(15),
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    SchduleList[index]['time'],
                                    style: styles.headLineStyle4
                                        .copyWith(color: Colors.black12),
                                  ),
                                  Text(
                                    SchduleList[index]['departure-time'],
                                    style: styles.headLineStyle4
                                        .copyWith(color: Colors.black12),
                                  ),
                                ],
                              ),
                              const Gap(2),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Time",
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                  Text(
                                    "Destination time",
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        childrenPadding: const EdgeInsets.only(left: 10),
                        children: [
                          const Center(
                              child: Text("VIP Cargo",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500))),
                          const Divider(),
                          const SizedBox(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " Rfund Fee",
                                    ),
                                    Gap(180),
                                    Text(
                                      " 300ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Change Fee",
                                    ),
                                    Gap(170),
                                    Text(
                                      " 200ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Number of item",
                                    ),
                                    Gap(140),
                                    Text(
                                      " 3 X new ",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " 3 new thing",
                                    ),
                                    Gap(160),
                                    Text(
                                      " 3 new thing",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const OtherPassengers()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50),
                                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                "Select",
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                          const Center(
                            child: Text(
                              "Normal Cargo",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Divider(),
                          const SizedBox(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " Rfund Fee",
                                    ),
                                    Gap(180),
                                    Text(
                                      " 300ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Change Fee",
                                    ),
                                    Gap(170),
                                    Text(
                                      " 200ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Number of item",
                                    ),
                                    Gap(140),
                                    Text(
                                      " 3 X new ",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " 3 new thing",
                                    ),
                                    Gap(160),
                                    Text(
                                      " 3 new thing",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const OtherPassengers()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50),
                                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                "Select",
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                        ],
                      ),
                    );
                  }),
              ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 21,
                  itemBuilder: (ctx, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ExpansionTile(
                        title: ListTile(
                          title: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    SchduleList[index]['from']['code'],
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                  Expanded(child: Container()),
                                  const TicketContainer(),
                                  Expanded(
                                    child: Stack(children: [
                                      SizedBox(
                                        height: 24,
                                        child: LayoutBuilder(builder:
                                            (BuildContext context,
                                            BoxConstraints constrainsts) {
                                          return Flex(
                                            direction: Axis.horizontal,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                              (constrainsts.constrainWidth() /
                                                  6)
                                                  .floor(),
                                                  (index) => const SizedBox(
                                                width: 3,
                                                height: 1,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey,
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
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  const TicketContainer(),
                                  Expanded(child: Container()),
                                  Text(
                                    SchduleList[index]['to']['code'],
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                              const Gap(3),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(SchduleList[index]['from']['name']),
                                  Text('${SchduleList[index]['price']}ETB'),
                                  Text(SchduleList[index]['to']['name']),
                                ],
                              ),
                              const Gap(15),
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    SchduleList[index]['time'],
                                    style: styles.headLineStyle4
                                        .copyWith(color: Colors.black12),
                                  ),
                                  Text(
                                    SchduleList[index]['departure-time'],
                                    style: styles.headLineStyle4
                                        .copyWith(color: Colors.black12),
                                  ),
                                ],
                              ),
                              const Gap(2),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Time",
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                  Text(
                                    "Destination time",
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        childrenPadding: const EdgeInsets.only(left: 10),
                        children: [
                          const Center(
                              child: Text("VIP Cargo",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500))),
                          const Divider(),
                          const SizedBox(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " Rfund Fee",
                                    ),
                                    Gap(180),
                                    Text(
                                      " 300ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Change Fee",
                                    ),
                                    Gap(170),
                                    Text(
                                      " 200ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Number of item",
                                    ),
                                    Gap(140),
                                    Text(
                                      " 3 X new ",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " 3 new thing",
                                    ),
                                    Gap(160),
                                    Text(
                                      " 3 new thing",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const bookTicket()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50),
                                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                "Select",
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                          const Center(
                            child: Text(
                              "Normal Cargo",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Divider(),
                          const SizedBox(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " Rfund Fee",
                                    ),
                                    Gap(180),
                                    Text(
                                      " 300ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Change Fee",
                                    ),
                                    Gap(170),
                                    Text(
                                      " 200ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Number of item",
                                    ),
                                    Gap(140),
                                    Text(
                                      " 3 X new ",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " 3 new thing",
                                    ),
                                    Gap(160),
                                    Text(
                                      " 3 new thing",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const bookTicket()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50),
                                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                "Select",
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                        ],
                      ),
                    );
                  }),
              ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 21,
                  itemBuilder: (ctx, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ExpansionTile(
                        title: ListTile(
                          title: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    SchduleList[index]['from']['code'],
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                  Expanded(child: Container()),
                                  const TicketContainer(),
                                  Expanded(
                                    child: Stack(children: [
                                      SizedBox(
                                        height: 24,
                                        child: LayoutBuilder(builder:
                                            (BuildContext context,
                                            BoxConstraints constrainsts) {
                                          return Flex(
                                            direction: Axis.horizontal,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                              (constrainsts.constrainWidth() /
                                                  6)
                                                  .floor(),
                                                  (index) => const SizedBox(
                                                width: 3,
                                                height: 1,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey,
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
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  const TicketContainer(),
                                  Expanded(child: Container()),
                                  Text(
                                    SchduleList[index]['to']['code'],
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                              const Gap(3),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(SchduleList[index]['from']['name']),
                                  Text('${SchduleList[index]['price']}ETB'),
                                  Text(SchduleList[index]['to']['name']),
                                ],
                              ),
                              const Gap(15),
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    SchduleList[index]['time'],
                                    style: styles.headLineStyle4
                                        .copyWith(color: Colors.black12),
                                  ),
                                  Text(
                                    SchduleList[index]['departure-time'],
                                    style: styles.headLineStyle4
                                        .copyWith(color: Colors.black12),
                                  ),
                                ],
                              ),
                              const Gap(2),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Time",
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                  Text(
                                    "Destination time",
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        childrenPadding: const EdgeInsets.only(left: 10),
                        children: [
                          const Center(
                              child: Text("VIP Cargo",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500))),
                          const Divider(),
                          const SizedBox(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " Rfund Fee",
                                    ),
                                    Gap(180),
                                    Text(
                                      " 300ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Change Fee",
                                    ),
                                    Gap(170),
                                    Text(
                                      " 200ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Number of item",
                                    ),
                                    Gap(140),
                                    Text(
                                      " 3 X new ",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " 3 new thing",
                                    ),
                                    Gap(160),
                                    Text(
                                      " 3 new thing",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const bookTicket()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50),
                                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                "Select",
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                          const Center(
                            child: Text(
                              "Normal Cargo",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Divider(),
                          const SizedBox(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " Rfund Fee",
                                    ),
                                    Gap(180),
                                    Text(
                                      " 300ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Change Fee",
                                    ),
                                    Gap(170),
                                    Text(
                                      " 200ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Number of item",
                                    ),
                                    Gap(140),
                                    Text(
                                      " 3 X new ",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " 3 new thing",
                                    ),
                                    Gap(160),
                                    Text(
                                      " 3 new thing",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const bookTicket()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50),
                                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                "Select",
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                        ],
                      ),
                    );
                  }),
              ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 21,
                  itemBuilder: (ctx, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ExpansionTile(
                        title: ListTile(
                          title: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    SchduleList[index]['from']['code'],
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                  Expanded(child: Container()),
                                  const TicketContainer(),
                                  Expanded(
                                    child: Stack(children: [
                                      SizedBox(
                                        height: 24,
                                        child: LayoutBuilder(builder:
                                            (BuildContext context,
                                            BoxConstraints constrainsts) {
                                          return Flex(
                                            direction: Axis.horizontal,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                              (constrainsts.constrainWidth() /
                                                  6)
                                                  .floor(),
                                                  (index) => const SizedBox(
                                                width: 3,
                                                height: 1,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey,
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
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  const TicketContainer(),
                                  Expanded(child: Container()),
                                  Text(
                                    SchduleList[index]['to']['code'],
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                              const Gap(3),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(SchduleList[index]['from']['name']),
                                  Text('${SchduleList[index]['price']}ETB'),
                                  Text(SchduleList[index]['to']['name']),
                                ],
                              ),
                              const Gap(15),
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    SchduleList[index]['time'],
                                    style: styles.headLineStyle4
                                        .copyWith(color: Colors.black12),
                                  ),
                                  Text(
                                    SchduleList[index]['departure-time'],
                                    style: styles.headLineStyle4
                                        .copyWith(color: Colors.black12),
                                  ),
                                ],
                              ),
                              const Gap(2),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Time",
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                  Text(
                                    "Destination time",
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        childrenPadding: const EdgeInsets.only(left: 10),
                        children: [
                          const Center(
                              child: Text("VIP Cargo",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500))),
                          const Divider(),
                          const SizedBox(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " Rfund Fee",
                                    ),
                                    Gap(180),
                                    Text(
                                      " 300ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Change Fee",
                                    ),
                                    Gap(170),
                                    Text(
                                      " 200ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Number of item",
                                    ),
                                    Gap(140),
                                    Text(
                                      " 3 X new ",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " 3 new thing",
                                    ),
                                    Gap(160),
                                    Text(
                                      " 3 new thing",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const bookTicket()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50),
                                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                "Select",
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                          const Center(
                            child: Text(
                              "Normal Cargo",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Divider(),
                          const SizedBox(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " Rfund Fee",
                                    ),
                                    Gap(180),
                                    Text(
                                      " 300ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Change Fee",
                                    ),
                                    Gap(170),
                                    Text(
                                      " 200ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Number of item",
                                    ),
                                    Gap(140),
                                    Text(
                                      " 3 X new ",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " 3 new thing",
                                    ),
                                    Gap(160),
                                    Text(
                                      " 3 new thing",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const bookTicket()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50),
                                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                "Select",
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                        ],
                      ),
                    );
                  }),
              ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 21,
                  itemBuilder: (ctx, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ExpansionTile(
                        title: ListTile(
                          title: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    SchduleList[index]['from']['code'],
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                  Expanded(child: Container()),
                                  const TicketContainer(),
                                  Expanded(
                                    child: Stack(children: [
                                      SizedBox(
                                        height: 24,
                                        child: LayoutBuilder(builder:
                                            (BuildContext context,
                                            BoxConstraints constrainsts) {
                                          return Flex(
                                            direction: Axis.horizontal,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                              (constrainsts.constrainWidth() /
                                                  6)
                                                  .floor(),
                                                  (index) => const SizedBox(
                                                width: 3,
                                                height: 1,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey,
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
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  const TicketContainer(),
                                  Expanded(child: Container()),
                                  Text(
                                    SchduleList[index]['to']['code'],
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                              const Gap(3),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(SchduleList[index]['from']['name']),
                                  Text('${SchduleList[index]['price']}ETB'),
                                  Text(SchduleList[index]['to']['name']),
                                ],
                              ),
                              const Gap(15),
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    SchduleList[index]['time'],
                                    style: styles.headLineStyle4
                                        .copyWith(color: Colors.black12),
                                  ),
                                  Text(
                                    SchduleList[index]['departure-time'],
                                    style: styles.headLineStyle4
                                        .copyWith(color: Colors.black12),
                                  ),
                                ],
                              ),
                              const Gap(2),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Time",
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                  Text(
                                    "Destination time",
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        childrenPadding: const EdgeInsets.only(left: 10),
                        children: [
                          const Center(
                              child: Text("VIP Cargo",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500))),
                          const Divider(),
                          const SizedBox(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " Rfund Fee",
                                    ),
                                    Gap(180),
                                    Text(
                                      " 300ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Change Fee",
                                    ),
                                    Gap(170),
                                    Text(
                                      " 200ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Number of item",
                                    ),
                                    Gap(140),
                                    Text(
                                      " 3 X new ",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " 3 new thing",
                                    ),
                                    Gap(160),
                                    Text(
                                      " 3 new thing",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const bookTicket()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50),
                                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                "Select",
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                          const Center(
                            child: Text(
                              "Normal Cargo",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Divider(),
                          const SizedBox(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " Rfund Fee",
                                    ),
                                    Gap(180),
                                    Text(
                                      " 300ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Change Fee",
                                    ),
                                    Gap(170),
                                    Text(
                                      " 200ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Number of item",
                                    ),
                                    Gap(140),
                                    Text(
                                      " 3 X new ",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " 3 new thing",
                                    ),
                                    Gap(160),
                                    Text(
                                      " 3 new thing",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const bookTicket()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50),
                                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                "Select",
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                        ],
                      ),
                    );
                  }),
              ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 21,
                  itemBuilder: (ctx, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ExpansionTile(
                        title: ListTile(
                          title: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    SchduleList[index]['from']['code'],
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                  Expanded(child: Container()),
                                  const TicketContainer(),
                                  Expanded(
                                    child: Stack(children: [
                                      SizedBox(
                                        height: 24,
                                        child: LayoutBuilder(builder:
                                            (BuildContext context,
                                            BoxConstraints constrainsts) {
                                          return Flex(
                                            direction: Axis.horizontal,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                              (constrainsts.constrainWidth() /
                                                  6)
                                                  .floor(),
                                                  (index) => const SizedBox(
                                                width: 3,
                                                height: 1,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey,
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
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  const TicketContainer(),
                                  Expanded(child: Container()),
                                  Text(
                                    SchduleList[index]['to']['code'],
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                              const Gap(3),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(SchduleList[index]['from']['name']),
                                  Text('${SchduleList[index]['price']}ETB'),
                                  Text(SchduleList[index]['to']['name']),
                                ],
                              ),
                              const Gap(15),
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    SchduleList[index]['time'],
                                    style: styles.headLineStyle4
                                        .copyWith(color: Colors.black12),
                                  ),
                                  Text(
                                    SchduleList[index]['departure-time'],
                                    style: styles.headLineStyle4
                                        .copyWith(color: Colors.black12),
                                  ),
                                ],
                              ),
                              const Gap(2),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Time",
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                  Text(
                                    "Destination time",
                                    style: styles.headLineStyle3
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        childrenPadding: const EdgeInsets.only(left: 10),
                        children: [
                          const Center(
                              child: Text("VIP Cargo",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500))),
                          const Divider(),
                          const SizedBox(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " Rfund Fee",
                                    ),
                                    Gap(180),
                                    Text(
                                      " 300ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Change Fee",
                                    ),
                                    Gap(170),
                                    Text(
                                      " 200ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Number of item",
                                    ),
                                    Gap(140),
                                    Text(
                                      " 3 X new ",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " 3 new thing",
                                    ),
                                    Gap(160),
                                    Text(
                                      " 3 new thing",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const bookTicket()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50),
                                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                "Select",
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                          const Center(
                            child: Text(
                              "Normal Cargo",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Divider(),
                          const SizedBox(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " Rfund Fee",
                                    ),
                                    Gap(180),
                                    Text(
                                      " 300ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Change Fee",
                                    ),
                                    Gap(170),
                                    Text(
                                      " 200ETB",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Number of item",
                                    ),
                                    Gap(140),
                                    Text(
                                      " 3 X new ",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " 3 new thing",
                                    ),
                                    Gap(160),
                                    Text(
                                      " 3 new thing",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const bookTicket()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50),
                                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                "Select",
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
