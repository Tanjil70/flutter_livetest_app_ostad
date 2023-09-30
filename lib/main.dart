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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Determine the number of columns based on orientation
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final numColumns =
        isPortrait ? 3 : 2; // 3 columns in portrait, 2 in landscape

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/images/cam.jpg'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "John Doe",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Lorem Ipsum es simplemente el texto de relleno de las imprentas y "
                "archivos de text oLorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500",
                style: TextStyle(color: Colors.black),
              ),
              OrientationBuilder(
                builder: (context, orientation) {
                  return GridView.builder(
                    itemCount: 6, // Total number of images
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          numColumns, // Number of columns based on orientation
                      crossAxisSpacing: 8.0, // Horizontal spacing between items
                      mainAxisSpacing: 8.0, // Vertical spacing between items
                    ),
                    itemBuilder: (context, index) {
                      // You can replace 'cam.jpg' with the appropriate image paths
                      final imagePath = 'assets/images/Nature-PNG.png';
                      return Image.asset(imagePath);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
