import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:book_train_ticket/Screens/payment_confrim.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Database/chapa_web.dart';
import '../Database/city_abrivation.dart';
import '../Database/savePassenger.dart';
import '../SeatAvilablity/create_colection.dart';
import '../utils/app_info_list.dart';
import '../utils/shared_preference.dart';

class Payment extends StatefulWidget {
  List<Map<String, dynamic>> user;
  final String departureplace;
  final String arrivalplace;
  final DateTime dateTime;
  final int price;
  final String travelClass;
  final String Cargo;
  final List<int> seat;
  final String TransactionRefrence;

  Payment(
      {super.key,
      required this.user,
      required this.arrivalplace,
      required this.departureplace,
      required this.dateTime,
      required this.price,
      required this.travelClass,
      required this.Cargo,
      required this.seat,
      required this.TransactionRefrence});

  @override
  State<Payment> createState() => _PaymentState();
}

int calculateAge(String birthDate) {
  DateTime today = DateTime.now();
  List<String> birthDateParts = birthDate.split('-');
  int birthYear = int.parse(birthDateParts[0]);
  int birthMonth = int.parse(birthDateParts[1]);
  int birthDay = int.parse(birthDateParts[2]);

  int age = today.year - birthYear;

  // Check if the birthday hasn't occurred yet this year
  if (birthMonth > today.month ||
      (birthMonth == today.month && birthDay > today.day)) {
    age--;
  }

  return age;
}

//string generate
String generateUniqueString() {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  Random random = Random();
  return String.fromCharCodes(
    Iterable.generate(
      7,
      (_) => chars.codeUnitAt(random.nextInt(chars.length)),
    ),
  );
}

class _PaymentState extends State<Payment> {
  late String formattedDate;
  String bookingReference = '';
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
  bool isLoading = false;
  bool isVerifying = false;

  final String transactionId =
      "passenger-${DateTime.now().millisecondsSinceEpoch}";
  String documentId = 'Notify-${DateTime.now().millisecondsSinceEpoch}';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formattedDate = DateFormat('MMM d, y').format(widget.dateTime);
    _FirstNameController.text = widget.user[0]['Firstname'];
    _LastNameController.text = widget.user[0]['Lastname'];
    _emailtextfieldcontroller.text = widget.user[0]['Email'];
    _phonetextfieldcontroller.text = widget.user[0]['phone'];
    setState(() {
      bookingReference = generateUniqueString();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: styles.bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                    SizedBox(
                        width: screenWidth * 0.3, child: Text(formattedDate)),
                    SizedBox(
                      width: screenWidth * 0.2,
                    ),
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
                                  duration: const Duration(milliseconds: 300),
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
                                  SizedBox(
                                    width: screenWidth * 0.1,
                                    child: Checkbox(
                                      value: agreeToTerms,
                                      onChanged: (value) {
                                        setState(() {
                                          agreeToTerms = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  const Expanded(
                                    child: Text(
                                        "I agree to Rules and Term and conditions"),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: agreeToTerms
                                  ? () async {
                                      if (banks[selectedIndex]["name"] ==
                                          "Chapa") {
                                        chapaCo();
                                      } else if (banks[selectedIndex]["name"] ==
                                          "Tele birr") {
                                      } else {
                                        triggerNotification();
                                        saveNotificationToFirestore(
                                            'Book Reference is:',
                                            bookingReference);
                                        saveDocumentIds(documentId);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PaymentConfrim(
                                              user: widget.user,
                                              departure: widget.departureplace,
                                              arrival: widget.arrivalplace,
                                              bookingReference:
                                                  bookingReference,
                                              paymentOption:
                                                  banks[selectedIndex]["name"],
                                            ),
                                          ),
                                        );
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

  void triggerNotification() {
    //print(bookingReference);
    try {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title:
              'Hello, MR/MS ${widget.user[0]["Firstname"]} your Book Reference is:',
          body:
              '$bookingReference \n\n You can pay ur transaction using this  7 length reference code and also this code is valid only for 24 HRS.\n Make sure you Paid the transaction with in the next 24 HRS!!!',
          notificationLayout: NotificationLayout
              .BigText, // This allows the notification to show expanded text
        ),
      );
    } catch (e) {
      //print('Error creating notification: $e');
    }
  }

  void chapaCo() async {
    setState(() {
      isLoading = true;
    });

    var url = Uri.parse('https://api.chapa.co/v1/transaction/initialize');
    var headers = {
      HttpHeaders.authorizationHeader:
          'Bearer CHASECK_TEST-aptf5Itc3nwUpr8xC45mGhsqiUaRnbog',
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    };

    var request = {
      'amount': widget.price,
      'currency': 'ETB',
      'email': widget.user[0]["Email"],
      'first_name': widget.user[0]["Firstname"], // Corrected typo
      'phone_number': widget.user[0]["Phone"],
      'tx_ref': transactionId,
      'customization': {
        'title': 'Train Ticket',
        'description': 'I love online payments.',
      },
    };

    try {
      var response =
          await http.post(url, body: jsonEncode(request), headers: headers);
      var result = jsonDecode(response.body);
      log(response.body.toString());

      if (result['status'] == 'success') {
        String paymentUrl = result['data']['checkout_url'];
        var res = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChapaWeb(
                    url: paymentUrl,
                    transactionReference: transactionId,
                    amountPaid: widget.price,
                  )),
        );
        verifyPayment(transactionId, res['message']); // Pass the transaction ID
      } else {
        setState(() {
          isLoading = false;
        });
        log("Failed to initialize payment: ${result['message']}");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      log(e.toString());
    }
  }

  void verifyPayment(String transactionId, String message) async {
    setState(() {
      isVerifying = true; // Start verification
    });
    const chapaVerifyUrl = 'https://api.chapa.co/v1/transaction/verify/';
    var headers = {
      HttpHeaders.authorizationHeader:
          'Bearer CHASECK_TEST-aptf5Itc3nwUpr8xC45mGhsqiUaRnbog',
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    };
    var url = Uri.parse('$chapaVerifyUrl$transactionId');

    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['status'] == 'success') {
          if (message == 'paymentSuccessful') {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text(
                  'PAYMENT',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: const Text("YOUR PAYMENT IS SUCCESSFULLY DELIVERED"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(widget.dateTime);
                      NotificationSucessfullpayment();
                      updateFirestore();
                      updateSeatStatus(
                          context, widget.Cargo, widget.seat, formattedDate);
                      saveNotificationToFirestore(
                          'Your ticket Reference \n You can find your ticket with this number',
                          transactionId);
                      saveDocumentIds(documentId);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SavePassenger(
                            user: widget.user,
                            departurePlace: widget.departureplace,
                            arrivalPlace: widget.arrivalplace,
                            travelClass: widget.travelClass,
                            cargo: widget.Cargo,
                            seat: widget.seat,
                            price: '${widget.price}',
                            date: '${widget.dateTime}',
                            textReference: transactionId,
                            paymentoption: banks[selectedIndex]["name"],

                          ),
                        ),
                      );
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        }
      }
    } catch (error) {
      // Handle any other errors
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            'ERROR',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text("AN ERROR OCCURRED. PLEASE TRY AGAIN."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      log("Exception occurred: $error");
    }
    setState(() {
      isVerifying = false; // Start verification
    });
  }

  Future<void> updateSeatStatus(BuildContext context, String cargoId,
      List<int> seatNumbers, String date) async {
    try {
      await TrainTicketManager()
          .updateSeatStatusToTaken(cargoId, seatNumbers, date);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Seat statuses updated to taken for seats $seatNumbers on date $date for cargo $cargoId. Thank you!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating seat statuses: $e. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void NotificationSucessfullpayment() {
    try {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title:
              'Hello, MR/MS ${widget.user[0]["Firstname"]} you ticket reference is:',
          body:
              '$transactionId \n\n You can generate your ticket based on this number Thank u',
          notificationLayout: NotificationLayout
              .BigText, // This allows the notification to show expanded text
        ),
      );
    } catch (e) {
      //print('Error creating notification: $e');
    }
  }

  Future<void> updateFirestore() async {
    setState(() {
      isLoading = true;
    });

    try {
      CollectionReference<Map<String, dynamic>> passengersCollection =
          FirebaseFirestore.instance.collection("user");

      // Query the collection to find documents with the given Ticket Reference
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await passengersCollection
              .where('Ticket Reference', isEqualTo: widget.TransactionRefrence)
              .get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> document
          in querySnapshot.docs) {
        // Update only the specified fields in each document
        await passengersCollection.doc(document.id).update({
          'status': 'Paid',
          'Payment Option': 'chapa',
          'Book Reference': '',
          'Ticket Reference': widget.TransactionRefrence,
        });
      }
      setState(() {
        isLoading = false; // Hide spinner when saving is complete
      });
    } catch (e) {
      setState(() {
        isLoading = false; // Hide spinner when an error occurs
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error updating Firestore::'),
      ));
    }
  }

  // Function to save notification to Firestore with a timestamp
  void saveNotificationToFirestore(String message, String referenceNumber) {
    setState(() {
      isLoading = true;
    });
    try {
      String dateString = DateFormat('yyyy-MM-dd').format(widget.dateTime);

      // Generate the reference number and get its timestamp
      DateTime timestamp = DateTime.now();

      // Save notification to Firestore with the reference number
      CollectionReference<Map<String, dynamic>> notificationsCollection =
          FirebaseFirestore.instance.collection("notifications");

      notificationsCollection.doc(documentId).set({
        'message': message,
        'reference': referenceNumber,
        'timestamp': timestamp.toIso8601String(),
        // Store timestamp in ISO 8601 format
        'Date': dateString,
      }).then((_) {
        setState(() {
          isLoading = false;
        });
      }).catchError((error) {
        setState(() {
          isLoading = false;
        });
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  void saveDocumentIds(String documentIds) async {
    final bookingStorage = BookingStorage();
    await bookingStorage.addNotificationDocumentId(documentIds);
  }
}
