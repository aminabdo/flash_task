import 'package:clean_architecture_tdd_course/core/error/failures.dart';
import 'package:clean_architecture_tdd_course/core/usecases/usecase.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/domain/entitiy/Launch.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/domain/repositories/launch_repository.dart';
import 'package:dartz/dartz.dart';



class GetNextLaunch implements UseCase<Launch, NoParams>{
  final LaunchRepository launchRepository;

  GetNextLaunch(this.launchRepository);

  @override
  Future<Either<Failure, Launch>> call(NoParams params) async {
    return await launchRepository.getNextLaunch();
  }
}

