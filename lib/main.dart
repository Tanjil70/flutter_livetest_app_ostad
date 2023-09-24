/*
import 'package:flutter/material.dart';

import 'card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white70,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0))))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> fruitsList = [
    Product(name: "Mango", price: "100"),
    Product(name: "Banana", price: "50"),
    Product(name: "Orange", price: "75"),
    Product(name: "Apple", price: "100"),
    Product(name: "Grapes", price: "200"),
    Product(name: "Strawberry", price: "95"),
    Product(name: "Watermelon", price: "60"),
    Product(name: "Cherry", price: "85"),
    Product(name: "Peach", price: "120"),
    Product(name: "Pineapple", price: "110"),
  ];
  int totalBought = 0;
  void addCart(index) {
    setState(() {
      fruitsList[index].quantity++;
      if (fruitsList[index].quantity == 5) {
        _showCongratulationsDialog(fruitsList[index].name);
      }
      totalBought++;
    });
  }

  void _showCongratulationsDialog(String productName) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('congratulations!'),
            content: Text(
              'You\'ve bought 5 $productName!',
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"))
            ],
          );
        });
  }

  mySnackBar(message, contex) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      //backgroundColor: Colors.green,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white70,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            ListView.builder(
              itemCount: fruitsList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${fruitsList[index].name}"),
                  subtitle: Text("${fruitsList[index].price} tk"),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Count ${fruitsList[index].quantity}"),
                      ElevatedButton(
                          onPressed: () {
                            addCart(index);
                          },
                          child: Text("Buy Now"))
                    ],
                  ),
                );
              },
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CartPage(
                              totalBought: totalBought,
                            )));
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.blue,
              ),
            )
          ]),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Product {
  String name;
  String price;
  int quantity = 0;
  Product({required this.name, required this.price});
}
*/
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> fruitsList = [
    Product(name: "Mango", price: "100"),
    Product(name: "Banana", price: "50"),
    Product(
        name: "Mango", price: "150"), // Another Mango with a different price
    Product(name: "Apple", price: "100"),
  ];

  Map<String, int> cart = {}; // Key: Unique identifier, Value: Count

  void addCart(index) {
    final product = fruitsList[index];
    final uniqueIdentifier = '${product.name}${product.price}';

    setState(() {
      // Check if the cart map is initialized and not null
      cart[uniqueIdentifier] = (cart[uniqueIdentifier] ?? 0) + 1;

      if (cart[uniqueIdentifier] == 5) {
        _showCongratulationsDialog(product.name);
      }
    });
  }

  void _showCongratulationsDialog(String productName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You\'ve bought 5 $productName!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                itemCount: fruitsList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final product = fruitsList[index];
                  final uniqueIdentifier = '${product.name}${product.price}';
                  final count = cart[uniqueIdentifier] ?? 0;

                  return ListTile(
                    title: Text("${product.name}"),
                    subtitle: Text("${product.price} tk"),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Count: $count"),
                        ElevatedButton(
                          onPressed: () {
                            addCart(index);
                          },
                          child: Text("Buy Now"),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(
                        cart: cart,
                        fruitsList: fruitsList,
                      ),
                    ),
                  );
                },
                child: Text("Go to Cart"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  String name;
  String price;
  Product({required this.name, required this.price});
}

class CartPage extends StatelessWidget {
  final Map<String, int> cart;
  final List<Product> fruitsList;

  CartPage({required this.cart, required this.fruitsList});

  @override
  Widget build(BuildContext context) {
    // Calculate the total number of unique products in the cart
    int totalUniqueProducts = cart.keys.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total Unique Products: $totalUniqueProducts'),
            // Display other cart items here
          ],
        ),
      ),
    );
  }
}
