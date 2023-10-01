import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Feed'),
        ),
        body: ImageFeed(),
      ),
    );
  }
}

class ImageFeed extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/images/150.png',
    'assets/images/150.png',
    'assets/images/150.png',
    'assets/images/150.png',
    'assets/images/150.png',
    'assets/images/150.png',
    'assets/images/150.png',
    'assets/images/150.png',
    'assets/images/150.png',
    'assets/images/150.png',
  ];

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              isPortrait ? 1 : 2, // 1 column in portrait, 2 in landscape
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          final imageUrl = imageUrls[index];
          return Card(
            elevation: 4.0,
            child: Image.network(
              imageUrl,
            ),
          );
        },
      ),
    );
  }
}
