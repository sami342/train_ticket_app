import 'package:book_train_ticket/utils/app_layout.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../widget/ticket_container.dart';

class TicketView extends StatefulWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;

  const TicketView({super.key, required this.ticket, this.isColor});

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.ticket);
  }

  @override
  Widget build(BuildContext context) {
    //final bool? ColorIS=widget.isColor;
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width*0.90,
      height: 200,
      child: Container(
        margin:widget.isColor==null?const EdgeInsets.only(left: 16):const EdgeInsets.only(left: 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // showing the blue part of the ticket
            Container(
              decoration: BoxDecoration(
                color:widget.isColor==null?const Color(0XFF526799):Colors.white,
                borderRadius:  BorderRadius.only(
                  topLeft:widget.isColor==null?const Radius.circular(21):const Radius.circular(0),
                  topRight:widget.isColor==null?const Radius.circular(21):const Radius.circular(0),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        widget.ticket['from']['code'],
                        style:widget.isColor==null?
                            styles.headLineStyle3.copyWith(color: Colors.white):styles.headLineStyle3.copyWith(color: Colors.black),
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
                                      BoxConstraints constrainsts) {
                                return Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    (constrainsts.constrainWidth() / 6).floor(),
                                    (index) =>  SizedBox(
                                      width: 3,
                                      height: 1,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color:widget.isColor==null?Colors.white:Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                             Center(
                              child: Icon(
                                Icons.train,
                                color:widget.isColor==null?Colors.white:Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const TicketContainer(),
                      Expanded(child: Container()),
                      Text(
                        widget.ticket['to']['code'],
                        style:widget.isColor==null?
                            styles.headLineStyle3.copyWith(color: Colors.white):styles.headLineStyle3.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          widget.ticket['from']['name'],
                          style: widget.isColor==null?
                          styles.headLineStyle4
                              .copyWith(color: Colors.white):styles.headLineStyle4
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                      Text(
                        widget.ticket['time'],
                        style:widget.isColor==null?
                            styles.headLineStyle4.copyWith(color: Colors.white):styles.headLineStyle4.copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          widget.ticket['to']['name'],
                          textAlign: TextAlign.end,
                          style:widget.isColor==null?
                          styles.headLineStyle4
                              .copyWith(color: Colors.white):styles.headLineStyle4
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //showing the yellow part of the tickets
            Container(
              color:widget.isColor==null?styles.orangeColor:Colors.white,
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
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                              (constraints.constrainWidth() / 15).floor(),
                              (index) =>SizedBox(
                                width: 5,
                                height: 1,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: widget.isColor==null?Colors.white:Colors.grey,
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
            //showing the bottom part of the orange part
            Container(
              decoration: BoxDecoration(
                color:widget.isColor==null?styles.orangeColor:Colors.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(21),
                    bottomRight: Radius.circular(21)),
              ),
              padding: const EdgeInsets.only(
                  left: 16, top: 10, right: 16, bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.ticket['date'],
                            style:widget.isColor==null?styles.headLineStyle3
                                .copyWith(color: Colors.white):styles.headLineStyle3
                                .copyWith(color: Colors.black),
                          ),
                          const Gap(5),
                          Text(
                            "Date",
                            style:widget.isColor==null?styles.headLineStyle3
                                .copyWith(color: Colors.white):styles.headLineStyle3
                                .copyWith(color: Colors.grey),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.ticket['departure-time'],
                            style:widget.isColor==null?styles.headLineStyle3
                                .copyWith(color: Colors.white):styles.headLineStyle3
                                .copyWith(color: Colors.black),
                          ),
                          const Gap(5),
                          Text(
                            "Departure time",
                            style:widget.isColor==null?styles.headLineStyle3
                                .copyWith(color: Colors.white):styles.headLineStyle3
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.ticket['number'],
                            style: widget.isColor==null?styles.headLineStyle3
                                .copyWith(color: Colors.white):styles.headLineStyle3
                                .copyWith(color: Colors.black),
                          ),
                          const Gap(5),
                          Text(
                            "Number",
                            style:widget.isColor==null?styles.headLineStyle3
                                .copyWith(color: Colors.white):styles.headLineStyle3
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
