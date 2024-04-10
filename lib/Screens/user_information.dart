import 'package:flutter/material.dart';


class userInformation extends StatefulWidget {
  const userInformation({super.key});

  @override
  State<userInformation> createState() => _userInformationState();
}

class _userInformationState extends State<userInformation> {
  int selectedIndexchild=-1;
  int selectedIndex=-1;
  int numberofchild=3;
  int numberofAdult=2;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:30.0,left: 20),
                child: Row(
                  children: [
                    Wrap(
                      direction:Axis.horizontal,
                      children: List.generate(numberofAdult, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              color: selectedIndex ==
                                  index
                                  ? Colors.lightBlue
                                  : Colors.black12,
                              borderRadius:
                              BorderRadius.circular(
                                  10),
                            ),
                            margin: const EdgeInsets.only(
                                right: 10),
                            child: Center(
                              child: Text("Adult $index",
                                style: TextStyle(
                                  color:
                                  selectedIndex ==
                                      index
                                      ? Colors.white
                                      : Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      children: List.generate(numberofchild, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndexchild = index;
                            });
                          },
                          child: Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              color: selectedIndexchild ==
                                  index
                                  ? Colors.lightBlue
                                  : Colors.black12,
                              borderRadius:
                              BorderRadius.circular(
                                  10),
                            ),
                            margin: const EdgeInsets.only(
                                right: 10),
                            child: Center(
                              child: Text("child $index",
                                style: TextStyle(
                                  color:
                                  selectedIndexchild ==
                                      index
                                      ? Colors.white
                                      : Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}

