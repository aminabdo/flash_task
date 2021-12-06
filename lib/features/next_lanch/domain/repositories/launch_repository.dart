import 'package:clean_architecture_tdd_course/core/error/failures.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/domain/entitiy/Launch.dart';
import 'package:dartz/dartz.dart';

abstract class LaunchRepository{
  Future<Either<Failure, Launch>> getNextLaunch();
  Future<Either<Failure, List<Launch>>> getPastLaunchs();
  Future<Either<Failure, Launch>> getSingleLaunch(int id);
}