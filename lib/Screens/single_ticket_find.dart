// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:intl/intl.dart';
// import '../Database/city_abrivation.dart';
// import '../Database/my_data.dart';
// import '../widget/ticket_container.dart';
// import 'other_passengers.dart';
// import 'package:book_train_ticket/utils/app_style.dart';
//
// class SingleTicketFind extends StatelessWidget {
//   final List<MyData> tickets;
//   final String departurePlace;
//   final String? arrivalPlace;
//   final String departuredate;
//   final int numberOfChild;
//   final int numberOfAdult;
//
//   SingleTicketFind({
//     required this.tickets,
//     required this.departurePlace,
//     required this.arrivalPlace,
//     required this.departuredate,
//     required this.numberOfAdult,
//     required this.numberOfChild,
//   });
//
//   // Function to print when the page is called
//   void _printPageCalled() {
//     print('SingleTicketFind page is called.');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Call the function to print when the page is called
//     _printPageCalled();
//
//     String formattedDate =
//         DateFormat.MMMMd().format(DateTime.parse(departuredate));
//     String formattedDateDay =
//         DateFormat.d().format(DateTime.parse(departuredate));
//
//     List<MyData> filteredTickets = tickets.where((ticket) {
//       if (arrivalPlace != null) {
//         return ticket.departure == departurePlace &&
//             ticket.arrivalplace == arrivalPlace &&
//             ticket.weekNo == formattedDateDay;
//       } else {
//         return ticket.departure == departurePlace &&
//             ticket.weekNo == formattedDateDay;
//       }
//     }).toList();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Padding(
//           padding: const EdgeInsets.only(left: 70.0),
//           child: Text(formattedDate),
//         ),
//       ),
//       body: filteredTickets.isEmpty
//           ? const Center(
//               child: Text(
//                 'No schedule available for the selected day and arrival place.',
//                 style: TextStyle(fontSize: 18.0),
//               ),
//             )
//           : ListView.builder(
//               itemCount: filteredTickets.length,
//               itemBuilder: (context, index) {
//                 MyData ticket = filteredTickets[index];
//                 return Card(
//                   margin:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                   child: ExpansionTile(
//                     title: ListTile(
//                       title: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 CityAbbreviation.getAbbreviation(
//                                     ticket.departure),
//                                 style: styles.headLineStyle3
//                                     .copyWith(color: Colors.black),
//                               ),
//                               Expanded(child: Container()),
//                               const TicketContainer(),
//                               Expanded(
//                                 child: Stack(
//                                   children: [
//                                     SizedBox(
//                                       height: 24,
//                                       child: LayoutBuilder(
//                                         builder: (BuildContext context,
//                                             BoxConstraints constraints) {
//                                           return Flex(
//                                             direction: Axis.horizontal,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: List.generate(
//                                               (constraints.constrainWidth() / 6)
//                                                   .floor(),
//                                               (index) => const SizedBox(
//                                                 width: 3,
//                                                 height: 1,
//                                                 child: DecoratedBox(
//                                                   decoration: BoxDecoration(
//                                                     color: Colors.grey,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                     const Center(
//                                       child: Icon(
//                                         Icons.train,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               const TicketContainer(),
//                               Expanded(child: Container()),
//                               Text(
//                                 CityAbbreviation.getAbbreviation(
//                                     ticket.arrivalplace),
//                                 style: styles.headLineStyle3
//                                     .copyWith(color: Colors.black),
//                               ),
//                             ],
//                           ),
//                           const Gap(3),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(ticket.departure),
//                               const Icon(Icons.double_arrow_outlined),
//                               const Icon(Icons.double_arrow_outlined),
//                               Text(ticket.arrivalplace),
//                             ],
//                           ),
//                           const Gap(15),
//                         ],
//                       ),
//                       subtitle: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "12 HR",
//                                 style: styles.headLineStyle4
//                                     .copyWith(color: Colors.black12),
//                               ),
//                               Text(
//                                 tickets[index].price,
//                                 style: styles.headLineStyle4
//                                     .copyWith(color: Colors.lightGreen),
//                               ),
//                             ],
//                           ),
//                           const Gap(2),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Travel Time",
//                                 style: styles.headLineStyle3
//                                     .copyWith(color: Colors.black),
//                               ),
//                               Text(
//                                 "Price",
//                                 style: styles.headLineStyle3
//                                     .copyWith(color: Colors.black),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     expandedCrossAxisAlignment: CrossAxisAlignment.start,
//                     childrenPadding: const EdgeInsets.only(left: 10),
//                     children: [
//                       const Center(
//                         child: Text(
//                           "VIP Cargo",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                       const Divider(),
//                       const SizedBox(
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Text(" Refund Fee"),
//                                 Gap(180),
//                                 Text(" 300ETB"),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Text(" Change Fee"),
//                                 Gap(170),
//                                 Text(" 200ETB"),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Text(" Number of item"),
//                                 Gap(140),
//                                 Text(" 3 X new "),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Text(" 3 new thing"),
//                                 Gap(160),
//                                 Text(" 3 new thing"),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       Center(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => OtherPassengers(
//                                   numberofadult: numberOfAdult,
//                                   numberofchild: numberOfChild,
//                                   departureplace: ticket.departure,
//                                   arrivalplace:ticket.arrivalplace,
//                                   dateTime: DateTime.now(),
//                                   price: ticket.price,
//                                 ),
//                               ),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue,
//                             padding: const EdgeInsets.symmetric(horizontal: 50),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                           ),
//                           child: const Text(
//                             "Select",
//                             style: TextStyle(
//                               fontSize: 15,
//                               letterSpacing: 2,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Gap(5),
//                     ],
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
