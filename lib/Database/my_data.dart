class MyData {
  final String id;
  final String name;
  final String arrivalplace;
  final String departure;
  final String departureTime;
  final String price;
  final String weekNo;
  final String fullday;
  final String JourneyTime;

  MyData({required this.id,
    required this.name,
    required this.arrivalplace,
    required this.departure,
    required this.departureTime,
    required this.price,
    required this.weekNo,
    required this.fullday,
    required this.JourneyTime,
  });

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      id: json['NO'],
      name: json['Date'],
      arrivalplace: json['ArivalPlace'],
      departure: json['DeparturePlace'],
      departureTime: json['DepartureTime'],
      price: json['price'],
      weekNo: json['dayno'],
      fullday:json['fulldate'],
      JourneyTime: json['journeyTime'],
    );
  }


}
