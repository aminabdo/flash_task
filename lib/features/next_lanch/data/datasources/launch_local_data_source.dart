import 'dart:convert';

import 'package:clean_architecture_tdd_course/core/error/exceptions.dart';
import 'package:clean_architecture_tdd_course/features/next_lanch/domain/entitiy/Launch.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class LaunchLocalDataSource {
  cash(List<Launch> launch);
  Future<List<Launch>> getList();
  Future<Launch> getSingle();
}

const CACHED_NUMBER_TRIVIA = 'CACHED_NUMBER_TRIVIA';

class LaunchLocalDataSourceImpl implements LaunchLocalDataSource {
  final SharedPreferences sharedPreferences;

  LaunchLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  cash(List<Launch> launch) {
    // TODO: implement cash
    throw UnimplementedError();
  }

  @override
  Future<List<Launch>> getList() {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  Future<Launch> getSingle() {
    // TODO: implement getSingle
    throw UnimplementedError();
  }


}
