import 'package:book_train_ticket/Screens/see_ticket_details.dart';
import 'package:book_train_ticket/Screens/ticket_view.dart';
import 'package:book_train_ticket/utils/app_info_list.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class myTrip extends StatefulWidget {
  const myTrip({super.key});

  @override
  State<myTrip> createState() => _myTripState();
}

class _myTripState extends State<myTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styles.bgColor,
      appBar: AppBar(
        title: const Center(
          child: Text("My trip"),
        ),
      ),
      body: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const SeeTicketDetail()));
        },
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Material(
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey,
                  ),
                  child: TabBar(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 10),
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: Colors.transparent, width: 1),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "past",
                              style: styles.headLineStyle3
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: Colors.transparent, width: 1),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "upcoming",
                              style: styles.headLineStyle3
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20, right: 10),
                      child: Column(
                        children: [
                          Container(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10),
                            margin:
                            const EdgeInsets.symmetric(horizontal: 16),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight:Radius.circular(10),
                              ),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Confirmation ",
                                  style: styles.headLineStyle3
                                      .copyWith(color: Colors.grey),
                                ),
                                const Gap(5),
                                Text(
                                  "xvt65i",
                                  style: styles.headLineStyle3
                                      .copyWith(color: Colors.green),
                                ),
                                const Gap(140),
                                const Icon(Icons.arrow_forward_ios_sharp),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10),
                            margin:
                            const EdgeInsets.symmetric(horizontal: 16),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              border:Border(
                                bottom:BorderSide(color: Colors.black45),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Kebede|Samuel",
                                  style: styles.headLineStyle3
                                      .copyWith(color: Colors.black),
                                ),
                                const Gap(90),
                                Text(
                                  "Not Ticketed",
                                  style: styles.headLineStyle3
                                      .copyWith(color: Colors.red),
                                ),

                              ],
                            ),

                          ),
                          TicketView(ticket: ticketList[0], isColor: true),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20, right: 10),
                      child: Column(
                        children: [
                          Container(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10),
                            margin:
                            const EdgeInsets.symmetric(horizontal: 16),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight:Radius.circular(10),
                              ),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Confirmation ",
                                  style: styles.headLineStyle3
                                      .copyWith(color: Colors.grey),
                                ),
                                const Gap(5),
                                Text(
                                  "xvt65i",
                                  style: styles.headLineStyle3
                                      .copyWith(color: Colors.green),
                                ),
                                const Gap(140),
                                const Icon(Icons.arrow_forward_ios_sharp),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10),
                            margin:
                            const EdgeInsets.symmetric(horizontal: 16),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              border:Border(
                                bottom:BorderSide(color: Colors.black45),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Kebede|Samuel",
                                  style: styles.headLineStyle3
                                      .copyWith(color: Colors.black),
                                ),
                                const Gap(90),
                                Text(
                                  "Not Ticketed",
                                  style: styles.headLineStyle3
                                      .copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          TicketView(ticket: ticketList[0], isColor: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
