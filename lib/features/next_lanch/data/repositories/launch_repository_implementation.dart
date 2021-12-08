import 'package:clean_architecture_tdd_course/core/error/exceptions.dart';
import 'package:clean_architecture_tdd_course/core/error/failures.dart';
import 'package:clean_architecture_tdd_course/core/network/network_info.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/data/datasources/launch_local_data_source.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/data/datasources/launch_remote_data_source.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/domain/entitiy/Launch.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/domain/repositories/launch_repository.dart';
import 'package:dartz/dartz.dart';

typedef Future<List<Launch>> _ConcreteOrRandomChooser();

class LaunchRepositoryImplementation extends LaunchRepository{

  final LaunchRemoteDataSource remoteDataSource;
  final LaunchLocalDataSource localDataSource;
  final NetworkInfo networkInfo;


  LaunchRepositoryImplementation(
      this.remoteDataSource, this.localDataSource, this.networkInfo);

  @override
  Future<Either<Failure, Launch>> getNextLaunch() async {
    return Right(await remoteDataSource.getNextLaunch());
  }

  @override
  Future<Either<Failure, List<Launch>>> getPastLaunchs() async {
    return await _getLaunches(() => remoteDataSource.getPastLanches());
  }

  @override
  Future<Either<Failure, Launch>> getSingleLaunch(int id) async {
    return Right(await remoteDataSource.getSingleLaunch(id));
  }

  Future<Either<Failure, List<Launch>>> _getLaunches(_ConcreteOrRandomChooser getConcreteOrRandom,) async
  {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await getConcreteOrRandom();
        localDataSource.cash(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = await localDataSource.getList();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  
}