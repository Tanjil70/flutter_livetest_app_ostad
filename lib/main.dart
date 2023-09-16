import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> fruits = ["Apples", "Bananas", "Bread", "Milk", "Eggs"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white70,
          title: const Text("My Shopping List"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add_shopping_cart))
          ],
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
            itemCount: fruits.length,
            itemBuilder: (context, index) {
              return Column(children: [
                ListTile(
                  title: Text(fruits[index]),
                  leading: Icon(Icons.shopping_cart),
                )
              ]);
            }));
  }
}
