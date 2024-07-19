import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import '../Database/city_abrivation.dart';
import '../Database/my_data.dart';
import '../widget/ticket_container.dart';
import 'other_passengers.dart';

class scheduleTry extends StatefulWidget {
  final List<MyData> datalist;
  final int? numberofChild;
  final int? numberOfAdult;
  final int? SelectedDate;
  final DateTime? initialDate;

  const scheduleTry(
      {super.key,
      required this.datalist,
      required this.numberOfAdult,
      required this.numberofChild,
      required this.SelectedDate,
      required this.initialDate});

  @override
  State<scheduleTry> createState() => _scheduleTryState();
}

class _scheduleTryState extends State<scheduleTry>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final int numberOfDaysInWeek = 7;
  late DateTime _currentDate;
  List<DateTime> tabDates = [];
 late DateTime selectedDate;
  bool isIndex=false;
  late String formatted;

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
    _tabController = TabController(length: numberOfDaysInWeek, vsync: this);
    _populateTabDates();
    _setInitialIndex();
    _tabController.addListener(_handleTabChange);
    selectedDate=widget.initialDate!;

  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();

  }

  void _populateTabDates() {
    tabDates.clear(); // Clear tabDates list before populating it
    for (int i = -2; i < numberOfDaysInWeek - 2; i++) {
      final currentDate = _currentDate.add(Duration(days: i));
      tabDates.add(currentDate); // Store the date in the list
    }
  }

  void _setInitialIndex() {
    if (widget.initialDate != null) {
      int initialIndex = tabDates.indexWhere((date) =>
          date.year == widget.initialDate!.year &&
          date.month == widget.initialDate!.month &&
          date.day == widget.initialDate!.day);

      if (initialIndex != -1) {
        setState(() {
          _tabController.index = initialIndex;
        });
      }
    }
  }

  void _handleTabChange() {
    setState(() {
      selectedDate = tabDates[_tabController.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Schedule")),
      ),
      body: DefaultTabController(
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

  List<Widget> _buildTabBarViews() {
    List<Widget> tabBarViews = [];
    for (int i = -2; i < numberOfDaysInWeek - 2; i++) {
      final currentDate = _currentDate.add(Duration(days: i));

      // Filter data from the database based on the current date
      final filteredData = widget.datalist
          .where((fullday) =>
              fullday.fullday == DateFormat('yyyy-MM-dd').format(currentDate))
          .toList();

      if (filteredData.isEmpty) {
        // Add a placeholder widget to tabBarViews when there's no data for the day
        tabBarViews.add(
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                'There are no schedules or tickets for ${DateFormat('yyyy-MM-dd').format(currentDate)}.',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
      } else {
        // Add ListView with data to tabBarViews when data is available
        tabBarViews.add(
          ListView.builder(
            itemCount: filteredData.length,
            itemBuilder: (context, index) {
              // Build your list item here using filteredData[index]
              return Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ExpansionTile(
                  title: ListTile(
                    title: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              CityAbbreviation.getAbbreviation(
                                  filteredData[index].departure),
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
                              CityAbbreviation.getAbbreviation(
                                  filteredData[index].arrivalplace),
                              style: styles.headLineStyle3
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                        const Gap(3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(filteredData[index].departure),
                            const Icon(Icons.double_arrow_outlined),
                            const Icon(Icons.double_arrow_outlined),
                            Text(filteredData[index].arrivalplace),
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
                              filteredData[index].JourneyTime,
                              style: styles.headLineStyle4
                                  .copyWith(color: Colors.black38),
                            ),
                            Text(
                              filteredData[index].departureTime,
                              style: styles.headLineStyle4
                                  .copyWith(color: Colors.black38),
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
                              "Departure Time",
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
                    SizedBox(
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Text(" Refund Fee"),
                              Gap(180),
                              Text(" 300ETB"),
                            ],
                          ),
                          const Row(
                            children: [
                              Text(" Change Fee"),
                              Gap(170),
                              Text(" 200ETB"),
                            ],
                          ),
                          const Row(
                            children: [
                              Text(" Number of item"),
                              Gap(140),
                              Text(" 3 X new "),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(" price",style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),),
                              const Gap(220),
                              Text(
                                  '${(int.parse(filteredData[index].price) * 2)} ETB',style: const TextStyle(
                                color: Colors.red,

                              ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          String correctformatted = DateFormat('yyyy-MM-dd').format(selectedDate);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OtherPassengers(
                                numberofadult: widget.numberOfAdult,
                                numberofchild: widget.numberofChild,
                                departureplace:
                                    widget.datalist[index].departure,
                                arrivalplace:
                                    widget.datalist[index].arrivalplace,
                                dateTime:selectedDate,
                                price: widget.datalist[index].price,
                                cargoType: 'VIP',
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
                     SizedBox(
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Text(" Refund Fee"),
                              Gap(180),
                              Text(" 300ETB"),
                            ],
                          ),
                          const Row(
                            children: [
                              Text(" Change Fee"),
                              Gap(170),
                              Text(" 200ETB"),
                            ],
                          ),
                          const Row(
                            children: [
                              Text(" Number of item"),
                              Gap(140),
                              Text(" 3 X new "),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(" price",style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),
                              const Gap(220),
                              Text('${filteredData[index].price}ETB',style: const TextStyle(
                                color: Colors.red,
                              ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // if (widget.selectedDate != _tabController.index) {
                          //   isIndex = true;
                          // }
                          // Check if tabDates list is empty before accessing an index
                          if (tabDates.isNotEmpty) {
                            int currentIndex = _tabController.index;
                            // Check if currentIndex is within the bounds of tabDates list
                            if (currentIndex >= 0 &&
                                currentIndex < tabDates.length) {
                              selectedDate = tabDates[currentIndex];
                              String formatted = DateFormat('MMM d, y').format(selectedDate);
                              String correctformatted = DateFormat('yyyy-MM-dd').format(selectedDate);
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
                                departureplace:
                                    widget.datalist[index].departure,
                                arrivalplace:
                                    widget.datalist[index].arrivalplace,
                                dateTime: selectedDate,
                                // dateTime: isIndex == false
                                //     ? widget.datetime
                                //     : selectedDate,
                                price: widget.datalist[index].price,
                                cargoType: 'Normal',
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
    }
    return tabBarViews;
  }

  List<Widget> _buildTabs() {
    List<Widget> tabs = [];
    tabDates.clear(); // Clear tabDates list before populating it
    for (int i = -2; i < numberOfDaysInWeek - 2; i++) {
      final currentDate = _currentDate.add(Duration(days: i));
      tabDates.add(currentDate); // Store the date in the list

      tabs.add(
        Tab(
          text: _getTabText(currentDate), // Get formatted text for tab
        ),
      );
    }
    return tabs;
  }

  String _getTabText(DateTime date) {
    // Format the date as desired for tab text
    return DateFormat('EEE, MMM d').format(date);
  }
}
