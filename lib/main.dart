import 'package:flutter/material.dart';

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
  List<String> imagesList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjGEIKf5RT-lxMxx_qOrK4opqQMOecvvGn9w&usqp=CAU',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/RedCat_8727.jpg/1200px-RedCat_8727.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAtxqSrBSeFoj-zXpQdUjxqhLJU86mkhndwg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThddPBu4Y7Z_msmV_fE_HXLS5QG4IXJaj5aw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5ZNus26cImi0EkSyzjxSIKjgILsc8lbExjg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU4cXYbxLC5LU7i-9tjPQBxSAszrI1ZJCctg&usqp=CAU'
  ];
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
        title: Text("Photo Gallery"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white70,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Well Come to My Photo Gallery!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search for Photos",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              GridView.builder(
                  itemCount: imagesList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      crossAxisCount: 3),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          mySnackBar("You Selected Cat No $index", context);
                        },
                        child: ListTile(
                          title: Image.network(
                            imagesList[index],
                            height: 100,
                            width: 150,
                            fit: BoxFit.fill,
                          ),
                          subtitle: Text("Photo $index"),
                        ));
                  }),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(imagesList[index]),
                          ),
                          title: Text("Description for Photo ${index + 1}"),
                        );
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          mySnackBar("Image Upload Sucessfully", context);
                        },
                        child: Icon(Icons.upload),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: CircleBorder()))),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
