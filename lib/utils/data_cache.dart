import 'package:shared_preferences/shared_preferences.dart';

class DataCache {
  static late SharedPreferences data;
  static String email = "email";
  static String token = "token";
  static String id = "id";
  static String USER_FILTER = "USER_FILTER";
  static String ADVANCE_FILTER = "ADVANCE_FILTER";

  static Future init() async {
    // SharedPreferences.setMockInitialValues({});
    data = await SharedPreferences.getInstance();
    print("sqf init");
    print(data);
  }
}
