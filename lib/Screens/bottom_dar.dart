import 'package:book_train_ticket/Screens/passenger_conirm.dart';
import 'package:book_train_ticket/Screens/see_ticket_details.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'book_ticket.dart';
import 'home_screen.dart';
import 'mytrip.dart';
import 'other_passengers.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}):super(key:key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _selectedIndex=0;

  static final List<Widget> _widgtoption=<Widget>[
    const Home_screen(),
    const bookTicket(),
    const PassengerConfrim(),
    const OtherPassengers(),
  ];

  void _onItemTapeed(int index){
    _selectedIndex=index;
     setState(() {
       _selectedIndex=index;
       //print('$_selectedIndex');
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Center(
          child: _widgtoption[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:_selectedIndex,
        onTap: _onItemTapeed,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.grey,
        unselectedItemColor: const Color(0XFF526480),

        items: const [

        BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
            activeIcon:Icon (FluentSystemIcons.ic_fluent_home_filled),
            label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.train_outlined),
            activeIcon:Icon (Icons.train),
            label: "Book"),
        BottomNavigationBarItem(icon: Icon(Icons.directions_walk),
            activeIcon:Icon (Icons.directions_walk_sharp),
            label: "ticket"),
        BottomNavigationBarItem(icon:  Icon(FluentSystemIcons.ic_fluent_ticket_regular),
          activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
          label: "trip")

        ],

      ),
    );
  }
}
