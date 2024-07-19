import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../Database/city_abrivation.dart';
import '../Database/my_data.dart';
import '../widget/ticket_container.dart';
import 'book_ticket.dart';
import 'other_passengers.dart';

class SingleTicketFind extends StatefulWidget {
  final List<MyData> tickets;
  final String departurePlace;
  final String arrivalPlace;
  final DateTime departuredate;
  final int? numberOfChild;
  final int? numberOfAdult;
  final String CargoType;

  const SingleTicketFind({
    Key? key,
    required this.tickets,
    required this.departurePlace,
    required this.arrivalPlace,
    required this.departuredate,
    required this.numberOfAdult,
    required this.numberOfChild,
    required this.CargoType,
  }) : super(key: key);

  @override
  _SingleTicketFindState createState() => _SingleTicketFindState();
}

class _SingleTicketFindState extends State<SingleTicketFind> {
  List<MyData> matchingTickets = [];

  @override
  void initState() {
    super.initState();
    _findMatchingTickets();
    _printPageCalled();
  }

  // Function to print when the page is called
  void _printPageCalled() {
  }

  void _findMatchingTickets() {
    matchingTickets = widget.tickets.where((ticket) {
      DateTime ticketDate = DateFormat('yyyy-MM-dd').parse(ticket.fullday);
      return ticket.departure == widget.departurePlace &&
          ticket.arrivalplace == widget.arrivalPlace &&
          DateFormat('yyyy-MM-dd').format(ticketDate) ==
              DateFormat('yyyy-MM-dd').format(widget.departuredate);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
             onPressed: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const bookTicket()),
               );
             },
        ),
        title: const Center(child: Text('Single Ticket Find')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: matchingTickets.isEmpty
            ? const Center(child: Text('No matching ticket found'))
            :  ListView.builder(
          itemCount: matchingTickets.length,
          itemBuilder: (context, index) {
            // Build your list item here using filteredData[index]
            return Card(
              margin:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ExpansionTile(
                title: ListTile(
                  title: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            CityAbbreviation.getAbbreviation(
                                matchingTickets[index].departure),
                            style: styles.headLineStyle3
                                .copyWith(color: Colors.black),
                          ),
                          Expanded(child: Container()),
                          const TicketContainer(),
                          Expanded(
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 24,
                                  child: LayoutBuilder(
                                    builder: (BuildContext context,
                                        BoxConstraints constrainsts) {
                                      return Flex(
                                        direction: Axis.horizontal,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: List.generate(
                                          (constrainsts.constrainWidth() / 6)
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
                                    },
                                  ),
                                ),
                                const Center(
                                  child: Icon(
                                    Icons.train,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const TicketContainer(),
                          Expanded(child: Container()),
                          Text(
                            CityAbbreviation.getAbbreviation(
                                matchingTickets[index].arrivalplace),
                            style: styles.headLineStyle3
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                      const Gap(3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(matchingTickets[index].departure),
                          const Icon(Icons.double_arrow_outlined),
                          const Icon(Icons.double_arrow_outlined),
                          Text(matchingTickets[index].arrivalplace),
                        ],
                      ),
                      const Gap(15),
                    ],
                  ),
                  subtitle: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            matchingTickets[index].JourneyTime,
                            style: styles.headLineStyle4
                                .copyWith(color: Colors.black38),
                          ),
                          Text(
                            matchingTickets[index].departureTime,
                            style: styles.headLineStyle4
                                .copyWith(color: Colors.black38),
                          ),
                        ],
                      ),
                      const Gap(2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Travel Time",
                            style: styles.headLineStyle3
                                .copyWith(color: Colors.black),
                          ),
                          Text(
                            "Time",
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
                    child: Text(
                      "VIP Cargo",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(" Refund Fee"),
                            Gap(180),
                            Text(" 300ETB"),
                          ],
                        ),
                        const Row(
                          children: [
                            Text(" Change Fee"),
                            Gap(170),
                            Text(" 200ETB"),
                          ],
                        ),
                        const Row(
                          children: [
                            Text(" Number of item"),
                            Gap(140),
                            Text(" 3 X new "),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(" price",style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),
                            const Gap(220),
                            Text(
                              '${(int.parse(matchingTickets[index].price) * 2)} ETB',style: const TextStyle(
                              color: Colors.red,

                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        String correctformatted = DateFormat('yyyy-MM-dd').format(widget.departuredate);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtherPassengers(
                              numberofadult: widget.numberOfAdult,
                              numberofchild: widget.numberOfChild,
                              departureplace: widget.departurePlace,
                              arrivalplace: widget.arrivalPlace,
                              dateTime:widget.departuredate,
                              price: matchingTickets[index].price,
                              cargoType: 'VIP',
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
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
                  SizedBox(
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(" Refund Fee"),
                            Gap(180),
                            Text(" 300ETB"),
                          ],
                        ),
                        const Row(
                          children: [
                            Text(" Change Fee"),
                            Gap(170),
                            Text(" 200ETB"),
                          ],
                        ),
                        const Row(
                          children: [
                            Text(" Number of item"),
                            Gap(140),
                            Text(" 3 X new "),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(" price",style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                            const Gap(220),
                            Text('${matchingTickets[index].price}ETB',style: const TextStyle(
                              color: Colors.red,
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtherPassengers(
                              numberofadult: widget.numberOfAdult,
                              numberofchild: widget.numberOfChild,
                              departureplace: widget.departurePlace,
                              arrivalplace: widget.arrivalPlace,
                              dateTime:widget.departuredate,
                              price: matchingTickets[index].price,
                              cargoType: 'Normal',
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
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
          },
        ),
      ),
    );
  }
}
