import 'package:flutter/widgets.dart';
import 'package:myapp/dish/dish.dart';

class BagProvider extends ChangeNotifier {
  List<Dish> dishesOnBag = [];
  
  final Map<Dish, int> _items = {};

  void addDish(Dish dish) {
    if (_items.containsKey(dish)) {
      _items[dish] = (_items[dish] ?? 0) + 1;
    } else {
      _items[dish] = 1;
    }
    notifyListeners();
  }

  void removeDish(Dish dish) {
    if (_items.containsKey(dish)) {
      if ((_items[dish] ?? 0) > 1) {
        _items[dish] = (_items[dish] ?? 0) - 1;
      } else {
        _items.remove(dish);
      }
    }
    notifyListeners();
  }

  List<Dish> getBagItems() {
    return _items.keys.toList();
  }

  int getBagCount() {
    return _items.values.fold(0, (sum, count) => sum + count);
  }

  void clearBag() {
    _items.clear();
    notifyListeners();
  }

  Map<Dish, int> getMapByAccount() {
 return _items;
  }
}


