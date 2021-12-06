import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Launch extends Equatable{
  final String id;
  final String name;
  final DateTime dateTime;

  Launch({@required this.id, @required this.name,@required this.dateTime});

  @override
  List<Object> get props => [id, name];
}