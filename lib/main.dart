import 'package:flutter/material.dart';
import 'package:ecommerce_project/screens/menu.dart'; 
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_project/screens/register.dart';
import 'package:ecommerce_project/screens/login.dart';
import 'package:ecommerce_project/screens/add_product_form.dart';
// Updated import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'E-Commerce Project',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple,
          ).copyWith(secondary: Colors.deepPurple[400]),
        ),
        home: LoginPage(),
      ),
    );
  }
}