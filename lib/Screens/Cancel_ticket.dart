import 'package:book_train_ticket/utils/app_style.dart';
import 'package:book_train_ticket/widget/ticket_container.dart';
import 'package:flutter/material.dart';

class CancelTicket extends StatefulWidget {
  @override
  _CancelTicketState createState() => _CancelTicketState();
}

class _CancelTicketState extends State<CancelTicket> {
  String referenceNumber = '';
  bool isVisible=false;

  void cancelTicket() {
    // Implement your logic for canceling the booked ticket here
    print('Cancelled ticket with reference number: $referenceNumber');
    // Show a confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ticket Cancelled'),
          content: Text('Ticket with reference number $referenceNumber has been cancelled.'),
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

  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: styles.bgColor,
      appBar: AppBar(
        title: const Text('Cancel Ticket'),
      ),
      body:ListView(
      children:[
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             height: 300,
             decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
               color: Colors.white,
             ),
             child: Column(
               children: [
                 const Text(
                   "search Ticket",
                   style: TextStyle(
                     fontSize: 25,
                   ),
                 ),
                 Padding(
                   padding:
                       const EdgeInsets.only(left: 20, right: 20),
                   child: TextFormField(
                    // controller: ,
                     keyboardType: TextInputType.emailAddress,
                     decoration: const InputDecoration(
                         labelText: "First Name*",
                         labelStyle: TextStyle(
                           color: Colors.grey,
                         )),
                     validator: (value) {
                       if (value!.isEmpty) {
                         return "first name is required";
                       }
                        else {
                         return null;
                       }
                     },
                   ),
                 ),
                 
                 Padding(
                   padding:
                       const EdgeInsets.only(left: 20, right: 20),
                   child: TextFormField(
                    // controller: ,
                     keyboardType: TextInputType.emailAddress,
                     decoration: const InputDecoration(
                         labelText: "Last Name*",
                         labelStyle: TextStyle(
                           color: Colors.grey,
                         )),
                     validator: (value) {
                       if (value!.isEmpty) {
                         return "last name is required";
                       }
                        else {
                         return null;
                       }
                     },
                   ),
                 ),
                 Padding(
                   padding:
                       const EdgeInsets.only(left: 20, right: 20),
                   child: TextFormField(
                     keyboardType: TextInputType.phone,
                     
                     maxLength: 10,
                     decoration: const InputDecoration(
                         labelText: "Refernce Number*",
                         labelStyle: TextStyle(
                           color: Colors.grey,
                         )),
                     validator: (value) {
                       if (value!.isEmpty) {
                         return "Reference Number is required";
                       }
                       if (value.length != 10) {
                         return "Reference number must be 10 digit";
                       } else {
                         return null;
                       }
                     },
                   ),
                 ),
               ],
             ),
           ),
         ),

         Center(
           child: SizedBox(
            width: 200,
             child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isVisible=true;
                   }
                  );
                 },
                    child: const Text('Find'),      
              ),
           ),
         ),  
         

         Visibility(
          visible: isVisible,
           child: Padding(
             padding: const EdgeInsets.all(10.0),
             child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
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
                              "AA",
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
                              "DD",
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
                              "Adiss Abeba",
                              style: styles.headLineStyle4.copyWith(color: Colors.grey),
                            ),
                          ),
                          Text(
                            "11H 30M ",
                            style: styles.headLineStyle4.copyWith(color: Colors.grey),
                          ),
                          SizedBox(
                            width: screenWidth * 0.3,
                            child: Text(
                              " Dire Dawa",
                              style: styles.headLineStyle4.copyWith(color: Colors.grey),
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
                            "Departure",
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
                            width: screenWidth * 0.2,
                            child: Text(
                              " May 24",
                              style: styles.headLineStyle4.copyWith(color: Colors.grey),
                            ),
                          ),
                          Text(
                            "7:30 AM",
                            style: styles.headLineStyle4.copyWith(color: Colors.grey),
                          ),
                          SizedBox(
                            width: screenWidth * 0.2,
                            child: Text(
                              "21",
                              style: styles.headLineStyle4.copyWith(color: Colors.grey),
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
                              " price",
                              style: styles.headLineStyle4
             
                              .copyWith(color: Colors.grey),
                            ),
                          ),
                           SizedBox(
                            width: screenWidth * 0.2,
                            child: Text(
                              " 600",
                              style: styles.headLineStyle4
             
                              .copyWith(color: Colors.grey),
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
                    .copyWith(color: Colors.black38),
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
                        " Ticket Reference",
                        style:styles.headLineStyle4
                          .copyWith(color: Colors.black38),
                        ),
                      ),
                
                          SizedBox(
                            width:screenWidth * 0.2, 
                            child: Text(
                            "536428231",
                            style:styles.headLineStyle4
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
                      width:screenWidth * 0.2, 
                        child: Text(
                        " First Name",
                        style:styles.headLineStyle4
                          .copyWith(color: Colors.black38),
                        ),
                      ),
                          SizedBox(
                            width:screenWidth * 0.2, 
                            child: Text(
                            "samuel",
                            style:styles.headLineStyle4
                              .copyWith(color: Colors.grey),
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
                    .copyWith(color: Colors.grey),
                  ),
                ),
                
                          SizedBox(
                           width:screenWidth * 0.2, 
                            child: Text(
                            "Kebede",
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
                    .copyWith(color: Colors.black38),
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
         ),
          Visibility(
            visible: isVisible,
            child: Center(
             child: SizedBox(
              width: 200,
               child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cancelMyTicket();
                     }
                    );
                   },
                      child: const Text('Cancle Ticket'),      
                ),
             ),
                     ),
          ),  
         
       ]
      ),
     );
  }
  void cancelMyTicket() {
    // Implement your logic for canceling the booked ticket here
    print('Cancelled ticket with reference number: $referenceNumber');
    // Show a confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Cancellation'),
          content: const Text(
              'Do you want to cancel this ticket?\n\nYour money will be refunded to your account after 2 business days. If not, contact us at 8281.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Optionally, you can implement the cancellation logic here
                setState(() {
                  isVisible = false;
                });
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Implement your logic for confirming the cancellation
                print('Ticket with reference number $referenceNumber has been cancelled.');
                setState(() {
                  isVisible = false;
                });
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

}
