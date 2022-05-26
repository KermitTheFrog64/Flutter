import 'package:flutter/material.dart';
import 'package:zabolotnaya_lab_3_2/bloc/joke_bloc.dart';
import 'package:zabolotnaya_lab_3_2/bloc/joke_event.dart';
import 'package:provider/provider.dart';
import 'second_page.dart';

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
                  context.read<JokeBloc>().add(const LoadEvent());
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage(),),
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