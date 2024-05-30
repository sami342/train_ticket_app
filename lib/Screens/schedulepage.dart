import 'package:flutter/material.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart'; // Import DateFormat for date formatting
import 'package:shimmer/shimmer.dart';
import '../Database/city_abrivation.dart';
import '../Database/my_data.dart';
import '../widget/ticket_container.dart';
import 'other_passengers.dart'; // Import Shimmer for loading effects

class SchedulePage extends StatefulWidget {
  final List<MyData> datalist;
   final DateTime datetime;
  final int? selectedDate;
  final int? numberofChild;
  final int? numberOfAdult;

  const SchedulePage(
      {Key? key,
      required this.datalist,
      required this.selectedDate,
      required this.numberOfAdult,
      required this.numberofChild,
      required this.datetime});

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late DateTime _currentDate;
  bool _isLoading = true;
  final int numberOfDaysInWeek = 7;
  bool isOddDay = false;
  List<DateTime> tabDates = [];
  late String formatted;
  late DateTime selectedDate;
  bool isIndex=false;

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
    _tabController = TabController(length: numberOfDaysInWeek, vsync: this);
    // Simulate data loading delay
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false; // Set loading state to false after delay
        // Find the difference in days between the selected date and the current date
        if (widget.selectedDate != null) {
          int selectedIndex = widget.selectedDate!;
          if (selectedIndex >= 0 && selectedIndex < numberOfDaysInWeek) {
            _tabController.index = selectedIndex;
          } else {
            // Handle out-of-range index
            if (selectedIndex >= numberOfDaysInWeek) {
              // Show message dialogue indicating that the date must be within the week
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Invalid Date'),
                    content: const Text(
                        'The selected date must be within the current week.'),
                    actions: <Widget>[
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
            } else {
              // Handle other out-of-range scenarios

            }
          }
        }

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styles.bgColor,
      appBar: AppBar(
        title: const Center(child: Text('Schedule')),
      ),
      body: _isLoading // Show shimmer effect if loading
          ? _buildShimmerEffect() // Build shimmer effect
          : DefaultTabController(
              length: 7,
              child: Column(
                children: [
                  // Display the TabBar
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabs: _buildTabs(), // Build tabs for a single week
                  ),
                  // Display the TabBarView
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children:
                          _buildTabBarViews(), // Build TabBarViews for a single week
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  // Function to build shimmer effect
  Widget _buildShimmerEffect() {
    return ListView.builder(
      itemCount: widget.datalist.length, // Number of shimmer items
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListTile(
            title: Container(
              height: 20.0,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildTabs() {
    List<Widget> tabs = [];
    tabDates.clear(); // Clear tabDates list before populating it
    for (int i = 0; i < numberOfDaysInWeek; i++) {
      final currentDate = _currentDate.add(Duration(days: i));
      tabDates.add(currentDate); // Store the date in the list

      if (currentDate.day % 2 == 0) {
        isOddDay = true;
      } else {
        isOddDay = false;
      }
      tabs.add(
        Tab(
          text: _getTabText(currentDate), // Get formatted text for tab
        ),
      );
    }
    return tabs;
  }


  // Function to build TabBarViews for a single week
  List<Widget> _buildTabBarViews() {
    List<Widget> tabBarViews = [];
    for (int i = 0; i < numberOfDaysInWeek; i++) {
      final currentDate = _currentDate.add(Duration(days: i));
      final isOddDay = currentDate.day % 2 == 1;
      tabBarViews.add(
        // For each day, display a Card widget with dynamically built ListView
        ListView.builder(
          itemCount: widget.datalist.length, // Number of destinations
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ExpansionTile(
                title: ListTile(
                  title: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isOddDay
                                ? CityAbbreviation.getAbbreviation(
                                    widget.datalist[index].departure)
                                : CityAbbreviation.getAbbreviation(
                                    widget.datalist[index].arrivalplace),
                            style: styles.headLineStyle3
                                .copyWith(color: Colors.black),
                          ),
                          Expanded(child: Container()),
                          const TicketContainer(),
                          Expanded(
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 24,
                                  child: LayoutBuilder(
                                    builder: (BuildContext context,
                                        BoxConstraints constrainsts) {
                                      return Flex(
                                        direction: Axis.horizontal,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: List.generate(
                                          (constrainsts.constrainWidth() / 6)
                                              .floor(),
                                          (index) => const SizedBox(
                                            width: 3,
                                            height: 1,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const Center(
                                  child: Icon(
                                    Icons.train,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const TicketContainer(),
                          Expanded(child: Container()),
                          Text(
                            isOddDay
                                ? CityAbbreviation.getAbbreviation(
                                    widget.datalist[index].arrivalplace)
                                : CityAbbreviation.getAbbreviation(
                                    widget.datalist[index].departure),
                            style: styles.headLineStyle3
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                      const Gap(3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(isOddDay
                              ? widget.datalist[index].departure
                              : widget.datalist[index].arrivalplace),
                          const Icon(Icons.double_arrow_outlined),
                          const Icon(Icons.double_arrow_outlined),
                          Text(isOddDay
                              ? widget.datalist[index].arrivalplace
                              : widget.datalist[index].departure),
                        ],
                      ),
                      const Gap(15),
                    ],
                  ),
                  subtitle: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "12 HR",
                            style: styles.headLineStyle4
                                .copyWith(color: Colors.black12),
                          ),
                          Text(
                            widget.datalist[index].price,
                            style: styles.headLineStyle4
                                .copyWith(color: Colors.lightGreen),
                          ),
                        ],
                      ),
                      const Gap(2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Travel Time",
                            style: styles.headLineStyle3
                                .copyWith(color: Colors.black),
                          ),
                          Text(
                            "Price",
                            style: styles.headLineStyle3
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: const EdgeInsets.only(left: 10),
                children: [
                  const Center(
                    child: Text(
                      "VIP Cargo",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(" Refund Fee"),
                            Gap(180),
                            Text(" 300ETB"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(" Change Fee"),
                            Gap(170),
                            Text(" 200ETB"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(" Number of item"),
                            Gap(140),
                            Text(" 3 X new "),
                          ],
                        ),
                        Row(
                          children: [
                            Text(" 3 new thing"),
                            Gap(160),
                            Text(" 3 new thing"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if(widget.selectedDate!=_tabController.index){
                          isIndex=true;

                        }
                        // Check if tabDates list is empty before accessing an index
                        if (tabDates.isNotEmpty) {
                          int currentIndex = _tabController.index;
                          // Check if currentIndex is within the bounds of tabDates list
                          if (currentIndex >= 0 && currentIndex < tabDates.length) {
                            selectedDate = tabDates[currentIndex];
                             formatted= DateFormat('MMM d, y').format(selectedDate);

                          } else {

                          }
                        } else {

                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtherPassengers(
                              numberofadult: widget.numberOfAdult,
                              numberofchild: widget.numberofChild,
                              departureplace: widget.datalist[index].departure,
                              arrivalplace: widget.datalist[index].arrivalplace,
                              dateTime:isIndex==false?widget.datetime:selectedDate,
                              price: widget.datalist[index].price, cargoType: '',
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text(
                        "Select",
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Gap(5),
                  const Center(
                    child: Text(
                      "Normal Cargo",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(" Refund Fee"),
                            Gap(180),
                            Text(" 300ETB"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(" Change Fee"),
                            Gap(170),
                            Text(" 200ETB"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(" Number of item"),
                            Gap(140),
                            Text(" 3 X new "),
                          ],
                        ),
                        Row(
                          children: [
                            Text(" 3 new thing"),
                            Gap(160),
                            Text(" 3 new thing"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if(widget.selectedDate!=_tabController.index){
                          isIndex=true;
                        }
                        // Check if tabDates list is empty before accessing an index
                        if (tabDates.isNotEmpty) {
                          int currentIndex = _tabController.index;
                          // Check if currentIndex is within the bounds of tabDates list
                          if (currentIndex >= 0 && currentIndex < tabDates.length) {
                            selectedDate = tabDates[currentIndex];
                            // String formatted= DateFormat('MMM d, y').format(selectedDate);


                          } else {

                          }
                        } else {

                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtherPassengers(
                              numberofadult: widget.numberOfAdult,
                              numberofchild: widget.numberofChild,
                              departureplace: widget.datalist[index].departure,
                              arrivalplace: widget.datalist[index].arrivalplace,
                              dateTime:isIndex==false?widget.datetime:selectedDate,
                              price:widget.datalist[index].price, cargoType: '',
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text(
                        "Select",
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Gap(5),
                ],
              ),
            );
          },
        ),
      );
    }
    return tabBarViews;
  }

  // Function to get formatted text for tab
  String _getTabText(DateTime date) {
    return DateFormat('EEE\nMMMM d').format(
        date); // Format to display day of the week, month name, and day of the month
  }
}

void main() {
  runApp( MaterialApp(
    home: SchedulePage(
      datalist: const [],
      selectedDate: null,
      numberOfAdult: null,
      numberofChild: null,
      datetime: DateTime.now(), // Pass your data list here
    ),
  ));
}
