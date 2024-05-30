import 'package:book_train_ticket/Screens/payment.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Database/city_abrivation.dart';
import 'edit_passngers.dart';

class PassengerConfrim extends StatefulWidget {
  List<Map<String, dynamic>> user;
  final String departureplace;
  final String arrivalplace;
  final DateTime dateTime;
  final int price;

  PassengerConfrim(
      {super.key,
      required this.user,
      required this.arrivalplace,
      required this.departureplace,
      required this.dateTime,
      required this.price});

  @override
  State<PassengerConfrim> createState() => _PassengerConfrimState();
}

class _PassengerConfrimState extends State<PassengerConfrim> {
  late String formattedDate;
  bool _isSaving = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formattedDate = DateFormat('MMM d, y').format(widget.dateTime);
    print(widget.departureplace);
    print(widget.arrivalplace);
    print(widget.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styles.bgColor,
      appBar: AppBar(
        leading: const BackButton(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Passenger details"),
            InkWell(
              child: const Icon(Icons.home),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Cancel Booking?'),
                      content: const Text(
                          'Are you sure you want to cancel the booking?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                            // Navigate to the first screen
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                    );
                  },
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
                  children: [
                    Text(CityAbbreviation.getAbbreviation(
                        widget.departureplace)),
                    const Icon(Icons.arrow_forward),
                    Text(CityAbbreviation.getAbbreviation(widget.arrivalplace)),
                    const Gap(235),
                    const Text("  Price"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formattedDate),
                    Text(
                      '${widget.price} ETB',
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
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
                    Text(
                      "passengers  Details",
                      style:
                          styles.headLineStyle3.copyWith(color: Colors.black),
                    ),
                    const Gap(120),
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
                                      dateTime:widget.dateTime,
                                    )));
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
                    onPressed: () {
                      //  saveUserToFirestore();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Payment(
                                    user: widget.user,
                                    price: widget.price,
                                    departureplace: widget.departureplace,
                                    arrivalplace: widget.arrivalplace,
                                     dateTime: widget.dateTime,

                                  )));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text(
                      "Continue to payment ",
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

  void saveUserToFirestore() {
    setState(() {
      _isSaving = true;
    });
    try {
      for (int i = 0; i < widget.user.length; i++) {
        CollectionReference<Map<String, dynamic>> passengersCollection =
            FirebaseFirestore.instance.collection("user");
        passengersCollection.add({
          'First name': widget.user[i]['Firstname'],
          'Middle name': widget.user[i]['middlename'],
          'Last name': widget.user[i]['Lastname'],
          'Date of birth': widget.user[i]['Datetime'],
          'Gender': widget.user[i]['Gender'],
          'email': widget.user[0]['Email'],
          'phone number': widget.user[0]['phone'],
          'cargo': widget.user[i]['Firstname'],
          'seat': widget.user[i]['Firstname'],
          'status': "not booking",
        });
      }
      setState(() {
        _isSaving = false; // Show spinner when saving starts
      });
      showSuccessDialog();
    } catch (e) {
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
                Navigator.of(context).pop();
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
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
