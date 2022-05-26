import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zabolotnaya_lab_3_2/bloc/joke_bloc.dart';
import 'package:zabolotnaya_lab_3_2/bloc/joke_state.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<JokeBloc, JokeState>(
            builder: (context, state) {
              if (state is LoadingState) return const CircularProgressIndicator();
              if (state is LoadedState) {
                return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1800),
                      color: const Color.fromARGB(148, 202, 211, 236),
                    ),
                    width: 500,
                    height: 500,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  <Widget>[
                          Text(
                              "Today's joke: \n" + state.jokeState.joke.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.black,fontSize: 36)
                          ),
                        ]
                    )
                );
              }
              if (state is FailedState) return Text(state.errorMessage);
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}