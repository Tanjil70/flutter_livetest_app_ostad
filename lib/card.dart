/*
import 'package:flutter/material.dart';

import 'main.dart';

class CartPage extends StatelessWidget {
  int calculateTotalUniqueProducts() {
    // Convert the list of products to a set to ensure uniqueness
    final uniqueProducts = fruitsList.toSet();
    return uniqueProducts.length;
  }
  */
/* final List<Product> fruitsUniqueList;
  CartPage({required this.fruitsUniqueList});
  int calculateTotalUniqueProducts() {
    final uniqueProducts = Set<Product>.from(fruitsUniqueList);
    return uniqueProducts.length;
  }*/ /*

*/
/*class _ProductListState extends State<Pr> {
  List<Product> cart = [];

  // Function to calculate the total number of unique products
  int calculateTotalUniqueProducts() {
    // Convert the list of products to a set to ensure uniqueness
    final uniqueProducts = cart.toSet();
    return uniqueProducts.length;
  }*/ /*


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text")),
      body: Center(
        child: Text("${totalBought}"),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';

import 'main.dart';

class CartPage extends StatelessWidget {
  final int totalBought;

  CartPage({required this.totalBought});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total Number of  Products: $totalBought'),
            // Display other cart items here
          ],
        ),
      ),
    );
  }
}
