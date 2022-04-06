import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
            appBar: AppBar(
              title: Text('MyApp'),
              centerTitle: true,
            ),
          body: Center(
            child: Text('My first Flatter app', style: TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontFamily: 'Times New Roman'
            ),),
          ),
          floatingActionButton: FloatingActionButton(
            child: Text('Click'),
            backgroundColor: Colors.red,
            onPressed: () {
              print('Clicked');
            },
          ),
        ),
    );
  }

}