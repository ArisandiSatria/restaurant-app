import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/preferences/preferences_helper.dart';

class SharedPrefProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  SharedPrefProvider({required this.preferencesHelper}) {
    _getDailyActive();
  }

  bool _isDailyActive = false;
  bool get isDailyActive => _isDailyActive;

  Future<void> _getDailyActive() async {
    _isDailyActive = await preferencesHelper.isDailyRestaurantActive;
    notifyListeners();
  }

  Future<void> enableDailyActive(bool value) async {
    preferencesHelper.setDailyRestaurant(value);
    await _getDailyActive();
  }
}
