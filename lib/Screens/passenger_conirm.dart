import 'package:book_train_ticket/Screens/payment.dart';
import 'package:book_train_ticket/Screens/seatpage.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:book_train_ticket/utils/shared_preference.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../Database/city_abrivation.dart';
import '../SeatAvilablity/create_colection.dart';
import 'edit_passngers.dart';
import 'home_screen.dart';

class PassengerConfrim extends StatefulWidget {
  List<Map<String, dynamic>> user;
  final String departureplace;
  final String arrivalplace;
  final DateTime dateTime;
  final int price;
  final String travelClass;
  final String Cargo;
  final List<int> seat;

  PassengerConfrim(
      {super.key,
      required this.user,
      required this.arrivalplace,
      required this.departureplace,
      required this.dateTime,
      required this.price,
      required this.travelClass,
      required this.Cargo,
      required this.seat});

  @override
  State<PassengerConfrim> createState() => _PassengerConfrimState();
}

class _PassengerConfrimState extends State<PassengerConfrim> {
  late String formattedDate;
  bool _isSaving = false;
  late String cargo;
  late List<int> seat;
  BookingStorage SharedPreferencesService = BookingStorage();
  late String savedformattedDate;
  String ticketRefrence = '${DateTime.now().millisecondsSinceEpoch}';

  Future<void> printAvailableSeats(
      List<int> availableSeats, String avilabelCargo) async {
    setState(() {
      cargo = avilabelCargo;
      seat = availableSeats;
    });
  }

  Future<List<int>> findAvailableSeatsForPassengers(
      int totalPassengers, String date) async {
    List<int> availableSeats = [];
    String avilabelCargo = '';

    for (int cargoIndex = 1; cargoIndex <= 7; cargoIndex++) {
      String cargoId = 'cargo$cargoIndex';
      List<int> seatNumbers = List<int>.generate(120, (index) => index + 1);
      List<int> cargoAvailableSeats =
          await findAvailableSeats(cargoId, seatNumbers, date);

      availableSeats.addAll(cargoAvailableSeats);
      avilabelCargo = cargoId;

      if (availableSeats.length >= totalPassengers) {
        break; // Stop if we have enough available seats for all passengers
      }
    }

    List<int> selectedSeats = availableSeats.sublist(0, totalPassengers);
    String selectedCargo = avilabelCargo;
    await printAvailableSeats(selectedSeats, selectedCargo);

    return selectedSeats;
  }

  Future<List<int>> findAvailableSeats(
      String cargoId, List<int> seatNumbers, String date) async {
    List<int> availableSeats = [];

    try {
      Map<int, bool> availability = await TrainTicketManager()
          .areSeatsAvailable(cargoId, seatNumbers, date);

      seatNumbers.forEach((seatNumber) {
        if (availability.containsKey(seatNumber) && availability[seatNumber]!) {
          availableSeats.add(seatNumber);
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error checking seat availability for cargo'),
      ));
    }

    return availableSeats;
  }

  @override
  void initState() {
    super.initState();
    formattedDate = DateFormat('MMM d, y').format(widget.dateTime);
    savedformattedDate = DateFormat('yyyy-MM-dd').format(widget.dateTime);
    //saveAvailableSeats('cargo1', [1,2,3], '2024-06-08');
    if (widget.Cargo.isEmpty && widget.seat.isEmpty) {
      // If both Cargo and seat are empty, call findAvailableSeatsForPassengers
      findAvailableSeatsForPassengers(widget.user.length, savedformattedDate);
    } else {
      // If either Cargo or seat is not empty, assign them to cargo and seat variables
      setState(() {
        cargo = widget.Cargo;
        seat = widget.seat;
      });
    }
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
            const Text("Passenger details"),
            InkWell(
              child: const Icon(
                Icons.airline_seat_recline_normal_rounded,
                size: 30, // Adjust the size as needed
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeatDisplayPage(
                      date: widget.dateTime,
                      departureplace: widget.departureplace,
                      seat: widget.seat,
                      Cargo: widget.Cargo,
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
      ),
      body: ListView(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.73,
                      child: Row(
                        children: [
                          Text(
                            CityAbbreviation.getAbbreviation(
                                widget.departureplace),
                          ),
                          const Icon(Icons.arrow_forward),
                          Text(CityAbbreviation.getAbbreviation(
                              widget.arrivalplace)),
                        ],
                      ),
                    ),
                    const Expanded(child: Text("  Price")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.7,
                      child: Text(formattedDate),
                    ),
                    Expanded(
                      child: Text(
                        '${widget.price} ETB',
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                const Divider(),
                Row(
                  children: [
                    const Icon(
                      Icons.person_3,
                      color: Colors.grey,
                    ),
                    const Gap(10),
                    SizedBox(
                      width: screenWidth * 0.6,
                      child: Text(
                        "passengers  Details",
                        style:
                            styles.headLineStyle3.copyWith(color: Colors.black),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditPassngers(
                              useredit: widget.user,
                              price: widget.price,
                              departureplace: widget.departureplace,
                              arrivalplace: widget.arrivalplace,
                              dateTime: widget.dateTime,
                              travelClass: widget.travelClass,
                              Cargo: widget.Cargo,
                              seat: widget.seat,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.user.length,
            itemBuilder: (ctx, index) {
              return Card(
                color: Colors.white,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SizedBox(
                  child: ListTile(
                    title: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Passenger-${index + 1}",
                                  style: styles.headLineStyle4
                                      .copyWith(color: Colors.grey),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      widget.user[index]['Lastname'].toString(),
                                      style: styles.headLineStyle3
                                          .copyWith(color: Colors.black),
                                    ),
                                    Text(
                                      " |${widget.user[index]['Firstname']}",
                                      style: styles.headLineStyle3
                                          .copyWith(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                widget.user.removeAt(index);
                                setState(() {
                                  widget.user = widget.user;
                                });
                              },
                              child: const Icon(
                                Icons.delete_outlined,
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const Gap(15),
          Center(
            child: _isSaving
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isSaving = true;
                      });
                      saveUserToFirestore();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text(
                      "Continue to payment",
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
          ),
          const Gap(10),
        ],
      ),
    );
  }

  Future<void> saveUserToFirestore() async {
    try {
      List<String>? documentIds = await BookingStorage().getPassengerDocumentIdsFromPrefs();
      documentIds ??= [];
      for (int i = 0; i < widget.user.length; i++) {
        CollectionReference<Map<String, dynamic>> passengersCollection =
            FirebaseFirestore.instance.collection("user");
        // Create a unique document ID using the combination of first name and current timestamp
        String firstName = widget.user[i]['Firstname'];
        String documentId =
            '$firstName-${DateTime.now().millisecondsSinceEpoch}';
        documentIds.add(documentId); // Add the document ID to the list
        // Use the unique document ID
        await passengersCollection.doc(documentId).set({
          'First name': firstName,
          'Middle name': widget.user[i]['middlename'],
          'Last name': widget.user[i]['Lastname'],
          'Date of birth': widget.user[i]['Age'],
          'Gender': widget.user[i]['Gender'],
          'email': widget.user[0]['Email'],
          'phone number': widget.user[0]['phone'],
          'cargo': cargo,
          'seat': seat[i],
          'status': "not booking",
          'Payment Option': '',
          'Book Reference':'',
          'Date': savedformattedDate,
          'Ticket Reference': ticketRefrence,
          'Departure': widget.departureplace,
          'Arrival': widget.arrivalplace,
          'price': widget.price,
          'travelClass':widget.travelClass,
          'NewDate':'',
        });

        TrainTicketManager ticketManager = TrainTicketManager();
        String formattedDate = DateFormat('yyyy-MM-dd').format(widget.dateTime);
        bool success = await ticketManager.bookSeats(cargo, seat, formattedDate);

        if (success) {
          // Show success snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Your seat is booked. Thank you!'),
              duration: Duration(seconds: 3),
            ),
          );
        } else {
          // Show error snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'Error: Your seat is not available. Please try again.'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      }

      // Save the updated list of document IDs to Shared Preferences after the loop
      await BookingStorage().savePassengerDocumentIdsToPrefs(documentIds);

      setState(() {
        _isSaving = false; // Hide spinner when saving completes
      });

      showSuccessDialog();
    } catch (e) {
      setState(() {
        _isSaving = false; // Hide spinner in case of an error
      });

      showErrorDialog(e.toString());
    }
  }

  void showSuccessDialog() {
    // Show success dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Data saved successfully!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Payment(
                      user: widget.user,
                      price: widget.price,
                      departureplace: widget.departureplace,
                      arrivalplace: widget.arrivalplace,
                      dateTime: widget.dateTime,
                      travelClass: widget.travelClass,
                      Cargo: cargo,
                      seat: seat,
                      TransactionRefrence: ticketRefrence,
                    ),
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showErrorDialog(String errorMessage) {
    // Show error dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to save data please try again'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home_screen(),
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
