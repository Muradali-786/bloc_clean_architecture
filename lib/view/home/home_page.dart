import 'package:bloc_clean_architecture/config/components/internet_exception.dart';
import 'package:bloc_clean_architecture/config/components/loading_widget.dart';
import 'package:bloc_clean_architecture/config/components/round_button.dart';
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
      appBar: AppBar(title: const Text("Bloc clean architecture"),),
      body: SafeArea(
        child: Column(
          children: [
            LoadingWidget(),
            RoundButton(title: 'Login', onPress: (){}, buttonColor: Colors.blue),

            InternetException(onTap: (){},),
          ],
        ),
      ),
    );
  }
}
