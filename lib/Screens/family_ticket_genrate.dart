import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';

import '../Database/city_abrivation.dart';
import '../Database/passenger.dart';
import '../widget/ticket_container.dart';

class FamilyTicketGenerate extends StatefulWidget {
  List <Passenger> dataList;
  final bool? isColor;

   FamilyTicketGenerate({super.key, required this.dataList, this.isColor});

  @override
  State<FamilyTicketGenerate> createState() => _TicketViewState();
}

class _TicketViewState extends State<FamilyTicketGenerate> {
  bool isvisibel=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: styles.bgColor,
      appBar: AppBar(
        title:const Text('Family Tickets'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          const SizedBox(height: 5),
          Container(
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.3,
                      child: Text(
                        "Passengers",
                        style: styles.headLineStyle4.copyWith(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.2,
                      child: Text(
                       '${widget.dataList.length}',
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
                            .copyWith(color: Colors.black),
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
                      width: screenWidth * 0.5,
                      child: Text(
                        " Payment Method",
                        style: styles.headLineStyle4
                            .copyWith(color: Colors.black),
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
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.5,
                      child: Text(
                        " Status",
                        style: styles.headLineStyle4
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.2,
                      child: Text(
                        "Paid", style: styles.headLineStyle4
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
                        " Class",
                        style: styles.headLineStyle4
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.2,
                      child: Text(
                        widget.dataList[0].Class,
                        style:
                        styles.headLineStyle4.copyWith(color: Colors.black),
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
                        " Price",
                        style: styles.headLineStyle4
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.2,
                      child: Text(
                        '${widget.dataList[0].Price} ETB',
                        style:
                        styles.headLineStyle4.copyWith(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Container(
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child:Center(child: Text("Passenger Details",style: styles.headLineStyle2.copyWith(color: Colors.black),),
              ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics:const NeverScrollableScrollPhysics(),
            itemCount: widget.dataList.length,
            itemBuilder: (BuildContext context, int index) {
              late IconData iconData;
              int age = int.parse(widget.dataList[index].Age);
              if (age < 12) {
                iconData = Icons.child_care; // Icon for children
              } else {
                iconData = Icons.person; // Icon for adults
              }
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${widget.dataList[index].FirstName} |${widget.dataList[index].LastName}',
                          style: styles.headLineStyle3.copyWith(color: Colors.black),
                        ),
                         Icon(
                          iconData, // Icon for an adult
                          color: Colors.lightGreen,
                          size: 24.0,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        SizedBox(
                          width: screenWidth * 0.1,
                          child: Text(
                            CityAbbreviation.getAbbreviation(
                                widget.dataList[index].DeparturePlace),
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
                                widget.dataList[index].ArivalPlace),
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
                            widget.dataList[index].DeparturePlace,
                            style: styles.headLineStyle4
                                .copyWith(color: Colors.grey),
                          ),
                        ),

                        SizedBox(
                          width: screenWidth * 0.3,
                          child: Text(
                            widget.dataList[index].ArivalPlace,
                            style: styles.headLineStyle4
                                .copyWith(color: Colors.grey),
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
                            " Date",
                            style: styles.headLineStyle4
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        Text(
                          "Cargo",
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
                          width: screenWidth * 0.25,
                          child: Text( widget.dataList[index].Date,
                            style: styles.headLineStyle4
                                .copyWith(color: Colors.grey),
                          ),
                        ),
                        Text(
                          widget.dataList[index].Cargo,
                          style:
                          styles.headLineStyle4.copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          width: screenWidth * 0.21,
                          child: Text(
                            widget.dataList[0].Seat,
                            style: styles.headLineStyle4
                                .copyWith(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
