import 'package:book_train_ticket/Screens/schedle_list.dart';
import 'package:book_train_ticket/Screens/seat_display.dart';
import 'package:book_train_ticket/Screens/ticket_view.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import '../utils/app_info_list.dart';
import 'city_screen.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styles.bgColor,
      appBar: AppBar(
        title: const Center(
          child: Text("Ethio-Djibuti Railway Ticket"),
        ),
      ),
      drawer: Drawer(

        child: ListView(
          children:  [
            const DrawerHeader(
              child: Center(
                child: Text(
                  "Ethio-Djibuti Railway",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),

            ),
            ListTile(
              leading: const Icon(Icons.list_alt_sharp),
              title: const Text("Train Schedule",style: TextStyle(fontSize: 20),),
              onTap: (){

              },
            ),
            ListTile(
              leading: const Icon(Icons.train),
              title: const Text("Find ticket",style: TextStyle(fontSize: 20),),
              onTap: (){

              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text("Notification",style: TextStyle(fontSize: 20),),
              onTap: (){

              },
            ),
            ListTile(
              leading: const Icon(Icons.airline_seat_recline_normal_rounded),
              title: const Text("Available seat",style: TextStyle(fontSize: 20),),
              onTap: (){

              },
            ),

            const Divider(),
            ListTile(
              leading: const Icon(Icons.airline_seat_recline_normal_rounded),
              title: const Text("About us",style: TextStyle(fontSize: 20),),
              onTap: (){

              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_phone_rounded),
              title: const Text("Contact Us",style: TextStyle(fontSize: 20),),
              onTap: (){

              },
            ),
            ListTile(
              leading: const Icon(Icons.message_rounded),
              title: const Text("Feedback",style: TextStyle(fontSize: 20),),
              onTap: (){

              },
            ),
            ListTile(
              leading: const Icon(Icons.question_mark_rounded),
              title: const Text("FAQ",style: TextStyle(fontSize: 20),),
              onTap: (){

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
                          image: AssetImage("image/image1.jpg"),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(30),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: TextFormField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.calendar_month),
                        labelText: "Departure date",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        )),
                    validator: (value) {},
                    onTap: () {
                      _selectDate();
                    },
                  ),
                ),
                const Gap(30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const seatDisplay()));
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
                            builder: (context) => const schedule(),
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
                    .map((singlecity) => cityScreen(city: singlecity))
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
                onTap: () {},
                child: const FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
              const FaIcon(
                FontAwesomeIcons.twitter,
                color: Colors.blue,
                size: 35,
              ),
              const FaIcon(
                FontAwesomeIcons.google,
                size: 35,
              ),
              const FaIcon(
                FontAwesomeIcons.instagram,
                color: Colors.brown,
                size: 35,
              ),
            ],
          ),
          const Gap(20),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}
