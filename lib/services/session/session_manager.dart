import '../../model/user/user_model.dart';
import '../storage/local_storage.dart';

class SessionManager {
  static final SessionManager _session = SessionManager._internal();

  final LocalStorage sharedPreferenceClass = LocalStorage();
  static bool? isLogin;

  /// Model representing the user data.
  static UserModel user = const UserModel();

  /// Private constructor for creating the singleton instance of

  SessionManager._internal() {
    isLogin = false;
  }

//In Dart, a factory constructor is a special kind of constructor that can return an instance of the class,
  // potentially a cached or pre-existing instance, instead of always creating a new one.
  // It's defined using the factory keyword.
  // This is useful for implementing patterns like singletons or when you want to control instance creat
  //
  /// Factory constructor for accessing the singleton instance of [SessionController]
  factory SessionManager() {
    return _session;
  }
}
