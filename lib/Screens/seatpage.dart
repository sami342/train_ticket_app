import 'package:book_train_ticket/Screens/passenger_conirm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../SeatAvilablity/create_colection.dart';

class SeatDisplayPage extends StatefulWidget {
  List<Map<String, dynamic>> user;
  final String departureplace;
  final String arrivalplace;

  final int price;
  final String travelClass;
  final String Cargo;
  final List<int> seat;
  final DateTime date;


  SeatDisplayPage({
    required this.date,
    required this.departureplace,
    required this.seat,
    required this.Cargo,
    required this.travelClass,
    required this.price,
    required this.user,
    required this.arrivalplace,
  });

  @override
  _SeatDisplayPageState createState() => _SeatDisplayPageState();
}

class _SeatDisplayPageState extends State<SeatDisplayPage> {
  late Future<Map<String, Map<String, List<int>>>> _seatsFuture;
  late int totalpassenger;


  TrainTicketManager ticketManager = TrainTicketManager();
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

  List<int> takenSeats = []; // Example list of taken seats
  List<int> bookedSeat = [];

  List<int> takenSeats2 = [];
  List<int> bookedSeat2 = [];

  List<int> takenSeats3 = [];
  List<int> bookedSeat3 = [];

  List<int> takenSeats4 = [];
  List<int> bookedSeat4 = [];

  List<int> takenSeats5 = [];
  List<int> bookedSeat5 = [];

  List<int> takenSeats6 = [];
  List<int> bookedSeat6 = [];

  List<int> takenSeats7 = [];
  List<int> bookedSeat7 = [];

  List<bool> seatSelected = [];
  List<bool> seatSelected2 = [];
  List<bool> seatSelected3 = [];
  List<bool> seatSelected4 = [];
  List<bool> seatSelected5 = [];
  List<bool> seatSelected6 = [];
  List<bool> seatSelected7 = [];

  List<int> slectedSeat = [];
  List<int> slectedSeat1 = [];
  List<int> slectedSeat2 = [];
  List<int> slectedSeat3 = [];
  List<int> slectedSeat4 = [];
  List<int> slectedSeat5 = [];
  List<int> slectedSeat6 = [];
  List<int> slectedSeat7 = [];


  @override
  void initState() {
    super.initState();
     totalpassenger=widget.user.length;

    _seatsFuture = loadBookedSeats();

    // Initialize seatSelected list based on takenSeats
    seatSelected = List.generate(120, (index) {
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

  void toggleSeat(int index, int cargoIndex) {
    setState(() {
      if (cargoIndex == 1) {
        if (bookedSeat.contains(index + 1) || takenSeats.contains(index + 1)) {
          const snackBar = SnackBar(
            content: Text(
                'This seat number is already taken'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        else {
          if (slectedSeat1.contains(index + 1)) {
            seatSelected[index] = !seatSelected[index];
            int seatIndex = slectedSeat1.indexOf(index + 1);
            setState(() {
              slectedSeat1.remove(index +
                  1); // Remove the index from the list if already selected
            });
          }
          else {
            if (slectedSeat1.length < totalpassenger) {
              slectedSeat1.add(index + 1);
              seatSelected[index] = !seatSelected[index];
            }
            else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Seat Selection'),
                    content: Text(
                        'You have already selected seat number $slectedSeat1. if you want to change your seat please unselect the pervious one?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();

                          // Close the dialog
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            }
          }
        }
      }
      else if (cargoIndex == 2) {
        if (bookedSeat2.contains(index + 1) ||
            takenSeats2.contains(index + 1)) {
          const snackBar = SnackBar(
            content: Text(
                'This seat number is already taken'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        else {
          if (slectedSeat2.contains(index + 1)) {
            seatSelected2[index] = !seatSelected2[index];
            setState(() {
              slectedSeat2.remove(index +
                  1); // Remove the index from the list if already selected
            });
          }
          else {
            if (slectedSeat2.length < totalpassenger) {
              slectedSeat2.add(index + 1);
              seatSelected2[index] = !seatSelected2[index];
            }
            else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Seat Selection'),
                    content: Text(
                        'You have already selected seat number $slectedSeat2. if you want to change your seat please unselect the pervious one?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Close the dialog
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            }
          }
        }
      }
      else if (cargoIndex == 3) {
        if (bookedSeat3.contains(index + 1) ||
            takenSeats3.contains(index + 1)) {
          const snackBar = SnackBar(
            content: Text(
                'This seat number is already taken'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        else {
          if (slectedSeat3.contains(index + 1)) {
            seatSelected3[index] = !seatSelected3[index];
            setState(() {
              slectedSeat3.remove(index +
                  1); // Remove the index from the list if already selected
            });
          }
          else {
            if (slectedSeat3.length < totalpassenger) {
              slectedSeat3.add(index + 1);
              seatSelected3[index] = !seatSelected3[index];
            }
            else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Seat Selection'),
                    content: Text(
                        'You have already selected seat number $slectedSeat3. if you want to change your seat please unselect the pervious one?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Close the dialog
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            }
          }
        }
      }
      else if (cargoIndex == 4) {
        if (bookedSeat4.contains(index + 1) ||
            takenSeats4.contains(index + 1)) {
          const snackBar = SnackBar(
            content: Text(
                'This seat number is already taken'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        else {
          if (slectedSeat4.contains(index + 1)) {
            seatSelected4[index] = !seatSelected4[index];
            setState(() {
              slectedSeat4.remove(index +
                  1); // Remove the index from the list if already selected
            });
          }
          else {
            if (slectedSeat4.length < totalpassenger) {
              slectedSeat4.add(index + 1);
              seatSelected4[index] = !seatSelected4[index];
            }
            else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Seat Selection'),
                    content: Text(
                        'You have already selected seat number $slectedSeat4. if you want to change your seat please unselect the pervious one?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Close the dialog
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            }
          }
        }
      }
      else if (cargoIndex == 5) {
        if (bookedSeat5.contains(index + 1) ||
            takenSeats5.contains(index + 1)) {
          const snackBar = SnackBar(
            content: Text(
                'This seat number is already taken'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        else {
          if (slectedSeat5.contains(index + 1)) {
            seatSelected5[index] = !seatSelected5[index];
            setState(() {
              slectedSeat5.remove(index +
                  1); // Remove the index from the list if already selected
            });
          }
          else {
            if (slectedSeat5.length < totalpassenger) {
              slectedSeat5.add(index + 1);
              seatSelected5[index] = !seatSelected5[index];
            }
            else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Seat Selection'),
                    content: Text(
                        'You have already selected seat number $slectedSeat5. if you want to change your seat please unselect the pervious one?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Close the dialog
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            }
          }
        }
      }
      else if (cargoIndex == 6) {
        if (bookedSeat6.contains(index + 1) ||
            takenSeats6.contains(index + 1)) {
          const snackBar = SnackBar(
            content: Text(
                'This seat number is already taken'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        else {
          if (slectedSeat6.contains(index + 1)) {
            seatSelected6[index] = !seatSelected6[index];
            setState(() {
              slectedSeat6.remove(index +
                  1); // Remove the index from the list if already selected
            });
          }
          else {
            if (slectedSeat6.length <totalpassenger) {
              slectedSeat6.add(index + 1);
              seatSelected6[index] = !seatSelected6[index];
            }
            else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Seat Selection'),
                    content: Text(
                        'You have already selected seat number $slectedSeat6. if you want to change your seat please unselect the pervious one?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Close the dialog
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            }
          }
        }
      }
      else if (cargoIndex == 7) {
        if (bookedSeat7.contains(index + 1) ||
            takenSeats7.contains(index + 1)) {
          const snackBar = SnackBar(
            content: Text(
                'This seat number is already taken'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        else {
          if (slectedSeat7.contains(index + 1)) {
            seatSelected7[index] = !seatSelected7[index];
            setState(() {
              slectedSeat7.remove(index +
                  1); // Remove the index from the list if already selected
            });
          }
          else {
            if (slectedSeat7.length < totalpassenger) {
              slectedSeat7.add(index + 1);
              seatSelected7[index] = !seatSelected7[index];
            }
            else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Seat Selection'),
                    content: Text(
                        'You have already selected seat number $slectedSeat7. if you want to change your seat please unselect the pervious one?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Close the dialog
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            }
          }
        }
      }
    });
  }

  Future<Map<String, Map<String, List<int>>>> loadBookedSeats() async {
    Map<String, Map<String, List<int>>> seatsMap = {
      'cargo1': {'bookedSeats': [], 'takenSeats': []},
      'cargo2': {'bookedSeats': [], 'takenSeats': []},
      'cargo3': {'bookedSeats': [], 'takenSeats': []},
      'cargo4': {'bookedSeats': [], 'takenSeats': []},
      'cargo5': {'bookedSeats': [], 'takenSeats': []},
      'cargo6': {'bookedSeats': [], 'takenSeats': []},
      'cargo7': {'bookedSeats': [], 'takenSeats': []},
    };

    try {
      String formattedDate = DateFormat('yyyy-MM-dd').format(widget.date);
      List<String> cargoIds = ['cargo1', 'cargo2', 'cargo3', 'cargo4', 'cargo5', 'cargo6', 'cargo7'];

      for (String cargoId in cargoIds) {
        List<int> bookedSeats = await getBookedSeats(cargoId, formattedDate);
        List<int> takenSeats = await getTakenSeats(cargoId, formattedDate);

        seatsMap[cargoId]?['bookedSeats'] = bookedSeats;
        seatsMap[cargoId]?['takenSeats'] = takenSeats;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error loading booked seats:'),
      ));
    }

    return seatsMap;
  }



  Future<List<int>> getBookedSeats(String cargoId, String date) async {
    try {
      List<int> bookedSeats = [];
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('cargos').doc(cargoId).get();
      Map<String, dynamic> weekAvailability = snapshot['weekAvailability'];

      if (weekAvailability.containsKey(date)) {
        List<dynamic> seats = List.from(weekAvailability[date]['seats']);

        for (int i = 0; i < seats.length; i++) {
          if (seats[i]['status'] == 'booked') {
            // Seat is booked, add it to the list
            bookedSeats.add(seats[i]['number'] as int);
          }
        }
      } else {
        throw Exception("No data available for the given date");
      }

      return bookedSeats;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error retrieving booked seats:'),
      ));
      return [];
    }
  }

  Future<List<int>> getTakenSeats(String cargoId, String date) async {
    try {
      List<int> takenSeats = [];
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('cargos').doc(cargoId).get();
      Map<String, dynamic> weekAvailability = snapshot['weekAvailability'];

      if (weekAvailability.containsKey(date)) {
        List<dynamic> seats = List.from(weekAvailability[date]['seats']);

        for (int i = 0; i < seats.length; i++) {
          if (seats[i]['status'] == 'taken') {
            // Seat is taken, add it to the list
            takenSeats.add(seats[i]['number'] as int);
          }
        }
      } else {
        throw Exception("No data available for the given date");
      }

      return takenSeats;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error retrieving taken seats:'),
      ));
      return []; // Return an empty list in case of error
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:AppBar(
        title: const Center(
          child: Text(
            'Seat Display',
            style: TextStyle(
              fontSize: 24, // Increase the font size
              fontWeight: FontWeight.bold, // Make the text bold
            ),
          ),
        ),
       actions: [
         IconButton(
           icon: const Icon(Icons.check),
           iconSize: 36.0, // Increase the icon size
           color: Colors.blue, // Set the icon color to red
           onPressed: () {

             if (selectdeIndx + 1 == 1) {
               slectedSeat = slectedSeat1;
             } else if (selectdeIndx + 1 == 2) {
               slectedSeat = slectedSeat2;
             } else if (selectdeIndx + 1 == 3) {
               slectedSeat = slectedSeat3;
             } else if (selectdeIndx + 1 == 4) {
               slectedSeat = slectedSeat4;
             } else if (selectdeIndx + 1 == 5) {
               slectedSeat = slectedSeat5;
             } else if (selectdeIndx + 1 == 6) {
               slectedSeat = slectedSeat6;
             } else if (selectdeIndx + 1 == 7) {
               slectedSeat = slectedSeat7;
             } else {

             }
             Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) => PassengerConfrim(
                   dateTime: widget.date,
                   departureplace: widget.departureplace,
                   seat: slectedSeat,
                   Cargo:"cargo${selectdeIndx + 1}",
                   travelClass: widget.arrivalplace,
                   price: widget.price,
                   user: widget.user,
                   arrivalplace: widget.arrivalplace,
                 ),
               ),
             );
           },
         ),
       ],
      ),
      body:FutureBuilder<Map<String, Map<String, List<int>>>>(
        future: _seatsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final seatsMap = snapshot.data!;

            List<int> tempBookedSeat = [];
            List<int> tempBookedSeat2 = [];
            List<int> tempBookedSeat3 = [];
            List<int> tempBookedSeat4 = [];
            List<int> tempBookedSeat5 = [];
            List<int> tempBookedSeat6 = [];
            List<int> tempBookedSeat7 = [];

            List<int> tempTakenSeat = [];
            List<int> tempTakenSeat2 = [];
            List<int> tempTakenSeat3 = [];
            List<int> tempTakenSeat4 = [];
            List<int> tempTakenSeat5 = [];
            List<int> tempTakenSeat6 = [];
            List<int> tempTakenSeat7 = [];

            seatsMap.forEach((cargoId, seatData) {
              List<int> bookedSeats = seatData['bookedSeats']!;
              List<int> takenSeats = seatData['takenSeats']!;
              switch (cargoId) {
                case 'cargo1':
                  tempBookedSeat.addAll(bookedSeats);
                  tempTakenSeat.addAll(takenSeats);
                  break;
                case 'cargo2':
                  tempBookedSeat2.addAll(bookedSeats);
                  tempTakenSeat2.addAll(takenSeats);
                  break;
                case 'cargo3':
                  tempBookedSeat3.addAll(bookedSeats);
                  tempTakenSeat3.addAll(takenSeats);
                  break;
                case 'cargo4':
                  tempBookedSeat4.addAll(bookedSeats);
                  tempTakenSeat4.addAll(takenSeats);
                  break;
                case 'cargo5':
                  tempBookedSeat5.addAll(bookedSeats);
                  tempTakenSeat5.addAll(takenSeats);
                  break;
                case 'cargo6':
                  tempBookedSeat6.addAll(bookedSeats);
                  tempTakenSeat6.addAll(takenSeats);
                  break;
                case 'cargo7':
                  tempBookedSeat7.addAll(bookedSeats);
                  tempTakenSeat7.addAll(takenSeats);
                  break;
                default:
                  break;
              }
            });

            // Update the state after processing the data
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                bookedSeat = tempBookedSeat;
                bookedSeat2 = tempBookedSeat2;
                bookedSeat3 = tempBookedSeat3;
                bookedSeat4 = tempBookedSeat4;
                bookedSeat5 = tempBookedSeat5;
                bookedSeat6 = tempBookedSeat6;
                bookedSeat7 = tempBookedSeat7;

                takenSeats = tempTakenSeat;
                takenSeats2 = tempTakenSeat2;
                takenSeats3 = tempTakenSeat3;
                takenSeats4 = tempTakenSeat4;
                takenSeats5 = tempTakenSeat5;
                takenSeats6 = tempTakenSeat6;
                takenSeats7 = tempTakenSeat7;
              });
            });
            // Return your widget here, for example:
            return  ListView(
              children: [
                SizedBox(
                  height: 50,
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
                      height: 600,
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

                          return GestureDetector(
                            onTap: () {
                              toggleSeat(index, 1);
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
                      height: 600,
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

                          return GestureDetector(
                            onTap: () {
                              toggleSeat(index, 2);
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
                      height: 600,
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
                          bool isBooked3 = bookedSeat3.contains(seatNumber);

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

                          return GestureDetector(
                            onTap: () {
                              toggleSeat(index, 3);
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
                      height: 600,
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
                          bool isBooked4 = bookedSeat4.contains(seatNumber);

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

                          return GestureDetector(
                            onTap: () {
                              toggleSeat(index, 4);
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
                      height: 600,
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
                          bool isBooked5 = bookedSeat5.contains(seatNumber);
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

                          return GestureDetector(
                            onTap: () {
                              toggleSeat(index, 5);
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
                      height: 600,
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
                          bool isBooked6 = bookedSeat6.contains(seatNumber);

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

                          return GestureDetector(
                            onTap: () {
                              toggleSeat(index, 6);
                            },
                            child: Padding(
                              padding: padding,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isTaken
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
                      height: 600,
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
                          bool isBooked7 = bookedSeat7.contains(seatNumber);

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
                          return GestureDetector(
                            onTap: () {
                              toggleSeat(index, 7);
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
                // Expanded(
                //   child: ElevatedButton(
                //     onPressed: () {
                //       print("Cargo : ${selectdeIndx + 1}");
                //
                //       if (selectdeIndx + 1 == 1) {
                //         slectedSeat = slectedSeat1;
                //       } else if (selectdeIndx + 1 == 2) {
                //         slectedSeat = slectedSeat2;
                //       } else if (selectdeIndx + 1 == 3) {
                //         slectedSeat = slectedSeat3;
                //       } else if (selectdeIndx + 1 == 4) {
                //         slectedSeat = slectedSeat4;
                //       } else if (selectdeIndx + 1 == 5) {
                //         slectedSeat = slectedSeat5;
                //       } else if (selectdeIndx + 1 == 6) {
                //         slectedSeat = slectedSeat6;
                //       } else if (selectdeIndx + 1 == 7) {
                //         slectedSeat = slectedSeat7;
                //       } else {
                //         // Handle cases where selectdeIndx + 1 is not between 1 and 7
                //         print("nothing");
                //       }
                //
                //       print("Selected seat numbers1: $slectedSeat1");
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => PassengerConfrim(
                //             user: widget.user,
                //             arrivalplace: widget.arrivalplace,
                //             departureplace: widget.departureplace,
                //             dateTime: widget.dateTime,
                //             price: widget.price,
                //             travelClass: widget.travelClass,
                //             Cargo: "Cargo : ${selectdeIndx + 1}",
                //             seat: slectedSeat,
                //           ),
                //         ),
                //       );
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.blue, // Set background color of button
                //     ),
                //     child: const SizedBox(
                //         width: 300, child: Center(child: Text('Save my Seat'))),
                //   ),
                // ),
              ],
            );
          } else {
            return const Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}
