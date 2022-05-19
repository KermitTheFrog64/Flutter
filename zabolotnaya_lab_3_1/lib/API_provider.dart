import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Joke {
  final String joke;

  Joke({
    required this.joke
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      joke: json['joke'],
    );
  }
}

class APIProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Joke? _data;
  Joke? get data => _data;

  Future<void> fetchJoke() async {
    _isLoading = true;
    notifyListeners();
    final response = await http.get(Uri.parse('https://geek-jokes.sameerkumar.website/api?format=json'));
    _data = Joke.fromJson(jsonDecode(response.body));
    _isLoading = false;
    notifyListeners();
  }
}