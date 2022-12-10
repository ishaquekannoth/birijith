import 'package:brijith/onboarding.dart';
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
      title: 'Brijith App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const OnBoard(),
    );
  }
}



