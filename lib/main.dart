import 'package:book_train_ticket/Screens/bottom_dar.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  //firebase option connect
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    runApp(const MyApp());
  } catch (e) {

  }
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primary,
      ),
      navigatorKey: navigatorKey,
      home: AnimatedSplashScreen(
        splash: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            child: Image.asset(
              'image/EDR.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        splashIconSize: 250,
        splashTransition: SplashTransition.scaleTransition,
        nextScreen: const BottomBar(),
      ),
    );
  }
}






// void chapaCo(BuildContext context) async {
//   var chapaPayKey = "CHASECK_TEST-aptf5Itc3nwUpr8xC45mGhsqiUaRnbog";
//   var url = Uri.parse('https://api.chapa.co/v1/transaction/initialize');
//   var redirectUrl = context;
//   var headers = {
//     HttpHeaders.authorizationHeader: 'Bearer $chapaPayKey',
//     HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
//   };
//
//   var request = {
//     'amount': '400',
//     'currency': 'ETB',
//     'email': 'Zsami9017@gmil.com',
//     'first_name': 'samuel',
//     'phone_number': '0930584110',
//     'tx_ref':
//     "chewatatest-${DateTime.now().millisecondsSinceEpoch}", // Use a unique transaction reference
//     "customization[title]": "Payment for my favourite merchant",
//     "customization[description]": "I love online payments",
//     // "redirect_url": redirectUrl,
//   };

//   try {
//     var response = await http
//         .post(url, body: jsonEncode(request), headers: headers)
//         .timeout(const Duration(seconds: 30), onTimeout: () => throw 'Timeout');
//     var result = jsonDecode(response.body);
//     // Check if the response status is success
//     if (result['status'] == 'success') {
//       String? checkoutUrl =
//       result['data']?['checkout_url']; // Check if data is not null
//
//       if (checkoutUrl != null) {
//         launch(checkoutUrl);
//
//       } else {
//         throw 'Checkout URL not found in response data';
//       }
//     } else {
//       throw 'Transaction initialization failed: ${result['message']}';
//     }
//   } catch (e) {
//     // Handle errors
//     print(e.toString());
//     // Display an error message to the user
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text("Payment initialization failed: $e"),
//     ));
//   }
//
//   print("last hello");
// }
