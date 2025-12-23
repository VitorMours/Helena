import "package:shared_preferences/shared_preferences.dart";

class SharedRepository {

  Future<void> setInt(String dataName, int data) async {
    final sharedInstance = await SharedPreferences.getInstance();
    await sharedInstance.setInt(dataName, data);
  }

  Future<void> setString(String dataName, String data) async {
    final sharedInstance = await SharedPreferences.getInstance();
    await sharedInstance.setString(dataName, data);
  }

  Future<void> setBool(String dataName, bool data) async {
    final sharedInstance = await SharedPreferences.getInstance();
    await sharedInstance.setBool(dataName, data);
  }

  Future<void> setDouble(String dataName, double data) async {
    final sharedInstance = await SharedPreferences.getInstance();
    await sharedInstance.setDouble(dataName, data);
  }

  Future<int?> getInt(String dataName) async {
    final sharedInstance = await SharedPreferences.getInstance();
    return sharedInstance.getInt(dataName);
  }

  Future<bool?> getBool(String dataName) async {
    final sharedInstance = await SharedPreferences.getInstance();
    return sharedInstance.getBool(dataName);
  }

  Future<String?> getString(String dataName) async {
    final sharedInstance = await SharedPreferences.getInstance();
    return sharedInstance.getString(dataName);
  }

  Future<double?> getDouble(String dataName) async {
    final sharedInstance = await SharedPreferences.getInstance();
    return sharedInstance.getDouble(dataName);
  }
}