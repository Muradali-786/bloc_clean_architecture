import 'package:bloc_clean_architecture/config/routes/route_name.dart';
import 'package:bloc_clean_architecture/config/routes/routes.dart';
import 'package:bloc_clean_architecture/respository/auth/login_http_api.dart';
import 'package:bloc_clean_architecture/respository/movie/movie_http_api.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
final getItt = getIt<LoginHttpRepository>();
final getItt1 = getIt<MovieHttpApi>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      initialRoute: RouteName.splash,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

void serviceLocator() {
  // Registering loginApiRepository as a lazy singleton for AuthApiRepository
  getIt.registerLazySingleton<LoginHttpRepository>(() => LoginHttpRepository());
  getIt.registerLazySingleton<MovieHttpApi>(() => MovieHttpApi());
}
