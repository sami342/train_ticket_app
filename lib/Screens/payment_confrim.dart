import 'package:flutter/material.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/services.dart';


class PaymentConfrim extends StatefulWidget {
  const PaymentConfrim({super.key});

  @override
  State<PaymentConfrim> createState() => _PaymentConfrimState();
}

class _PaymentConfrimState extends State<PaymentConfrim> {

List<String> bankNames = [
  'Abbysiniya',
  'Wegagen',
  'Dashen',
  'Amhara',
  'Apolo',
  'Awash',
  'Coop',
  'Tele birr',
  'Nib',
  'Zemen',
  'Hibret',
  'Ebirr',
  'Abay',
  'Birhan',
];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: styles.bgColor,
        appBar: AppBar(
          backgroundColor:Colors.lightGreen,
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Done',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold, // Make the text bold
                  
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          children:[
          Container(
            color:Colors.lightGreen,
            height:210,
            child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle, // Circular shape
                      color: Colors.white, // Green color
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.green, // White color for the icon
                      ),
                    ),
                  ),
                  const SizedBox(height: 8), // Add some space between the icon and the text
                  const Center(
                    child: Text(
                      "Your booking is confirmed",
                      textAlign: TextAlign.center, // Center-align the text
                      style:TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.bold,
                      )
                     
                    ),
                  ),
          
                  const SizedBox(height: 10), 
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Text("Mar 16,7:30 AM",style:TextStyle(
                          color:Colors.white,
                        )),
                        Text("Normal",style:TextStyle(
                          color:Colors.white,
                        )),
                      ]
                    ),
                  ),
                   const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Text("Adiss Abeba",style:TextStyle(
                            color:Colors.white,
                          )),
                           Icon(
                              Icons.arrow_forward,
                             color: Colors.white, // White color for the icon
                             size:40,
                           ),
                          Text("Dire Dawa",style:TextStyle(
                            color:Colors.white,
                          )),
          
          
                    ], 
                    ),
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle, // Circular shape
                      color: Colors.white, // Green color
                    ),
                  ),
                ],
              ),
          ),
          Padding(
           padding: const EdgeInsets.all(15.0),
           child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), // Add border radius for curve effect
                  color: Colors.white, // Add background color
                ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "  Booking Reference: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Text(
                      "xyzabc  ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(const ClipboardData(text: "xyzabc"));
                        // Show a toast or any other feedback to indicate successful copy
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Text copied to clipboard'),
                        ));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right:10.0),
                        child: Icon(Icons.content_copy),
                      ), // Icon for copying
                    ),
                  ],
                ),
              ),
            ),

          Padding(
           padding: const EdgeInsets.all(15.0),
           child: Container(
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), // Add border radius for curve effect
                  color: Colors.white, // Add background color
                ),
                child:Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "  Payment instruction: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Divider(),
                    const Text(
                      "If you need any assistance with your payment, process please contact us with Ethiodjbuti@gmail.com",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),

                    const Text(
                      "Note:If you have trouble when making the payment with the bank you selecetd you can use the below list  of alternative banks",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),

                    SizedBox(
                    height: 200, // Define the height of the ListView
                    child: ListView.builder(
                      itemCount: bankNames.length,
                      itemBuilder: (context, index) {
                        return Text(
                          '- ${bankNames[index]}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        );
                      },
                    ),
                  )

                  ],
                ),
              ),
            ),
             
          ]
       ),

      );
  }
}