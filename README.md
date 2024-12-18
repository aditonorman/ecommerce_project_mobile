# Assignment 7

---

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
---
# Assignment 8




## 1. Purpose and Advantages of `const` in Flutter

### Purpose of `const`
In Flutter, the `const` keyword defines compile-time constants. Declaring an object as `const` signals to the framework that the object’s properties won’t change, which optimizes the widget tree.

### Advantages of Using `const`
- **Performance Optimization**
  - **Reduced Rebuilds**: `const` widgets are created at compile-time and reused, reducing unnecessary recreations.
  - **Memory Efficiency**: Since `const` objects are immutable and shared, they use less memory.
- **Improved Compile-Time Safety**: Ensures values are constant, reducing accidental changes.
- **Enhanced Readability and Maintenance**: Clearly indicates static widgets, simplifying the codebase.

### When to Use `const`
- **Immutable Widgets**: Use `const` for static widgets (e.g., text, icons).
- **Repeated Widgets**: Use `const` for identical widgets to enable reuse.
- **Constructor Parameters**: Use `const` in constructors for immutable objects.

### When Not to Use `const`
- **Dynamic Widgets**: Avoid `const` for widgets with properties that may change.
- **Runtime Data Widgets**: Avoid `const` for widgets depending on runtime data, such as user input.
- **Stateful Widgets**: Since stateful widgets manage changing state, they should not be `const`.

## 2. Usage and Comparison of `Column` and `Row` in Flutter

### Column Widget
- **Purpose**: Arranges child widgets vertically.
- **Use Case**: Suitable for stacking elements vertically, such as in forms or lists.
- **Example**:
  ```dart
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Product Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      SizedBox(height: 10),
      TextFormField(decoration: InputDecoration(labelText: 'Enter product name')),
      SizedBox(height: 20),
      ElevatedButton(onPressed: () {}, child: Text('Submit')),
    ],
  );
  ```

### Row Widget
- **Purpose**: Arranges child widgets horizontally.
- **Use Case**: Suitable for placing elements side by side, like navigation bars.
- **Example**:
  ```dart
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Icon(Icons.menu, size: 30),
      Text('E-Commerce App', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      Icon(Icons.shopping_cart, size: 30),
    ],
  );
  ```

### Comparison
| Aspect         | Column (Vertical)            | Row (Horizontal)            |
|----------------|------------------------------|-----------------------------|
| Orientation    | Y-axis                       | X-axis                      |
| Use Cases      | Vertical layouts (forms)     | Horizontal layouts (nav bar)|
| Scrolling      | Often with vertical scrolling| Often with horizontal       |

## 3. Input Elements Used on the Form Page and Other Flutter Input Elements

### Input Elements in `add_product_form.dart`
- **TextFormField for Product Name**:
  ```dart
  TextFormField(
    decoration: InputDecoration(hintText: "Product Name", labelText: "Name"),
  );
  ```
- **TextFormField for Product Amount**: Number input with validation.
- **TextFormField for Product Description**: Multi-line text input.
- **ElevatedButton for Save Action**: Submits form data.

### Additional Flutter Input Elements
- **Checkbox**: Multi-select options.
- **Radio**: Single select.
- **Switch**: Toggle between two states.
- **Slider**: Value selection within a range.
- **DatePicker**: Date selection.
- **DropdownButton**: Selection from a list.
- **Autocomplete**: Provides suggestions as the user types.

## 4. Setting and Implementing Theme in a Flutter Application

### Setting a Theme
Define a consistent visual style using `ThemeData`:
```dart
ThemeData(
  primarySwatch: Colors.deepPurple,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
      .copyWith(secondary: Colors.deepPurple[400]),
);
```
Apply the theme in `MaterialApp`:
```dart
MaterialApp(
  title: 'E-Commerce App',
  theme: ThemeData(colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)),
);
```

### Theme Benefits
- **Consistency**: Uniform UI appearance.
- **Ease of Updates**: Updating `ThemeData` properties automatically applies changes across widgets.
- **Enhanced User Experience**: Improves the app's visual appeal.

## 5. Managing Navigation in a Multi-Page Flutter Application

### Key Components for Navigation
- **Routes**: Different screens in the app.
- **Navigator**: Manages navigation stack with methods like `push` and `pop`.
- **MaterialPageRoute**: Platform-adaptive screen transition.

### Navigation Methods Used in the Application
- **Navigator.push**: Navigates to a new screen.
- **Navigator.pushReplacement**: Replaces the current screen with a new one.
- **Navigator.pop**: Returns to the previous screen.

### Best Practices for Navigation
- **Use Named Routes**: Define routes in `MaterialApp` for easier navigation in larger applications.
- **Clear Hierarchy**: Ensure intuitive flow between screens.
- **Consistent Navigation Components**: Use `Drawer` or `BottomNavigationBar` for primary sections.

### Advanced Navigation Techniques
- **Modularize Screens**: Separate screen files for maintainability.
- **Use Route Arguments**: Pass data between screens via arguments.

---

# Assignment 9


---

## Why Create Models?

Creating a model in Flutter (Dart) allows the app to parse and handle JSON data efficiently. Models provide:
- **Structured Representation**: Simplifies data handling by creating well-defined classes.
- **Type Safety**: Reduces the risk of runtime errors caused by untyped data.
- **Code Maintainability**: Improves readability and scalability of the codebase.
- **IDE Features**: Enables autocompletion, error checking, and better debugging.

Without models, parsing JSON data results in untyped `Map<String, dynamic>` objects, which are harder to manage and error-prone.

---

## HTTP Library Functionality

The `http` library facilitates communication between the Flutter app and the Django backend. Its key functions include:
- Performing **HTTP requests** (e.g., `GET`, `POST`).
- Managing **data transmission** for fetching and submitting JSON data.
- Ensuring **seamless user authentication** through integration with `pbp_django_auth`.

In this project, it helps the app handle:
1. User authentication.
2. CRUD operations on products.
3. Data exchange with Django.

---

## CookieRequest and Shared Instance

`CookieRequest` is a class provided by the `pbp_django_auth` package. It manages:
- **Session Cookies**: Maintains user authentication state across the app.
- **Secure HTTP Requests**: Adds authentication tokens to each request.

By sharing a single `CookieRequest` instance with all app components, it ensures:
- Unified session management.
- Consistent access to protected backend endpoints without re-authentication.

---

## Data Transmission Mechanism

1. **Input**: Users enter data into Flutter forms (e.g., login, registration, product details).
2. **Submission**: Input data is serialized into JSON format.
3. **Transmission**: JSON data is sent to Django via HTTP POST requests using `CookieRequest`.
4. **Backend Processing**: Django processes the data (e.g., authenticates users, saves products) and returns a JSON response.
5. **Reception**: Flutter deserializes the response into Dart models.
6. **Display**: The app updates the UI based on the received data (e.g., product lists, messages, error alerts).

---

## Authentication Mechanism

### Registration
1. **Input**: User inputs username and password in the Flutter registration form.
2. **Transmission**: Flutter sends a POST request to `/auth/register/` in Django.
3. **Backend**:
   - Validates data.
   - Creates a new user.
   - Returns a success or failure response.
4. **Response Handling**: Flutter shows a success message or an error and navigates appropriately.

### Login
1. **Input**: User enters credentials in the Flutter login form.
2. **Transmission**: Flutter sends a POST request to `/auth/login/`.
3. **Backend**:
   - Authenticates the user.
   - Initiates a session.
   - Returns a success or failure response.
4. **Response Handling**:
   - On success: Updates `CookieRequest`, navigates to the main menu.
   - On failure: Displays an error dialog.

### Logout
1. **Action**: User taps the logout button in the Flutter app.
2. **Transmission**: Flutter sends a POST request to `/auth/logout/`.
3. **Backend**:
   - Terminates the session.
   - Returns a success response.
4. **Response Handling**:
   - Clears session state.
   - Navigates to the login page.

---

## Step-by-Step Implementation

### 1. Set Up Django Authentication
- Created a new Django app: `authentication`.
- Installed and configured `django-cors-headers` for CORS handling.
- Defined Django views for login, register, and logout, handling JSON and user sessions.
- Configured Django URLs for authentication endpoints.

### 2. Integrate Authentication in Flutter
- Installed `provider` and `pbp_django_auth` packages for state management and authentication.
- Configured `main.dart` to share a `CookieRequest` instance across the app using `Provider`.
- Developed `LoginPage` and `RegisterPage` with forms for user input and response handling.

### 3. Create Custom Model
- Used [Quicktype](https://app.quicktype.io/) to generate Dart models (`ProductEntry`) based on Django JSON structure.
- Ensured models accurately represent data for seamless parsing and display.

### 4. Fetch and Display Products
- Created a Django view to return product data in JSON format, filtered by the logged-in user.
- Developed `ProductEntryPage` in Flutter:
  - Fetches product data using `CookieRequest`.
  - Displays data in a list format.
- Created `ProductDetailPage` to display detailed information for selected products.

### 5. Filter Products by User
- Modified Django views to filter products by the authenticated user.
- Ensured Flutter requests include session cookies for authentication.

### 6. Implement Logout Feature
- Added logout functionality in both Django and Flutter.
- Ensured logging out clears session state and redirects users to the login screen.

---

