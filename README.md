
# E-commerce Project

This Flutter project is an e-commerce app built to showcase product listings, manage a shopping cart, and provide a smooth user experience.

## Widgets Overview

In this project, we have used a variety of widgets:

- **Text**: Used for displaying static information like product descriptions and titles.
- **Image**: Shows product images.
- **ListView**: Displays a list of products in a scrollable format.
- **GridView**: Arranges products in a grid format, useful for the main product gallery.
- **Container**: Organizes widgets with padding, margins, and other styles.
- **Card**: Used for each product item, providing elevation and shadow for a polished look.
- **ElevatedButton**: Used for interactive buttons, like "Add to Cart" or "Buy Now."

## Stateless vs Stateful Widgets

### Stateless Widgets

Stateless widgets are immutable, meaning they don't change once built. They are best for displaying static content that doesn't update over time.

```dart
class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("This is a Stateless Widget");
  }
}
```

### Stateful Widgets

Stateful widgets are dynamic and can change based on user interaction or data updates. They have an associated `State` object that holds mutable state.

```dart
class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Counter: $_counter'),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: Text('Increment'),
        ),
      ],
    );
  }
}
```

## Using `setState()`

The `setState()` function is called in a stateful widget when the UI needs to be updated based on some state change. For example, updating the shopping cart count when a product is added.

```dart
void _addToCart() {
  setState(() {
    _cartItemCount++;
  });
}
```

## `const` vs `final`

- **`const`**: Defines a compile-time constant. Its value must be known at compile time and cannot change.
  ```dart
  const String appTitle = "E-commerce App";
  ```

- **`final`**: Defines a runtime constant. It is initialized only once and cannot be modified after.
  ```dart
  final DateTime today = DateTime.now();
  ```

Use **`const`** for values that are fixed at compile time and **`final`** for values determined at runtime but never reassigned.

# Step by Step

## Project Setup

### 1. Organize Project Files

- In `lib`, create a new file named `menu.dart`.
- In `menu.dart`, import `material.dart`:

    ```dart
    import 'package:flutter/material.dart';
    ```

- Move the `MyHomePage` class (and any `State` classes, if applicable) from `main.dart` to `menu.dart`.
- Fix the import error in `main.dart` by importing `menu.dart`:

    ```dart
    import 'package:ecommerce_project/menu.dart';
    ```

### 2. Modify the `MyHomePage` Widget

- Update `main.dart` to use `MyHomePage()` instead of `const MyHomePage(title: 'Flutter Demo Home Page')`.
- In `menu.dart`, make `MyHomePage` a stateless widget:
  - Remove the `title` parameter.
  - Change `extends StatefulWidget` to `extends StatelessWidget`.
  - Simplify the `MyHomePage` widget as follows:

    ```dart
    class MyHomePage extends StatelessWidget {
        MyHomePage({super.key});

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(title: Text("E-Commerce App")),
                body: Center(child: Text("Welcome to the E-Commerce App")),
            );
        }
    }
    ```

### 3. Create Button Widgets

- Define three variables for your card titles and icons within `MyHomePage`:

    ```dart
    final List<ItemHomepage> items = [
        ItemHomepage("View Product List", Icons.list, Colors.blue),
        ItemHomepage("Add Product", Icons.add, Colors.green),
        ItemHomepage("Logout", Icons.logout, Colors.red),
    ];
    ```

- Create an `ItemCard` widget in `menu.dart` for each button:

    ```dart
    class ItemCard extends StatelessWidget {
        final ItemHomepage item;
        const ItemCard(this.item, {super.key});

        @override
        Widget build(BuildContext context) {
            return Material(
                color: item.color,
                child: InkWell(
                    onTap: () {
                        final snackBar = SnackBar(
                            content: Text("You have pressed the ${item.name} button"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Icon(item.icon, color: Colors.white),
                            Text(item.name, style: TextStyle(color: Colors.white)),
                        ],
                    ),
                ),
            );
        }
    }
    ```

- Display `ItemCard` in a grid format within `MyHomePage`:

    ```dart
    GridView.count(
        crossAxisCount: 3,
        children: items.map((item) => ItemCard(item)).toList(),
    );
    ```

### 4. Customize Button Colors

- In `menu.dart`, assign different colors for each button within the `ItemCard` widget.
- Add color to `ItemHomepage`:

    ```dart
    final Color color;
    ItemHomepage(this.name, this.icon, this.color);
    ```

- Update the `items` list with specific colors:

    ```dart
    final List<ItemHomepage> items = [
        ItemHomepage("View Product List", Icons.list, Colors.blue),
        ItemHomepage("Add Product", Icons.add, Colors.green),
        ItemHomepage("Logout", Icons.logout, Colors.red),
    ];
    ```

- In `ItemCard`, apply `item.color`:

    ```dart
    color: item.color,
    ```
