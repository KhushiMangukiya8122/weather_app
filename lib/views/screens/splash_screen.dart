import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 30), () {
      Navigator.of(context).pushReplacementNamed("home_page");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://media.tenor.com/uY3NcfjqZ78AAAAC/chettab-stars.gif"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 200,
            width: 300,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://o.remove.bg/downloads/0066de89-9996-4408-9086-ac0dbbdd79b9/image-removebg-preview.png"),
              ),
            ),
          ),
        ],
      )
    );
  }
}
