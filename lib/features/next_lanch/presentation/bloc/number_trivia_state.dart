import 'package:clean_architecture_tdd_course/features/next_lanch/domain/entitiy/Launch.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LaunchState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends LaunchState {}

class Loading extends LaunchState {}

class Loaded extends LaunchState {
  final Launch trivia;

  Loaded({@required this.trivia});

  @override
  List<Object> get props => [trivia];
}

class Error extends LaunchState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
