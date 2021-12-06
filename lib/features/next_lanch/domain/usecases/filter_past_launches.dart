import 'package:clean_architecture_tdd_course/core/error/failures.dart';
import 'package:clean_architecture_tdd_course/core/usecases/usecase.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/domain/entitiy/Launch.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/domain/repositories/launch_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


class GetPastLaunchs implements UseCase<List<Launch>, Params>{
  final LaunchRepository launchRepository;

  GetPastLaunchs(this.launchRepository);

  @override
  Future<Either<Failure, List<Launch>>> call(Params params) async {
    params.pastLaunches.where((element) => element.dateTime.isAfter(params.startDate) && element.dateTime.isBefore(params.endDate));
  }
  
}

class Params extends Equatable {
  DateTime startDate;
  DateTime endDate;
  List<Launch> pastLaunches;


  Params({this.startDate, this.endDate, this.pastLaunches});

  @override
  List<Object> get props => [pastLaunches];
}
