import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class TrainTicketManager {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> addCargos(List<String> cargoIds) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Get current date
      DateTime currentDate = DateTime.now();

      // Generate dates for three weeks ahead
      List<DateTime> dates = [];
      for (int i = 0; i < 21; i++) {
        DateTime date = currentDate.add(Duration(days: i));
        dates.add(date);

      }

      // Initialize availability for each date
      for (String cargoId in cargoIds) {
        Map<String, dynamic> weekAvailability = {};

        for (DateTime date in dates) {
          String dateString = DateFormat('yyyy-MM-dd').format(date);
          List<Map<String, dynamic>> seats = List.generate(120, (index) => {'number': index + 1, 'available': true, 'status': 'none'});

          weekAvailability[dateString] = {'seats': seats};
        }

        // Set availability for the cargo
        await firestore.collection('cargos').doc(cargoId).set({
          'weekAvailability': weekAvailability,
        });
      }

      return true; // Operation successful
    } catch (e) {

      return false; // Operation failed
    }
  }


  Future<bool> bookSeats(String cargoId, List<int> seatNumbers, String date) async {
    DocumentReference cargoRef = _firestore.collection('cargos').doc(cargoId);

    try {
      await _firestore.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(cargoRef);
        Map<String, dynamic> weekAvailability = snapshot['weekAvailability'];
        if (!weekAvailability.containsKey(date)) {
          throw Exception("No data available for the given date");
        }

        List<dynamic> seats = List.from(weekAvailability[date]['seats']);

        for (int seatNumber in seatNumbers) {
          if (seatNumber < 1 || seatNumber > 120) {
            throw Exception("Seat number $seatNumber is out of bounds");
          }
          int seatIndex = seatNumber - 1;
          if (seats[seatIndex]['available']) {
            seats[seatIndex]['available'] = false; // Seat is now booked
            seats[seatIndex]['status'] = 'booked'; // Update status to 'booked'
          } else {
            throw Exception("Seat $seatNumber is already booked");
          }
        }

        weekAvailability[date]['seats'] = seats;
        transaction.update(cargoRef, {'weekAvailability': weekAvailability});
      });

      return true; // Booking successful
    } catch (e) {

      return false; // Booking failed
    }
  }



// ... isSeatAvailable method

  Future<Map<int, bool>> areSeatsAvailable(String cargoId, List<int> seatNumbers, String date) async {
    try {
      DocumentSnapshot snapshot = await _firestore.collection('cargos').doc(cargoId).get();
      Map<String, dynamic> dates = snapshot['weekAvailability'];
      if (!dates.containsKey(date)) {
        throw Exception("No data available for the given date");
      }

      List<dynamic> seats = List.from(dates[date]['seats']);

      Map<int, bool> availability = {};

      for (int seatNumber in seatNumbers) {
        if (seatNumber < 1 || seatNumber > 120) {
          throw Exception("Seat number $seatNumber is out of bounds");
        }

        int seatIndex = seatNumber - 1;
        Map<String, dynamic> seat = seats[seatIndex] as Map<String, dynamic>;
        availability[seatNumber] = seat['available'] as bool;
      }

      return availability;
    } catch (e) {
      return {}; // Return an empty map in case of an error
    }
  }




Future<int> getPassengerCount(String cargoId) async {
  DocumentSnapshot snapshot = await _firestore.collection('cargos')
      .doc(cargoId)
      .get();
  List<bool> seats = List.from(snapshot['seats']);
  int count = seats
      .where((seat) => !seat)
      .length;
  return count;
}

  Future<List<int>> getUnavailableSeats(String cargoId, String date) async {
    try {
      List<int> unavailableSeats = [];
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('cargos').doc(cargoId).get();
      Map<String, dynamic> weekAvailability = snapshot['weekAvailability'];

      if (weekAvailability.containsKey(date)) {
        List<dynamic> seats = List.from(weekAvailability[date]['seats']);

        for (int i = 0; i < seats.length; i++) {
          if (!(seats[i]['available'] as bool)) {
            // Seat is not available, add it to the list
            unavailableSeats.add(seats[i]['number'] as int);
          }
        }
      } else {
        throw Exception("No data available for the given date");
      }

      return unavailableSeats;
    } catch (e) {
      return [];
    }
  }




  Future<void> updateSeatStatusToTaken(String cargoId, List<int> seatNumbers, String date) async {
    try {
      DocumentReference cargoRef = FirebaseFirestore.instance.collection('cargos').doc(cargoId);
      DocumentSnapshot snapshot = await cargoRef.get();
      Map<String, dynamic> weekAvailability = snapshot['weekAvailability'];

      if (weekAvailability.containsKey(date)) {
        List<dynamic> seats = List.from(weekAvailability[date]['seats']);

        for (int seatNumber in seatNumbers) {
          int seatIndex = seatNumber - 1;
          if (seatIndex >= 0 && seatIndex < seats.length) {
            // Update the status of the specific seat
            seats[seatIndex]['status'] = 'taken';
          } else {
            throw Exception("Seat number $seatNumber is out of bounds");
          }
        }

        // Update the seat statuses in Firestore
        await cargoRef.update({
          'weekAvailability.$date.seats': seats,
        });
      } else {
        throw Exception("No data available for the given date");
      }
    } catch (e) {
      throw Exception("Invalid date");
      // Handle error if needed
    }
  }


  Future<List<int>> getBookedSeats(String cargoId, String date) async {
    try {
      List<int> bookedSeats = [];
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('cargos').doc(cargoId).get();
      Map<String, dynamic> weekAvailability = snapshot['weekAvailability'];

      if (weekAvailability.containsKey(date)) {
        List<dynamic> seats = List.from(weekAvailability[date]['seats']);

        for (int i = 0; i < seats.length; i++) {
          if (seats[i]['status'] == 'booked' || !(seats[i]['available'] as bool)) {
            // Seat is booked or not available, add it to the list
            bookedSeats.add(seats[i]['number'] as int);
          }
        }
      } else {
        throw Exception("No data available for the given date");
      }

      return bookedSeats;
    } catch (e) {
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
          if (seats[i]['status'] == 'booked' || !(seats[i]['available'] as bool)) {
            // Seat is booked or not available, add it to the list
            takenSeats.add(seats[i]['number'] as int);
          }
        }
      } else {
        throw Exception("No data available for the given date");
      }

      return takenSeats;
    } catch (e) {
      return [];
    }
  }




}
