import 'package:equatable/equatable.dart';
import 'package:zabolotnaya_lab_3_2/models/joke_model.dart';

import 'joke_bloc.dart';

abstract class JokeState extends Equatable {
  const JokeState();

  @override
  List<Object> get props => [];
}

class InitialState extends JokeState {}

class LoadingState extends JokeState {}

class LoadedState extends JokeState {
  final Joke jokeState;

  const LoadedState({
    required this.jokeState,
  });
}

class FailedState extends JokeState {
  final String errorMessage;

  const FailedState({
    required this.errorMessage,
  });
}