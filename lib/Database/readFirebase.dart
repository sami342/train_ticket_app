import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String bookReference;
  DateTime? date;
  int dateOfBirth;
  String firstName;
  String gender;
  String lastName;
  String middleName;
  String paymentOption;
  String cargo;
  String email;
  String phoneNumber;
  int seat;
  String status;
  String Departure;
  String Arrival;
  String TicketRefrence;
  int price;
   String newdate;
   String BookReference;

  User({
    required this.bookReference,
    this.date,
    required this.dateOfBirth,
    required this.firstName,
    required this.gender,
    required this.lastName,
    required this.middleName,
    required this.paymentOption,
    required this.cargo,
    required this.email,
    required this.phoneNumber,
    required this.seat,
    required this.status,
    required this.Arrival,
    required this.Departure,
    required this.TicketRefrence,
    required this.price,
    required this.BookReference,
    required this.newdate,
  });

  factory User.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return User(
      bookReference: data['bookReference'] ?? '',
      date: data['Date'] != null ? DateTime.tryParse(data['Date']) : null,
      dateOfBirth: data['Date of birth'] ?? 0,
      firstName: data['First name'] ?? '',
      gender: data['Gender'] ?? '',
      lastName: data['Last name'] ?? '',
      middleName: data['Middle name'] ?? '',
      paymentOption: data['Payment Option'] ?? '',
      cargo: data['cargo'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phone number'] ?? '',
      seat: data['seat'] ?? 0,
      status: data['status'] ?? '',
      Departure: data['Departure'] ?? '',
      Arrival: data['Arrival'] ?? '',
      TicketRefrence: data['Ticket Reference'] ?? '',
      price: data['price'] ?? '',
      BookReference: data['Book Reference'] ?? '',
      newdate: data['NewDate'] ?? '',
    );
  }
}

Future<User?> getUserData(String docId) async {
  try {
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('user').doc(docId).get();
    if (doc.exists) {
      return User.fromDocument(doc);
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}
