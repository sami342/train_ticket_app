import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class seatDisplay extends StatefulWidget {
  const seatDisplay({super.key});

  @override
  State<seatDisplay> createState() => _seatSeleactionState();
}

class _seatSeleactionState extends State<seatDisplay> {
  int selectdeIndx = 0;
  int selectdeIndxCargo2 = 0;
  int selectdeIndxCargo3 = 0;
  int selectdeIndxCargo4 = 0;
  int selectdeIndxCargo5 = 0;
  int selectdeIndxCargo6 = 0;

  int rownumber = 2;
  bool isvisible1 = true;
  bool isvisible2 = false;
  bool isvisible3 = false;
  bool isvisible4 = false;
  bool isvisible5 = false;
  bool isvisible6 = false;
  bool isvisible7 = false;

  List<int> takenSeats = [1,2]; // Example list of taken seats
  List<int> bookedSeat = [3,4];

  List<int> takenSeats2 = [5,6];
  List<int> bookedSeat2 = [7,8];

  List<int> takenSeats3 = [9,10];
  List<int> bookedSeat3 = [11,12];

  List<int> takenSeats4 = [13,14];
  List<int> bookedSeat4 = [15,16];

  List<int> takenSeats5 = [17,18];
  List<int> bookedSeat5 = [19,20];

  List<int> takenSeats6 = [21,22];
  List<int> bookedSeat6 = [23,24];

  List<int> takenSeats7 = [25,26];
  List<int> bookedSeat7 = [27,28];

  List<bool> seatSelected = [];
  List<bool> seatSelected2 = [];
  List<bool> seatSelected3 = [];
  List<bool> seatSelected4 = [];
  List<bool> seatSelected5 = [];
  List<bool> seatSelected6 = [];
  List<bool> seatSelected7 = [];

  // Initialize empty list

  @override
  void initState() {
    super.initState();
    // Initialize seatSelected list based on takenSeats
    seatSelected = List.generate(120, (index) {
      int seatNumber = index + 1;
      return takenSeats.contains(index + 1);
    });

    seatSelected2 = List.generate(120, (index) {
      return takenSeats2.contains(index + 1);
    });

    seatSelected3 = List.generate(120, (index) {
      return takenSeats3.contains(index + 1);
    });

    seatSelected4 = List.generate(120, (index) {
      return takenSeats4.contains(index + 1);
    });

    seatSelected5 = List.generate(120, (index) {
      return takenSeats5.contains(index + 1);
    });
    seatSelected6 = List.generate(120, (index) {
      return takenSeats6.contains(index + 1);
    });
    seatSelected7 = List.generate(120, (index) {
      return takenSeats7.contains(index + 1);
    });
  }

  void toggleSeat(int index,cargoIndex) {
    setState(() {
      if(cargoIndex==1){
            if (!seatSelected[index]) {
              // If the seat is not taken, mark it as selected (booked)
              seatSelected[index] = true;
            } else {
              seatSelected[index] = false;
            }
          }
     if(cargoIndex==2){
           if (!seatSelected2[index]) {
             // If the seat is not taken, mark it as selected (booked)
             seatSelected2[index] = true;
           } else {
             seatSelected2[index] = false;
           }
     }
      if(cargoIndex==3){
            if (!seatSelected3[index]) {
              // If the seat is not taken, mark it as selected (booked)
              seatSelected3[index] = true;
            } else {
              seatSelected3[index] = false;
            }
      }
      if(cargoIndex==4){
            if (!seatSelected4[index]) {
              // If the seat is not taken, mark it as selected (booked)
              seatSelected4[index] = true;
            } else {
              seatSelected4[index] = false;
            }
      }
      if(cargoIndex==5){
            if (!seatSelected5[index]) {
              // If the seat is not taken, mark it as selected (booked)
              seatSelected5[index] = true;
            } else {
              seatSelected5[index] = false;
            }
      }
      if(cargoIndex==6){
            if (!seatSelected6[index]) {
              // If the seat is not taken, mark it as selected (booked)
              seatSelected6[index] = true;
            } else {
              seatSelected6[index] = false;
            }
      }
      if(cargoIndex==7){
            if (!seatSelected7[index]) {
              // If the seat is not taken, mark it as selected (booked)
              seatSelected7[index] = true;
            } else {
              seatSelected7[index] = false;
            }
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Seat Selection'),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 55,
            child: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectdeIndx = index;
                        if (index == 0) {
                          isvisible1 = true;
                          isvisible2 = false;
                          isvisible3 = false;
                          isvisible4 = false;
                          isvisible5 = false;
                          isvisible6 = false;
                          isvisible7 = false;
                        }
                        if (index == 1) {
                          isvisible1 = false;
                          isvisible2 = true;
                          isvisible3 = false;
                          isvisible4 = false;
                          isvisible5 = false;
                          isvisible6 = false;
                          isvisible7 = false;
                        }
                        if (index == 2) {
                          isvisible1 = false;
                          isvisible2 = false;
                          isvisible3 = true;
                          isvisible4 = false;
                          isvisible5 = false;
                          isvisible6 = false;
                          isvisible7 = false;
                        }
                        if (index == 3) {
                          isvisible1 = false;
                          isvisible2 = false;
                          isvisible3 = false;
                          isvisible4 = true;
                          isvisible5 = false;
                          isvisible6 = false;
                          isvisible7 = false;
                        }
                        if (index == 4) {
                          isvisible1 = false;
                          isvisible2 = false;
                          isvisible3 = false;
                          isvisible4 = false;
                          isvisible5 = true;
                          isvisible6 = false;
                          isvisible7 = false;
                        }
                        if (index == 5) {
                          isvisible1 = false;
                          isvisible2 = false;
                          isvisible3 = false;
                          isvisible4 = false;
                          isvisible5 = false;
                          isvisible6 = true;
                          isvisible7 = false;
                        }
                        if (index == 6) {
                          isvisible1 = false;
                          isvisible2 = false;
                          isvisible3 = false;
                          isvisible4 = false;
                          isvisible5 = false;
                          isvisible6 = false;
                          isvisible7 = true;
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectdeIndx == index ? Colors.green : Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      "CARGO ${index + 1}",
                      style: TextStyle(
                        color:
                            selectdeIndx == index ? Colors.white : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black12,
                      ),
                    ),
                    const Text(" Available"),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const Text(" Selected"),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                    const Text(" Booked"),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.redAccent,
                      ),
                    ),
                    const Text(" Taken"),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
            visible: isvisible1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 550,
                // You may want to reconsider hardcoding the height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: 120,
                  itemBuilder: (BuildContext context, int index) {
                    int seatNumber = index + 1;
                    bool isTaken = takenSeats
                        .contains(seatNumber); // Default to seat available
                    bool isBooked = bookedSeat.contains(seatNumber);

                    // Calculate row number
                    int rowNumber = index ~/ 5 + 1;

                    // Default padding
                    EdgeInsets padding =
                        const EdgeInsets.symmetric(horizontal: 8.0);

                    // Apply special padding for the second and third elements in each row
                    if ((index + 1) % 5 == 2) {
                      padding = const EdgeInsets.only(right: 20.0);
                    } else if ((index + 1) % 5 == 3) {
                      padding = const EdgeInsets.only(left: 20.0);
                    } else if ((index + 1) % 5 == 4) {
                      padding = const EdgeInsets.only(right: 5.0, left: 8);
                    } else if ((index + 1) % 5 == 0) {
                      // Special handling for the last element in each row
                      padding = const EdgeInsets.only(right: 8.0);
                    }

                    Widget child = Padding(
                      padding: padding,
                      child: Container(
                        decoration: BoxDecoration(
                          // ignore: unrelated_type_equality_checks
                          color: Colors.grey,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            seatNumber.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );

                    return GestureDetector(
                      onTap: () {
                        toggleSeat(index,1);
                      },
                      child: Padding(
                        padding: padding,
                        child: Container(
                          decoration: BoxDecoration(
                            color: isTaken
                                ? Colors.red
                                : (isBooked
                                    ? Colors.green
                                    : (seatSelected[index]
                                        ? Colors.blue
                                        : Colors.grey)),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              (index + 1).toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Visibility(
            visible: isvisible2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 550,
                // You may want to reconsider hardcoding the height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: 120,
                  itemBuilder: (BuildContext context, int index) {
                    int seatNumber = index + 1;
                       bool isTaken = takenSeats2.contains(seatNumber);
                       bool isBooked2 = bookedSeat2.contains(seatNumber);

                    // Default padding
                    EdgeInsets padding =
                        const EdgeInsets.symmetric(horizontal: 8.0);

                    // Apply special padding for the second and third elements in each row
                    if ((index + 1) % 5 == 2) {
                      padding = const EdgeInsets.only(right: 20.0);
                    } else if ((index + 1) % 5 == 3) {
                      padding = const EdgeInsets.only(left: 20.0);
                    } else if ((index + 1) % 5 == 4) {
                      padding = const EdgeInsets.only(right: 5.0, left: 8);
                    } else if ((index + 1) % 5 == 0) {
                      // Special handling for the last element in each row
                      padding = const EdgeInsets.only(right: 8.0);
                    }

                    Widget child = Padding(
                      padding: padding,
                      child: Container(
                        decoration: BoxDecoration(
                          // ignore: unrelated_type_equality_checks
                          color: Colors.grey,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            seatNumber.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );

                    return GestureDetector(
                      onTap: () {
                        toggleSeat(index,2);
                      },
                      child: Padding(
                        padding: padding,
                        child: Container(
                          decoration: BoxDecoration(
                            color: isTaken
                                ? Colors.red
                                : (isBooked2
                                ? Colors.green
                                : (seatSelected2[index]
                                ? Colors.blue
                                : Colors.grey)),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              (index + 1).toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Visibility(
            visible: isvisible3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 550,
                // You may want to reconsider hardcoding the height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: 120,
                  itemBuilder: (BuildContext context, int index) {
                    int seatNumber = index + 1;
                    bool isTaken = takenSeats3
                        .contains(seatNumber); // Default to seat available
                    bool isBooked3=bookedSeat3.contains(seatNumber);


                    // Default padding
                    EdgeInsets padding =
                        const EdgeInsets.symmetric(horizontal: 8.0);

                    // Apply special padding for the second and third elements in each row
                    if ((index + 1) % 5 == 2) {
                      padding = const EdgeInsets.only(right: 20.0);
                    } else if ((index + 1) % 5 == 3) {
                      padding = const EdgeInsets.only(left: 20.0);
                    } else if ((index + 1) % 5 == 4) {
                      padding = const EdgeInsets.only(right: 5.0, left: 8);
                    } else if ((index + 1) % 5 == 0) {
                      // Special handling for the last element in each row
                      padding = const EdgeInsets.only(right: 8.0);
                    }

                    Widget child = Padding(
                      padding: padding,
                      child: Container(
                        decoration: BoxDecoration(
                          // ignore: unrelated_type_equality_checks
                          color: Colors.grey,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            seatNumber.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );

                    return GestureDetector(
                      onTap: () {
                        toggleSeat(index,3);
                      },
                      child: Padding(
                        padding: padding,
                        child: Container(
                          decoration: BoxDecoration(
                            color: isTaken
                                ? Colors.red
                                : (isBooked3
                                ? Colors.green
                                : (seatSelected3[index]
                                ? Colors.blue
                                : Colors.grey)),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              (index + 1).toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Visibility(
            visible: isvisible4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 550,
                // You may want to reconsider hardcoding the height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: 120,
                  itemBuilder: (BuildContext context, int index) {
                    int seatNumber = index + 1;
                    bool isTaken = takenSeats4
                        .contains(seatNumber); // Default to seat available
                    bool isBooked4=bookedSeat4.contains(seatNumber);


                    // Default padding
                    EdgeInsets padding =
                        const EdgeInsets.symmetric(horizontal: 8.0);

                    // Apply special padding for the second and third elements in each row
                    if ((index + 1) % 5 == 2) {
                      padding = const EdgeInsets.only(right: 20.0);
                    } else if ((index + 1) % 5 == 3) {
                      padding = const EdgeInsets.only(left: 20.0);
                    } else if ((index + 1) % 5 == 4) {
                      padding = const EdgeInsets.only(right: 5.0, left: 8);
                    } else if ((index + 1) % 5 == 0) {
                      // Special handling for the last element in each row
                      padding = const EdgeInsets.only(right: 8.0);
                    }

                    Widget child = Padding(
                      padding: padding,
                      child: Container(
                        decoration: BoxDecoration(
                          // ignore: unrelated_type_equality_checks
                          color: Colors.grey,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            seatNumber.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );

                    return GestureDetector(
                      onTap: () {
                        toggleSeat(index,4);
                      },
                      child: Padding(
                        padding: padding,
                        child: Container(
                          decoration: BoxDecoration(
                            color: isTaken
                                ? Colors.red
                                : (isBooked4
                                ? Colors.green
                                : (seatSelected4[index]
                                ? Colors.blue
                                : Colors.grey)),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              (index + 1).toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Visibility(
            visible: isvisible5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 550,
                // You may want to reconsider hardcoding the height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: 120,
                  itemBuilder: (BuildContext context, int index) {
                    int seatNumber = index + 1;
                    bool isTaken = takenSeats5
                        .contains(seatNumber); // Default to seat available
                    bool isBooked5=bookedSeat5.contains(seatNumber);
                    // Default padding
                    EdgeInsets padding =
                        const EdgeInsets.symmetric(horizontal: 8.0);

                    // Apply special padding for the second and third elements in each row
                    if ((index + 1) % 5 == 2) {
                      padding = const EdgeInsets.only(right: 20.0);
                    } else if ((index + 1) % 5 == 3) {
                      padding = const EdgeInsets.only(left: 20.0);
                    } else if ((index + 1) % 5 == 4) {
                      padding = const EdgeInsets.only(right: 5.0, left: 8);
                    } else if ((index + 1) % 5 == 0) {
                      // Special handling for the last element in each row
                      padding = const EdgeInsets.only(right: 8.0);
                    }

                    Widget child = Padding(
                      padding: padding,
                      child: Container(
                        decoration: BoxDecoration(
                          // ignore: unrelated_type_equality_checks
                          color: Colors.grey,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            seatNumber.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );

                    return GestureDetector(
                      onTap: () {
                        toggleSeat(index,5);
                      },
                      child: Padding(
                        padding: padding,
                        child: Container(
                          decoration: BoxDecoration(
                            color: isTaken
                                ? Colors.red
                                : (isBooked5
                                ? Colors.green
                                : (seatSelected5[index]
                                ? Colors.blue
                                : Colors.grey)),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              (index + 1).toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Visibility(
            visible: isvisible6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 550,
                // You may want to reconsider hardcoding the height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: 120,
                  itemBuilder: (BuildContext context, int index) {
                    int seatNumber = index + 1;
                    bool isTaken = takenSeats6
                        .contains(seatNumber); // Default to seat available
                    bool isBooked6=bookedSeat6.contains(seatNumber);

                    // Calculate row number
                    int rowNumber = index ~/ 5 + 1;

                    // Default padding
                    EdgeInsets padding =
                        const EdgeInsets.symmetric(horizontal: 8.0);

                    // Apply special padding for the second and third elements in each row
                    if ((index + 1) % 5 == 2) {
                      padding = const EdgeInsets.only(right: 20.0);
                    } else if ((index + 1) % 5 == 3) {
                      padding = const EdgeInsets.only(left: 20.0);
                    } else if ((index + 1) % 5 == 4) {
                      padding = const EdgeInsets.only(right: 5.0, left: 8);
                    } else if ((index + 1) % 5 == 0) {
                      // Special handling for the last element in each row
                      padding = const EdgeInsets.only(right: 8.0);
                    }

                    Widget child = Padding(
                      padding: padding,
                      child: Container(
                        decoration: BoxDecoration(
                          // ignore: unrelated_type_equality_checks
                          color: Colors.grey,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            seatNumber.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );

                    return GestureDetector(
                      onTap: () {
                        toggleSeat(index,6);
                      },
                      child: Padding(
                        padding: padding,
                        child: Container(
                          decoration: BoxDecoration(
                            color:  isTaken
                                ? Colors.red
                                : (isBooked6
                                ? Colors.green
                                : (seatSelected6[index]
                                ? Colors.blue
                                : Colors.grey)),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              (index + 1).toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Visibility(
            visible: isvisible7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 550,
                // You may want to reconsider hardcoding the height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: 120,
                  itemBuilder: (BuildContext context, int index) {
                    int seatNumber = index + 1;
                    bool isTaken = takenSeats7
                        .contains(seatNumber); // Default to seat available
                   bool isBooked7=bookedSeat7.contains(seatNumber);


                    // Default padding
                    EdgeInsets padding =
                        const EdgeInsets.symmetric(horizontal: 8.0);

                    // Apply special padding for the second and third elements in each row
                    if ((index + 1) % 5 == 2) {
                      padding = const EdgeInsets.only(right: 20.0);
                    } else if ((index + 1) % 5 == 3) {
                      padding = const EdgeInsets.only(left: 20.0);
                    } else if ((index + 1) % 5 == 4) {
                      padding = const EdgeInsets.only(right: 5.0, left: 8);
                    } else if ((index + 1) % 5 == 0) {
                      // Special handling for the last element in each row
                      padding = const EdgeInsets.only(right: 8.0);
                    }

                    Widget child = Padding(
                      padding: padding,
                      child: Container(
                        decoration: BoxDecoration(
                          // ignore: unrelated_type_equality_checks
                          color: Colors.grey,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            seatNumber.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );

                    return GestureDetector(
                      onTap: () {
                        toggleSeat(index,7);
                      },
                      child: Padding(
                        padding: padding,
                        child: Container(
                          decoration: BoxDecoration(
                            color: isTaken
                                ? Colors.red
                                : (isBooked7
                                ? Colors.green
                                : (seatSelected7[index]
                                ? Colors.blue
                                : Colors.grey)),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              (index + 1).toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
