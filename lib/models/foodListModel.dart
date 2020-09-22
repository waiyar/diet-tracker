import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'Food.dart';

class FoodListModel extends ChangeNotifier {
  final List<Food> _foodList = [];

  UnmodifiableListView<Food> get foods => UnmodifiableListView(_foodList);

  void add(Food food) {
    _foodList.add(food);
    notifyListeners();
  }

  void removeFood(Food food) {
    _foodList.remove(food);
    notifyListeners();
  }
}
