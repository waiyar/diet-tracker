import 'package:flutter/material.dart';

@immutable
class Food {
  final int _id;
  final String _name;
  final List<int> _tags;

  Food(this._id, this._name, this._tags);

  int get id => _id;
  String get name => _name;
  List<int> get tags => _tags;
}
