import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'API_provider.dart';
import 'main_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
        child: SizedBox(
          width: 600,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 18),
                child: Text(
                    'Wanna laugh?..',
                    style: TextStyle(fontSize: 24,color: Colors.black)
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  context.read<APIProvider>().fetchJoke();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
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
