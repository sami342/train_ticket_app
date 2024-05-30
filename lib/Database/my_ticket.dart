class MyTicketGenerte {
  final String id;
  final String firstname;
  final String lastname;
  final String departure;
  final String arrival;
  final String Class;
  final String cargo;
  final String seat;
  final String TicketRefrence;

  MyTicketGenerte(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.departure,
      required this.arrival,
      required this.Class,
      required this.cargo,
      required this.seat,
      required this.TicketRefrence});

  factory MyTicketGenerte.fromJson(Map<String, dynamic> json) {
    return MyTicketGenerte(
      id: json['NO'],
      firstname: json['FirstName'],
      lastname: json['LastName'],
      departure: json['DeparturePlace'],
      arrival: json['ArivalPlace'],
      Class: json['Class'],
      cargo: json['Cargo'],
      seat: json['Seat'],
      TicketRefrence: json['Phone'],
    );
  }
}
