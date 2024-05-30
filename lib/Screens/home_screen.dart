

import 'package:book_train_ticket/Screens/book_ticket.dart';
import 'package:book_train_ticket/Screens/faq_screen.dart';
import 'package:book_train_ticket/Screens/notification.dart';

import '../Database/ticket_generate.dart';
import 'Cancel_ticket.dart';
import 'ticket_generate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:book_train_ticket/Screens/seat_display.dart';
import 'package:book_train_ticket/Screens/ticket_view.dart';
import 'package:book_train_ticket/utils/app_style.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import '../Database/databse.dart';
import '../utils/app_info_list.dart';
import 'city_screen.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {

  late int selectedDate;
  final TextEditingController _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late DateTime dateTime;
  bool _isConnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styles.bgColor,
      appBar: AppBar(
        title: const Center(
          child: Text("Ethio-Djibouti Railway Ticket"),
        ),
      ),
      drawer: Drawer(
        ///////////////////////////////////////////menu
        child: ListView(
          children: [
            const DrawerHeader(
              child: Center(
                child: Text(
                  "Ethio-Djibouti Railway",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.list_alt_sharp),
              title: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyApp(selectedDay: 0, numberOfAdult: 1, numberofChild: 0, dateTime: DateTime.now())
                    ),
                  );
                },
                child: const Text(
                  "Train Schedule",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.train),
              title: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const bookTicket(),
                      ),
                    );
                  },
                  child: const Text(
                    "Find ticket",
                    style: TextStyle(fontSize: 20),
                  )),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>CancelTicket(),
                    ),
                  );
                },
                child: const Text(
                  "Notification",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.airline_seat_recline_normal_rounded),
              title: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const seatDisplay(),
                    ),
                  );
                },
                child: const Text(
                  "Available seat",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.cancel),
              title: const Text(
                "Cancel Ticket",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CancelTicket()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.format_list_bulleted),
              title: const Text(
                "Generate Ticket",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Navigate to the Generate Ticket screen
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TicketPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.message_rounded),
              title: const Text(
                "Feedback",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.question_mark_rounded),
              title: const Text(
                "FAQ",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FAQScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lets travel together",
                          style: styles.headLineStyle3,
                        ),
                        const Gap(5),
                        Text(
                          "Book your Tickets Now",
                          style: styles.headLineStyle1,
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("image/EDR.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(30),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _dateController,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.calendar_month),
                        labelText: "Departure date",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) { // Check if value is null or empty
                          return "Date is required";
                        } else {
                          return null;
                        }
                      },
                      onTap: () {
                        _selectDate();
                      },
                    ),
                  ),
                ),
                const Gap(30),
                ElevatedButton(
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    else {

                     // bool isConnected = await FindTicket.findTicket();
                     //  setState(() {
                     //    _isConnected = isConnected;
                     //  });

                      if(_isConnected){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>MyApp(selectedDay:selectedDate, numberOfAdult: 1, numberofChild: 0, dateTime:dateTime,)));
                        _clearTextField();
                      }
                      else {
                        // Show snack bar for no internet connection
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('No internet connection!'),
                            duration: Duration(seconds: 3), // Adjust duration as needed
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Center(
                    child: Text(
                      "Find Ticket",
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Upcoming",
                      style: styles.headLineStyle2,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  MyApp(numberOfAdult: 1, numberofChild: 0, selectedDay: null, dateTime:DateTime.now(),),
                          ),
                        );
                      },
                      child: Text(
                        "view all",
                        style: styles.textStyle
                            .copyWith(color: styles.primaryColor),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Gap(15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(right: 20),
            child: Row(
                children: ticketList
                    .map((singelticket) => TicketView(ticket: singelticket))
                    .toList()),
          ),
          const Gap(15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Visit With us",
                  style: styles.headLineStyle2,
                ),
              ],
            ),
          ),
          const Gap(15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(right: 20),
            child: Row(
                children: cityList
                    .map((singlecity) => CityScreen(city: singlecity))
                    .toList()),
          ),
          const Gap(15),
          Row(
            children: [
              const Expanded(child: Divider()),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Text(
                  "Contact us with",
                  style: styles.headLineStyle3.copyWith(color: Colors.black),
                ),
              ),
              const Expanded(child: Divider()),
            ],
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  _launchFacebookURL();
                },
                child: const FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("Twitter");
                },
                child: const FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("Google");
                },
                child: const FaIcon(
                  FontAwesomeIcons.google,
                  size: 35,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("Instagram");
                },
                child: const FaIcon(
                  FontAwesomeIcons.instagram,
                  color: Colors.brown,
                  size: 35,
                ),
              ),
            ],
          ),
          const Gap(20),
        ],
      ),
    );
  }

  void _clearTextField() {
    _dateController.clear();
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        int day = picked.day;
        int month = picked.month;
        int year = picked.year;

        int currentday = DateTime.now().day;
        int currentmonth = DateTime.now().month;
        int currentyear = DateTime.now().year;

        if (currentyear != year) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Year Mismatch'),
                content: const Text('please select the current year and current month'),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
        else if(currentyear==year && month==currentmonth){
          selectedDate=day-currentday;

        }
        _dateController.text = picked.toString().split(" ")[0];
        dateTime=picked;

      });
    }
  }

  // Function to launch the Facebook URL
  void _launchFacebookURL() async {
    const url = 'https://www.facebook.com/'; // Change the URL to your Facebook page
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
