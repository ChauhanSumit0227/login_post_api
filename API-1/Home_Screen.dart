import 'package:flutter/material.dart';
import 'package:login_post_api/API-1/Login_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen',),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
          }, icon: Icon(Icons.logout))
         ],
      ),
      body: Center(
        child: Text(
          "API Call Succsessful.",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}







