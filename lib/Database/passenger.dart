class Passenger {
  final String id;
  final String FirstName;
  final String MiddleName;
  final String LastName;
  final String Age;
  final String Sex;
  final String DeparturePlace;
  final String ArivalPlace;
  final String Class;
  final String Cargo;
  final String Seat;
  final String Phone;
  final String Date;
  final String Price;
  final String TextReference;

  Passenger({
    required this.id,
    required this.FirstName,
    required this.MiddleName,
    required this.LastName,
    required this.Age,
    required this.Sex,
    required this.DeparturePlace,
    required this.ArivalPlace,
    required this.Class,
    required this.Cargo,
    required this.Seat,
    required this.Phone,
    required this.Date,
    required this.TextReference,
    required this.Price,
  });

  factory Passenger.fromJson(Map<String, dynamic> json) {
    return Passenger(
      id: json['NO'],
      FirstName: json['FirstName'],
      MiddleName: json['MiddleName'],
      LastName: json['LastName'],
      Age: json['Age'],
      Sex: json['Sex'],
      DeparturePlace: json['DeparturePlace'],
      ArivalPlace: json['ArrivalPlace'],
      Class: json['Class'],
      Cargo: json['Cargo'],
      Seat: json['Seat'],
      Phone: json['Phone'],
      Date: json['Date'],
      TextReference: json['TextReference'],
      Price: json['price']
    );
  }
}
