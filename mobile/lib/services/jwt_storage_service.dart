import "package:hive/hive.dart";

class JWTStorageService {
  static final box = Hive.box("auth");

  void saveJwt(String token) {
    box.put("token", token);
  }

  String readJwt() {
    return box.get("token");
  }
}
