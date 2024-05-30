import 'dart:convert';

import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Database/chapa_web.dart';
import '../Database/city_abrivation.dart';

class Payment extends StatefulWidget {
  List<Map<String, dynamic>> user;
  final String departureplace;
  final String arrivalplace;
  final DateTime dateTime;
  final int price;

  Payment(
      {super.key,
      required this.user,
      required this.arrivalplace,
      required this.departureplace,
      required this.dateTime,
      required this.price});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late String formattedDate;
  final TextEditingController _FirstNameController = TextEditingController();
  final TextEditingController _LastNameController = TextEditingController();
  final TextEditingController _emailtextfieldcontroller =
      TextEditingController();
  final TextEditingController _phonetextfieldcontroller =
      TextEditingController();
  int selectedIndex =
      0; // Initialize selectedIndex with -1 to indicate no selection
  final TextEditingController _textBankController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool agreeToTerms = false;
  bool isVisible = false;

  List<Map<String, dynamic>> banks = [
    {'name': 'Abbysiniya Bank', 'imageUrl': 'image/Abby.png'},
    {'name': 'Chapa', 'imageUrl': 'image/ChapaLogo.png'},
    {'name': 'CBE Bank', 'imageUrl': 'image/cbe.jpg'},
    {'name': 'Dashen Bank', 'imageUrl': 'image/Dashen.jpg'},
    {'name': 'Amhara Bank', 'imageUrl': 'image/amhara.png'},
    {'name': 'Apolo ', 'imageUrl': 'image/apolo.jpg'},
    {'name': 'Awash Bank', 'imageUrl': 'image/awashlogo.png'},
    {'name': 'Wegagen Bank', 'imageUrl': 'image/wega.png'},
    {'name': 'Coop Bank', 'imageUrl': 'image/coop.png'},
    {'name': 'M-pesa', 'imageUrl': 'image/mpesa.png'},
    {'name': 'Tele birr', 'imageUrl': 'image/telebirr.jpg'},
    {'name': 'Nib Bank', 'imageUrl': 'image/nib.png'},
    {'name': 'Zemen Bank', 'imageUrl': 'image/zemen.png'},
    {'name': 'Hibret Bank', 'imageUrl': 'image/hibret.jpg'},
    {'name': 'E-birr', 'imageUrl': 'image/ebirr.png'},
    {'name': 'Abay Bank', 'imageUrl': 'image/abay.png'},
    {'name': 'Birhan Bank', 'imageUrl': 'image/birhan.png'},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formattedDate = DateFormat('MMM d, y').format(widget.dateTime);

    _FirstNameController.text = widget.user[0]['Firstname'];
    _LastNameController.text = widget.user[0]['Lastname'];
    _emailtextfieldcontroller.text = widget.user[0]['Email'];
    _phonetextfieldcontroller.text = widget.user[0]['phone'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styles.bgColor,
      appBar: AppBar(
        leading: const BackButton(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Payment"),
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(CityAbbreviation.getAbbreviation(
                        widget.departureplace)),
                    const Icon(Icons.arrow_forward),
                    Text(CityAbbreviation.getAbbreviation(widget.arrivalplace)),
                    const Spacer(),
                    const Text("  Price"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formattedDate),
                    Text('${widget.price} ETB'),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                Row(
                  children: [
                    Text(
                      "payment options",
                      style:
                          styles.headLineStyle3.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: SizedBox(
                      height: 750, // Specify the height of the GridView
                      child: GridView.count(
                        crossAxisCount: 3,
                        // Number of columns
                        mainAxisSpacing: 10.0,
                        // Spacing between rows
                        crossAxisSpacing: 15.0,
                        // Spacing between columns
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        // Disable GridView scrolling
                        children: List.generate(banks.length, (index) {
                          Map<String, dynamic> bank = banks[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex =
                                    index; // Update selectedIndex when an item is tapped
                                isVisible = true;
                                _scrollController.animateTo(
                                  _scrollController.position.maxScrollExtent,
                                  // Adjust as needed
                                  duration: const Duration(milliseconds: 500),
                                  // Adjust the duration as needed
                                  curve: Curves
                                      .easeInOut, // Adjust the curve as needed
                                );
                              });
                              _textBankController.text = banks[index]['name'];
                            },
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    // Black border
                                    color: Colors.white,
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(bank['imageUrl']),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    width: 20,
                                    // Adjust the size of the circle as needed
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.grey),
                                      // Black border
                                      color: selectedIndex == index
                                          ? Colors.blue
                                          : Colors.transparent,
                                      // Change the color of the circle as needed
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: _textBankController,
                                      keyboardType: TextInputType.text,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  // Add some space between the bank name and logo

                                  Image.asset(
                                    banks[selectedIndex]['imageUrl'],
                                    // Replace 'assets/bank_logo.png' with the actual asset path for the bank logo
                                    width: 70,
                                    // Adjust the width of the logo as needed
                                    height:
                                        70, // Adjust the height of the logo as needed
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: _FirstNameController,
                                decoration: const InputDecoration(
                                  labelText: "First name*",
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  fillColor: Colors.grey,
                                ),
                                validator: (value) {
                                  if (value!.isNotEmpty && value.length > 2) {
                                    return null;
                                  } else if (value.isEmpty) {
                                    return "First name required";
                                  } else {
                                    return "First name to short";
                                  }
                                },
                                cursorColor: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: _LastNameController,
                                decoration: const InputDecoration(
                                  labelText: "last name*",
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  fillColor: Colors.grey,
                                ),
                                validator: (value) {
                                  if (value!.isNotEmpty && value.length > 2) {
                                    return null;
                                  } else if (value.isEmpty) {
                                    return "First name required";
                                  } else {
                                    return "First name to short";
                                  }
                                },
                                cursorColor: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: _emailtextfieldcontroller,
                                decoration: const InputDecoration(
                                  labelText: "Email*",
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  fillColor: Colors.grey,
                                ),
                                validator: (value) {
                                  if (value!.isNotEmpty && value.length > 2) {
                                    return null;
                                  } else if (value.isEmpty) {
                                    return "First name required";
                                  } else {
                                    return "First name to short";
                                  }
                                },
                                cursorColor: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: _phonetextfieldcontroller,
                                decoration: const InputDecoration(
                                  labelText: "phone number*",
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  fillColor: Colors.grey,
                                ),
                                validator: (value) {
                                  if (value!.isNotEmpty && value.length > 2) {
                                    return null;
                                  } else if (value.isEmpty) {
                                    return "First name required";
                                  } else {
                                    return "First name to short";
                                  }
                                },
                                cursorColor: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5.0, left: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons
                              .info, // Icon to display (replace with the desired icon)
                          // Color of the icon (optional)
                        ),
                        SizedBox(width: 5),
                        // Add some space between the icon and text
                        Text(
                          "Receipt is applicable only in Ethiopia", // Text to display
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Visibility(
                    visible: isVisible,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: agreeToTerms,
                                    onChanged: (value) {
                                      setState(() {
                                        agreeToTerms = value!;
                                      });
                                    },
                                  ),
                                  const Text(
                                      "I agree to fare Rules and Term and conditions"),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: agreeToTerms
                                  ? () async {

                                var headers = {
                                  'Authorization': 'Bearer CHASECK_TEST-aptf5Itc3nwUpr8xC45mGhsqiUaRnbog',
                                  'Content-Type': 'application/json'
                                };
                                var requestBody = {
                                  "amount": "100",
                                  "currency": "ETB",
                                  "email": "abebech_bekele@gmail.com",
                                  "first_name": "Bilen",
                                  "last_name": "Gizachew",
                                  "phone_number": "0912345678",
                                  "tx_ref": "chewatatest-${DateTime.now().millisecondsSinceEpoch}",
                                  "callback_url": "https://webhook.site/077164d6-29cb-40df-ba29-8a00e59a7e60",
                                  "return_url":"",
                                  "customization[title]": "Payment for my favourite merchant",
                                  "customization[description]": "I love online payments"
                                };

                                try {
                                  var response = await http.post(
                                    Uri.parse('https://api.chapa.co/v1/transaction/initialize'),
                                    body: jsonEncode(requestBody), // Encode the request body
                                    headers: headers,
                                  ).timeout(const Duration(seconds: 30), onTimeout: () => throw 'Timeout');

                                  var result = jsonDecode(response.body);
                                  log(response.body.toString());
                                  if (response.statusCode == 200) {
                                    String url = result['data']['checkout_url'];
                                    var res = await ChapaWeb(
                                      url: url,
                                      transactionReference: "chewatatest-${DateTime.now().millisecondsSinceEpoch}",
                                      amountPaid: '100',
                                    ).launch(context);

                                    toast(res['message']);
                                    pop();
                                  } else {
                                    print(response.reasonPhrase);
                                    // Handle other status codes if needed
                                  }
                                } catch (e) {
                                  toast(e.toString(), print: true);
                                }

                              }
                                  : null,
                              // Disable the button if terms are not agreed
                              style: ElevatedButton.styleFrom(
                                shadowColor:
                                    agreeToTerms ? Colors.green : Colors.grey,
                                // Background color of the button
                                elevation: 0,
                                // No shadow for the button
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20), // Rounded corners for the button
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Continue",
                                    style: TextStyle(
                                      fontSize: 15,
                                      letterSpacing: 2,
                                      color: agreeToTerms
                                          ? Colors.blue
                                          : Colors
                                              .white, // Text color of the button
                                    ),
                                  ),
                                  if (agreeToTerms)
                                    const Icon(
                                      Icons.check,
                                      color: Colors.blue,
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
