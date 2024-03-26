import 'package:book_train_ticket/Screens/see_ticket_details_appBar.dart';
import 'package:flutter/material.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:gap/gap.dart';

import '../utils/app_info_list.dart';

class SeeTicketDetail extends StatelessWidget {
  const SeeTicketDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
                      Text("Confirmation", style: styles.headLineStyle2),
                      Text(
                        "XLMJR",
                        style: styles.headLineStyle4
                            .copyWith(color: Colors.lightGreen),
                      ),
                      Text(
                        "Not Ticketed",
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
                      Text(
                        "Departure Place",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                      Text("AA",
                          style: styles.headLineStyle3
                              .copyWith(color: Colors.grey)),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Arrival Place",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                      Text(
                        "DD",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Departure Time",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                      Text(
                        "7:30 AM",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Arrival Time",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                      Text(
                        "6:30 PM",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Departure Date",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                      Text(
                        "Mon 12,Mar",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Duration",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                      Text(
                        "11H 30M",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Class",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                      Text(
                        "Normal",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Booking Status",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                      Text(
                        "Confirm",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Gap(20),
                  const Divider(),
                  Text("Passengers Details", style: styles.headLineStyle2),
                  const Divider(),
                  ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: passengers.length,
                      itemBuilder: (ctx, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              passengers[index]['name'],
                              style: styles.headLineStyle3
                                  .copyWith(color: Colors.grey),
                            ),
                            Text(
                              passengers[index]['age'],
                              style: styles.headLineStyle3
                                  .copyWith(color: Colors.grey),
                            ),
                            Text(
                              '${passengers[index]['seat']}',
                              style: styles.headLineStyle3
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        );
                      }),
                  const Gap(20),
                  const Divider(),
                  Text("Price Details", style: styles.headLineStyle2),
                  const Divider(),
                  const Gap(20),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "child",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                      Text(
                        "500 ETB",
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
                        "Adult",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.grey),
                      ),
                      Text(
                        "750 ETB",
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
                        "4500 ETB",
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
