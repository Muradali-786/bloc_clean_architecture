import 'package:bloc_clean_architecture/config/components/internet_exception.dart';
import 'package:bloc_clean_architecture/config/components/loading_widget.dart';
import 'package:bloc_clean_architecture/config/components/round_button.dart';
import 'package:bloc_clean_architecture/config/routes/route_name.dart';
import 'package:bloc_clean_architecture/services/session/session_manager.dart';
import 'package:bloc_clean_architecture/services/storage/local_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc clean architecture"),
        actions: [
          IconButton(
            onPressed: () async {
              LocalStorage localStorage = LocalStorage();
              await localStorage.clearValue('token').then((e) async {
                await localStorage.clearValue('isLogin').then((e) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouteName.login, (route) => false);
                });
              });
            },
            icon: const Icon(Icons.logout,color: Colors.blue,),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            LoadingWidget(),
            RoundButton(
                title: 'Login', onPress: () {}, buttonColor: Colors.blue),
            InternetException(
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
