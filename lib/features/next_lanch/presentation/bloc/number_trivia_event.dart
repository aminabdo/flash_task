import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LaunchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetTriviaForConcreteNumber extends LaunchEvent {
  final String numberString;

  GetTriviaForConcreteNumber(this.numberString);

  @override
  List<Object> get props => [numberString];
}

class GetTriviaForRandomNumber extends LaunchEvent {}
