import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/preference/preference.dart';

@LazySingleton(as: PreferenceContracts)
class PreferenceHelper implements PreferenceContracts {
  @override
  void setBool({required String key, required bool value}) {
    _setData(key, value.toString());
  }

  @override
  void setDouble({required String key, required double value}) {
    _setData(key, value.toString());
  }

  @override
  void setInt({required String key, required int value}) {
    _setData(key, value.toString());
  }

  @override
  void setString({required String key, required String value}) {
    _setData(key, value);
  }

  Future<String> _getData(String key) async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: key) ?? '';
  }

  Future<void> _setData(String key, String value) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: key, value: value);
  }

  @override
  Future<bool> getBool({required String key}) async {
    final value = await _getData(key);
    return value.toLowerCase() == 'true';
  }

  @override
  Future<double> getDouble({required String key}) async {
    final value = await _getData(key);
    return double.parse(value);
  }

  @override
  Future<int> getInt({required String key}) async {
    final value = await _getData(key);
    return int.parse(value);
  }

  @override
  Future<String> getString({required String key}) {
    return _getData(key);
  }

  Future<bool> clearAll() async {
    const storage = FlutterSecureStorage();
    storage.deleteAll();
    return true;
  }
}
