import 'package:book_train_ticket/Screens/book_ticket.dart';
import 'package:book_train_ticket/Screens/faq_screen.dart';
import 'package:book_train_ticket/Screens/seatpage.dart';
import 'package:book_train_ticket/Screens/ticket_view.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../Database/databse.dart';
import '../utils/app_info_list.dart';
import '../utils/conncetion.dart';
import 'Cancel_ticket.dart';
import 'city_screen.dart';
import 'feedback.dart';
import 'find_my_ticket.dart';
import 'notification.dart';

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
  late bool _isConnected = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: styles.bgColor,
      appBar: AppBar(
        title: const Center(
          child: Text("Ethio-Djibouti Railway Ticket"),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.grey[200], // Background color
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0XFF526799), // Background color for header
                  image: DecorationImage(
                    image: AssetImage('image/imag5.jpg'), // Background image for header
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Ethio-Djibouti Railway",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white, // Text color
                      fontWeight: FontWeight.bold, // Text weight
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.list_alt_sharp, color: Colors.blueAccent),
                title: const Text(
                  "Train Schedule",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(
                        selectedDay: 0,
                        numberOfAdult: 1,
                        numberofChild: 0,
                        dateTime: DateTime.now(),
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.train, color: Colors.blueAccent),
                title: const Text(
                  "Find Ticket",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const bookTicket(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications, color: Colors.blueAccent),
                title: const Text(
                  "Notification",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Notifications(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.airline_seat_recline_normal_rounded, color: Colors.blueAccent),
                title: const Text(
                  "Available Seat",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeatDisplayPage(date: DateTime.now(), departureplace: '', seat: [], Cargo: '', travelClass: '', price: 0, user: [], arrivalplace: '',),
                    ),
                  );
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.cancel, color: Colors.blueAccent),
                title: const Text(
                  "Cancel Ticket",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CancelTicket(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.format_list_bulleted, color: Colors.blueAccent),
                title: const Text(
                  "Generate Ticket",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FindMyTicket(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.message_rounded, color: Colors.blueAccent),
                title: const Text(
                  "Feedback",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  // Add your onTap function here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FeedbackCollector(),
                    ),
                  );

                },
              ),
              ListTile(
                leading: const Icon(Icons.question_mark_rounded, color: Colors.blueAccent),
                title: const Text(
                  "FAQ",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FAQScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
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
                        SizedBox(
                          width: screenWidth*0.78,
                          child: Text(
                            "Book your Tickets Now",
                            style: styles.headLineStyle1,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("image/image1.jpg"),
                          ),
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
                     bool isConnected = await FindTicket.findTicket();
                      setState(() {
                        _isConnected = isConnected;
                      });

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
                    backgroundColor: Colors.black12,
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
                      "Tickets",
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
          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>MyApp(selectedDay: 0, numberOfAdult: 1, numberofChild: 0, dateTime: DateTime.now())));
            },
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                  children: ticketList
                      .map((singelticket) => TicketView(ticket: singelticket))
                      .toList()),
            ),
          ),
          const Gap(20),
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
          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>const bookTicket()));
            },
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                  children: cityList
                      .map((singlecity) => CityScreen(city: singlecity))
                      .toList()),
            ),
          ),
          const Gap(15),
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
}
