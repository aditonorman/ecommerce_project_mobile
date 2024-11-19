// lib/widgets/item_card.dart

import 'package:flutter/material.dart';
import 'package:ecommerce_project/screens/add_product_form.dart';
import 'package:ecommerce_project/screens/list_productentry.dart';
import 'package:ecommerce_project/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () async {
          print("Item tapped: ${item.name}");

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You have pressed the ${item.name} button")),
            );

          try {
            if (item.name == "Add Product") {
              print("Navigating to AddProductFormPage");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddProductFormPage()),
              );
            } else if (item.name == "View Product List") { // Ensure this matches the item.name
              print("Navigating to ProductEntryPage");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductEntryPage()),
              );
            } else if (item.name == "Logout") {
              print("Initiating logout process");
              // Handle logout logic here
              final response = await request.logout(
                "http://127.0.0.1:8000/auth/logout/", // Update URL accordingly
              );

              String message = response["message"];
              if (context.mounted) {
                if (response['status']) {
                  String uname = response["username"];
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("$message Goodbye, $uname."),
                    ),
                  );

                  // Navigate to LoginPage after logout
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ),
                  );
                }
              }
            }
          } catch (e) {
            print("Navigation error: $e");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Failed to navigate: $e")),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(16), // Increased padding for better touch area
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white, size: 30.0),
                const SizedBox(height: 10),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
