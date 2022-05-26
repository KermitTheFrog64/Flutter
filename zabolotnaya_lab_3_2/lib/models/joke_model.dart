import 'package:http/http.dart' as http;

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