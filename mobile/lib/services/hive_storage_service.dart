import 'package:hive/hive.dart';

class HiveStorageService {
  static final _storage = Hive.box("jwt");
  final String _jwtKey = "Very hard string";

  void saveJwt(String token) {
    _storage.put("key", "${_jwtKey}");
    _storage.put("value", "${token}");
  }

  void deleteJwt() {
    _storage.delete("value");
  }

  String getJwt() {
    return _storage.get("value");
  }
}
