import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_tdd_course/core/error/failures.dart';
import 'package:clean_architecture_tdd_course/core/usecases/usecase.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/domain/entitiy/Launch.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/domain/usecases/filter_past_launches.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/domain/usecases/next_launch.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/domain/usecases/past_launches.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/domain/usecases/single_launch.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import './bloc.dart';
import '../../../../core/util/input_converter.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  final GetNextLaunch getNextLaunch;
  final GetSingleLaunchs getSingleLaunchs;
  final GetPastLaunchs getPastLaunchs;
  final FilterPastLaunchs filterPastLaunchs;
  final InputConverter inputConverter;

  LaunchBloc({
    @required GetNextLaunch nextLaunch,
    @required GetSingleLaunchs singleLaunchs,
    @required GetPastLaunchs pastLaunchs,
    @required FilterPastLaunchs filterLaunches,
    @required this.inputConverter,
  })  : assert(nextLaunch != null),
        assert(singleLaunchs != null),
        assert(pastLaunchs != null),
        assert(filterLaunches != null),
        assert(inputConverter != null),

        getNextLaunch = nextLaunch,
        getSingleLaunchs = singleLaunchs,
        getPastLaunchs = pastLaunchs,
        filterPastLaunchs = filterLaunches;

  @override
  LaunchState get initialState => Empty();

  @override
  Stream<LaunchState> mapEventToState(
    LaunchEvent event,
  ) async* {
    if (event is GetTriviaForConcreteNumber) {
      final inputEither =
          inputConverter.stringToUnsignedInteger(event.numberString);

      yield* inputEither.fold(
        (failure) async* {
          yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
        },
        (integer) async* {
          yield Loading();
          final failureOrTrivia =
              await getConcreteLaunch(Params(number: integer));
          yield* _eitherLoadedOrErrorState(failureOrTrivia);
        },
      );
    } else if (event is Get) {
      yield Loading();
      final failureOrTrivia = await get(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrTrivia);
    }
  }

  Stream<LaunchState> _eitherLoadedOrErrorState(
    Either<Failure, Launch> failureOrTrivia,
  ) async* {
    yield failureOrTrivia.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (trivia) => Loaded(trivia: trivia),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
