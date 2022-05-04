import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  const JokeCard({
    required this.joke,
    Key? key,
  }) : super(key: key);

  final String joke;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1600),
          color: Color.fromARGB(148, 202, 211, 236),
        ),
        // margin: const EdgeInsets.all(10),
        width: 500,
        height: 500,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              Text(
                "Today's joke: \n" + joke,
                style: TextStyle(color: Colors.black,fontSize: 36),
                textAlign: TextAlign.center,
              ),
            ]
        )
    );

  }
}