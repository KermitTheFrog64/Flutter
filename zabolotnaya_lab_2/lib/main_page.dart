import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zabolotnaya_lab_2/widgets/joke_card.dart';
import 'package:zabolotnaya_lab_2/models/joke_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isLoading = false;
  late Future<Joke> jokes;

  Future<Joke> _fetchCharacter() async {
    setState(() {
      _isLoading = true;
    });
    final response = await http.get(Uri.parse('https://geek-jokes.sameerkumar.website/api?format=json'));
    if (response.statusCode == 200) {
      return Joke.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load joke');
    }
  }

  @override
  void initState() {
    super.initState();
    jokes = _fetchCharacter();
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
      body: Center(
        child: FutureBuilder<Joke>(
          future: jokes,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return JokeCard(
                  joke: snapshot.data!.joke,
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}