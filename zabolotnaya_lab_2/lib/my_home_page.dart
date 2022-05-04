import 'package:flutter/material.dart';
import 'package:zabolotnaya_lab_2/models/joke_model.dart';
import 'main_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _loading = false;
  late Future<Joke> characters;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text(
            "Geek's jokes",
            style: TextStyle(
                fontSize: 28,
                color: Colors.white
            )
        ),
      ),
      body: Center (
        child: Container(
          width: 600,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 18),
                child: Text(
                    'Wanna laugh?..',
                    style: TextStyle(fontSize: 24, color: Colors.black)
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainPage(title: 'Joke',),
                    ),
                  );
                },
                child: const Text("Yep"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}