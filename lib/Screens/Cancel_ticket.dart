import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../Database/cancel.dart';

class CancelTicket extends StatefulWidget {
  const CancelTicket({super.key});

  @override
  CancelTicketState createState() => CancelTicketState();
}

class CancelTicketState extends State<CancelTicket> {
  String referenceNumber = '';
  bool isVisible=false;
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _phonetextfieldcontroller = TextEditingController();
  final TextEditingController _referenceController = TextEditingController();
  // final _emailRgex =
  //     r"^[a-zA-z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-z]+";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: styles.bgColor,
      appBar: AppBar(
        leading: const BackButton(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Find Ticket"),
            InkWell(
              child: const Icon(Icons.home),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Cancel Booking?'),
                      content: const Text(
                          'Are you sure you want to cancel the booking?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                            // Navigate to the first screen
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body:ListView(
      children:[
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             height: 350,
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

                 Form(
                   key: _formKey,
                   child: Column(
                     children: [
                       Padding(
                         padding:
                         const EdgeInsets.only(left: 20, right: 20),
                         child: TextFormField(
                           controller:_firstnameController,
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
                           keyboardType: TextInputType.phone,
                           controller: _phonetextfieldcontroller,
                           maxLength: 10,
                           decoration: const InputDecoration(
                               labelText: "Phone number*",
                               labelStyle: TextStyle(
                                 color: Colors.grey,
                               )),
                           validator: (value) {
                             if (value!.isEmpty) {
                               return "Phone Number is required";
                             }
                             if (value.length != 10) {
                               return "Phone number must be 10 digit";
                             } else {
                               return null;
                             }
                           },
                         ),
                       ),
                       Padding(
                         padding:
                         const EdgeInsets.only(left: 20, right: 20),
                         child: TextFormField(
                           keyboardType: TextInputType.text,
                           controller: _referenceController,
                           decoration: const InputDecoration(
                               labelText: "Refernce Number*",
                               labelStyle: TextStyle(
                                 color: Colors.grey,
                               )),
                           validator: (value) {
                             if (value!.isEmpty) {
                               return "Reference Number is required";
                             }
                            else {
                               return null;
                             }
                           },
                         ),
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),
         ),
       const Gap(30),
         Center(
           child: SizedBox(
            width: 200,
             child: ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  else{
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyTicketCancelApp(ticketReference: _referenceController.text, phoneNumber:_phonetextfieldcontroller.text, firstname:_firstnameController.text,)));

                  }

                 },
                    child: const Text('Find'),      
              ),
           ),
         ),
       ]
      ),
     );
  }

}
