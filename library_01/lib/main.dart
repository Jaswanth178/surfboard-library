import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController editingController = TextEditingController();
  Widget myArticles(
    String imageVal,
    String heading,
    String subHeading,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return BookDetailsPage(heading: heading);
            },
          ),
        );
      },
      child: Container(
        width: 160.0,
        child: Card(
          child: Wrap(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Image.network(
                    imageVal,
                    height: 120,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text(
                    heading,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(subHeading),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Surfboard',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            color: Colors.black,
            icon: const Icon(
              Icons.add_alert,
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return const Notifications();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            TextField(
              onChanged: (value) {},
              controller: editingController,
              decoration: InputDecoration(
                labelText: "Search Books here",
                hintText: "Search By Book name and Author",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              heightFactor: 3,
              child: Text(
                "Category",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              height: 0,
              thickness: 3,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  myArticles(
                      "https://learntocodewith.me/wp-content/uploads/2020/01/Inside-the-machine-1024x576.jpeg",
                      "Coding",
                      "Machine"),
                  myArticles(
                      "https://www.madrasshoppe.com/128957-home_default/extreme-ownership-jocko-willink.jpg",
                      "Non-Fiction",
                      "Leadership"),
                  myArticles(
                      "https://i.insider.com/5c0ac5d19d860a228b0e84cd?width=750&format=jpeg&auto=webp",
                      "Fiction",
                      "Drama"),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "My books",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              height: 50,
              thickness: 3,
              // indent: 15,
              // endIndent: 15,
            ),
            const Center(
              heightFactor: 8,
              widthFactor: 130.0,
              child: Text("Borrowed Books will apper here",
                  style: TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Notification",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Center(
        child: Text(
          "Notification's visible here",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class BookDetailsPage extends StatelessWidget {
  final String heading;
  BookDetailsPage({required this.heading});

  Widget myArticles(
      String imageVal, String heading, String subHeading, int index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 160.0,
        child: Card(
          child: Wrap(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Image.network(
                    imageVal,
                    height: 120,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text(
                    heading,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(subHeading),
                  trailing: MaterialButton(
                    color: Colors.black,
                    onPressed: () {
                      print("Clicked on request for $index");
                    },
                    child: const Text(
                      "Request",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          elevation: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.blueAccent,
        title: Text(
          "$heading",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "No.of Books(4) :",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.8,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                myArticles(
                  "https://images.penguinrandomhouse.com/cover/9781465482211",
                  "Book Name: Step-by-Step Coding",
                  "Author: Craig Steele",
                  0,
                ),
                myArticles(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjiZrFdUJYS1BAfbw8wthRR2sD3Vkn4Db9Aw&usqp=CAU",
                  "Book Name: Coding Games scratch",
                  "Author:Jon",
                  1,
                ),
                myArticles(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLaVlrlHTaJcjgXgRC4_FgbZFJX-gbTpB0avlSpSJtJMl-a0gPhdBBwVD7ux8&usqp=CAc",
                  "Book Name: Mastering Hacking",
                  "Author: Jatin",
                  2,
                ),
                myArticles(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaeL_5jfXPe-FdoUzm5v-n7bZoDdXKu0EBXme9CXGD_TGv1tJIHWiLHA0DN5RMAsaQJjPM9Ms&usqp=CAc",
                  "Book Name: Coding",
                  "Author: Nikhil",
                  2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
