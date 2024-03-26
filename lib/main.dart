import 'package:book_train_ticket/Screens/bottom_dar.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor:primary,
      ),
      home: const BottomBar(),
    );
  }
}

