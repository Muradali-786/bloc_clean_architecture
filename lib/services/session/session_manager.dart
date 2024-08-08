import 'dart:convert';

import '../../model/user/user_model.dart';
import '../storage/local_storage.dart';


/// A singleton class for managing user session data.
class SessionManager {
  /// Instance of [LocalStorage] for accessing local storage.
  final LocalStorage sharedPreferenceClass = LocalStorage();

  /// Singleton instance of [SessionManager].
  static final SessionManager _session = SessionManager._internal();

  /// Flag indicating whether the user is logged in or not.
  static bool? isLogin;

  /// Model representing the user data.
  static UserModel user = UserModel();

  /// Private constructor for creating the singleton instance of [SessionManager].
  SessionManager._internal() {
    // Initialize default values
    isLogin = false;
  }

  //In Dart, a factory constructor is a special kind of constructor that can return an instance of the class,
  // potentially a cached or pre-existing instance, instead of always creating a new one.
  // It's defined using the factory keyword.
  // This is useful for implementing patterns like singletons or when you want to control instance creat
  //
  /// Factory constructor for accessing the singleton instance of [SessionManager].
  factory SessionManager() {
    return _session;
  }

  /// Saves user data into the local storage.
  ///
  /// Takes a [user] object as input and saves it into the local storage.
  Future<void> saveUserInPreference(dynamic user) async {
    sharedPreferenceClass.setValue('token', jsonEncode(user));
    // Storing value to check login
    sharedPreferenceClass.setValue('isLogin', 'true');
  }

  /// Retrieves user data from the local storage.
  ///
  /// Retrieves user data from the local storage and assigns it to the session controller
  /// to be used across the app.
  Future<void> getUserFromPreference() async {
    try {
      var userData = await sharedPreferenceClass.readValue('token');
      var isLogin = await sharedPreferenceClass.readValue('isLogin');

      if (userData.isNotEmpty) {
        SessionManager.user = UserModel.fromJson(jsonDecode(userData));
      }
      SessionManager.isLogin = isLogin == 'true' ? true : false;
    } catch (e) {
      print('eeror a riya khan');
      print(e.toString());

    }
  }
}
