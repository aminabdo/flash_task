import 'package:clean_architecture_tdd_course/core/error/failures.dart';
import 'package:clean_architecture_tdd_course/core/usecases/usecase.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/domain/entitiy/Launch.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/domain/repositories/launch_repository.dart';
import 'package:dartz/dartz.dart';


class GetPastLaunchs implements UseCase<List<Launch>, NoParams>{
  final LaunchRepository launchRepository;

  GetPastLaunchs(this.launchRepository);

  @override
  Future<Either<Failure, List<Launch>>> call(NoParams params) async {
    return await launchRepository.getPastLaunchs();
  }


}

