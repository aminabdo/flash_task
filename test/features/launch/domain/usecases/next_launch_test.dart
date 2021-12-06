import 'package:clean_architecture_tdd_course/core/usecases/usecase.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/data/model/response/next_launch_reposnse.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/domain/entitiy/Launch.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/domain/repositories/launch_repository.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/domain/usecases/next_launch.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockLaunchRepository extends Mock implements LaunchRepository{}

void main(){
  MockLaunchRepository mockLaunchRepository;
  GetNextLaunch usecase;

  setUp((){
    mockLaunchRepository = MockLaunchRepository();
    usecase = GetNextLaunch(mockLaunchRepository);
  });
  
  final id = 1 ;
  final tLaunch = Launch(id: "1", name: "name");
  test(
      'should get next launch from repository',
      () async {
        // arrange
        when(mockLaunchRepository.getNextLaunch())
            .thenAnswer((_) async => Right(tLaunch));
        // act
        final result = await usecase(NoParams());
        // assert
        expect(result, Right(tLaunch));
        verify(mockLaunchRepository.getNextLaunch());
        verifyNoMoreInteractions(mockLaunchRepository);
      }
  );

}