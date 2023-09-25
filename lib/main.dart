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
    Product(name: "Orange", price: "75"),
    Product(name: "Apple", price: "100"),
    Product(name: "Grapes", price: "200"),
    Product(name: "Strawberry", price: "95"),
    Product(name: "Watermelon", price: "60"),
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
