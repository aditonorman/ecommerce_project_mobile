import 'package:flutter/material.dart';
import 'package:ecommerce_project/screens/menu.dart'; // Updated import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
            .copyWith(secondary: Colors.deepPurple[400]),
      ),
      home: MyHomePage(),
    );
  }
}
