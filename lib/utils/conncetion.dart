import 'package:connectivity_plus/connectivity_plus.dart';

class FindTicket {
  static Future<bool> findTicket() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        // Connected to a mobile network or Wi-Fi
        return true;
      } else {
        // Not connected to the internet
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
