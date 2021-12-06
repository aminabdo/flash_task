import 'dart:convert';

import 'package:clean_architecture_tdd_course/features/next_lanch/data/model/response/next_launch_reposnse.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/domain/entitiy/Launch.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';

abstract class LaunchRemoteDataSource {
  Future<NextLaunchResponse> getNextLaunch();
  Future<List<Launch>> getPastLanches();
  Future<Launch> getSingleLaunch();
}

class NumberTriviaRemoteDataSourceImpl implements LaunchRemoteDataSource {
  final http.Client client;

  NumberTriviaRemoteDataSourceImpl({@required this.client});



  @override
  Future<NextLaunchResponse> getNextLaunch() {
    // TODO: implement getNextLaunch
    throw UnimplementedError();
  }

  @override
  Future<List<Launch>> getPastLanches() {
    // TODO: implement getPastLanches
    throw UnimplementedError();
  }

  @override
  Future<Launch> getSingleLaunch() {
    // TODO: implement getSingleLaunch
    throw UnimplementedError();
  }
}
