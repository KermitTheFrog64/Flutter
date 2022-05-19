import 'package:flutter/material.dart';
import 'package:zabolotnaya_lab_3_1/API_provider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<APIProvider>();

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: (Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (provider.isLoading)
                const CircularProgressIndicator()
              else if (provider.data != null)
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1600),
                      color: const Color.fromARGB(148, 202, 211, 236),
                    ),
                    width: 500,
                    height: 500,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  <Widget>[
                          Text(
                              "Today's joke: \n" + provider.data!.joke.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.black,fontSize: 36)
                          ),
                        ]
                    )
                )
              else
                const Text("error")
            ],
          )),
        ),
      ),
    );
  }
}