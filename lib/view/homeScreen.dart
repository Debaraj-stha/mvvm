import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routesName.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        child: const Text("home click"),
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.login);
        },
      ),
    );
  }
}
