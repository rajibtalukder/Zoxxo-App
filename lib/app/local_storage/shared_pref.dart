
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<SharedPreferences> getSharedPref() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> saveValue(String key, bool value) async {
    await getSharedPref().then((instance) {
      instance.setBool(key, value);
    });
  }

  Future<bool?> getValue(String key) async {
    bool? val ;
    await getSharedPref().then((instance) {
      val = instance.getBool(key);
    });
    return val;
  }
}