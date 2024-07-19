import 'package:book_train_ticket/Screens/bottom_dar.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nb_utils/nb_utils.dart';
import 'firebase_options.dart';
import 'package:awesome_notifications/awesome_notifications.dart';




void main() async {

  //firebase option connect
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    runApp(const MyApp());
  } catch (e) {
  throw 'there is an error in database initalization';
  }

  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  try{
    AwesomeNotifications().initialize(
      'resource://drawable/img', // App icon resource
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic Notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
          importance: NotificationImportance.High,
          channelShowBadge: true,
          // Provide the small icon here
          defaultRingtoneType: DefaultRingtoneType.Notification,
          playSound: true,
         icon: 'resource://drawable/img', // Ensure this resource exists
        ),
      ],
      debug: true,
    );

  }catch(e){
    throw("Error+$e");
  }

}

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
       home: const BottomBar(),
    );
  }
}

