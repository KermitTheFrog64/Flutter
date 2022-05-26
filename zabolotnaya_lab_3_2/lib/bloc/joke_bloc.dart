import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../models/joke_model.dart';
import 'joke_event.dart';
import 'joke_state.dart';
import 'dart:convert';
import 'dart:async';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  JokeBloc() : super(InitialState()) {
    on<LoadEvent>(_loadData);
  }

  Future<void> _loadData(
      LoadEvent event,
      Emitter<JokeState> emit,
      ) async {
    try {
      emit(LoadingState());
      final url = Uri.parse('https://geek-jokes.sameerkumar.website/api?format=json');
      await Future.delayed(const Duration(seconds: 1));
      final response = await http.get(url);
      final _joke = Joke.fromJson(jsonDecode(response.body));
      emit(LoadedState(jokeState: _joke));
    } catch (e) {
      emit(FailedState(errorMessage: e.toString()));
    }
  }
}

