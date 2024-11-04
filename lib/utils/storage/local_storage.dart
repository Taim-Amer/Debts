import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  static final TLocalStorage _instance = TLocalStorage._internal();

  factory TLocalStorage(){
    return _instance;
  }

  TLocalStorage._internal();

  final _storage = GetStorage();

  Future<void> saveData<T> (String key, T value) async {
    await _storage.write(key, value);
  }

  T? readData<T> (String key) {
    return _storage.read<T>(key);
  }

  Future<void> removeData<T> (String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAll() async {
    await _storage.erase();
  }
}

//
// import 'package:shared_preferences/shared_preferences.dart';
//
// class TCacheHelper {
//   static final TCacheHelper _instance = TCacheHelper._internal();
//   late SharedPreferences _sharedPreferences;
//
//   TCacheHelper._internal();
//
//   factory TCacheHelper() {
//     return _instance;
//   }
//
//   Future<void> init() async {
//     _sharedPreferences = await SharedPreferences.getInstance();
//   }
//
//   dynamic getData({required String key}) {
//     return _sharedPreferences.get(key);
//   }
//
//   Future<bool> saveData({required String key, required dynamic value}) async {
//     if (value is String) return await _sharedPreferences.setString(key, value);
//     if (value is int) return await _sharedPreferences.setInt(key, value);
//     if (value is bool) return await _sharedPreferences.setBool(key, value);
//     if (value is double) return await _sharedPreferences.setDouble(key, value);
//     return false;
//   }
//
//   Future<bool> removeData({required String key}) async {
//     return await _sharedPreferences.remove(key);
//   }
// }

