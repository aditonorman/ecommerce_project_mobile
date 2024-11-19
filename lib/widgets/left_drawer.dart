// lib/widgets/left_drawer.dart

import 'package:ecommerce_project/models/product_entry.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_project/screens/menu.dart';
import 'package:ecommerce_project/screens/add_product_form.dart';
import 'package:ecommerce_project/screens/list_productentry.dart';

 // To be created

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'E-Commerce App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Manage your products efficiently!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          ListTile(
    leading: const Icon(Icons.add_reaction_rounded),
    title: const Text('Product List'),
    onTap: () {
        // Route to the mood page
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductEntryPage()),
        );
    },
),
          ListTile(
            leading: const Icon(Icons.add_box),
            title: const Text('Add Product'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddProductFormPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
