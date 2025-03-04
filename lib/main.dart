import 'package:flutter/material.dart';
import 'package:new03/recipes_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme:ThemeData(
        primarySwatch:Colors.lightBlue,
      ),
      home: HomeScreen(),
      );
  }
}



