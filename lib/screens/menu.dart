// lib/screens/menu.dart

import 'package:flutter/material.dart';
import 'package:ecommerce_project/widgets/left_drawer.dart';
import 'package:ecommerce_project/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // User information
  final String npm = '2306256450'; // Replace with your actual NPM
  final String name = 'Muhammad Raditya Indrastata Norman'; // Replace with your actual name
  final String className = 'KKI'; // Replace with your actual class

  final List<ItemHomepage> items = [
    ItemHomepage("View Product List", Icons.list, Colors.blue),
    ItemHomepage("Add Product", Icons.add_box, Colors.green),
    ItemHomepage("Logout", Icons.logout, Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'E-Commerce App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white), // Set drawer icon color to white
      ),
      drawer: const LeftDrawer(), // Add drawer
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display user information with InfoCard widgets
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                'Welcome to the E-Commerce App',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            const SizedBox(height: 20),
            // Display item cards in a grid format
            Expanded(
              child: GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: items.map((item) => ItemCard(item)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}
