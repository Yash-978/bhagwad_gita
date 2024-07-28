import 'dart:async';

import 'package:flutter/material.dart';

import '../HomeScreen/HomePage.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    Timer(Duration(seconds: 3), () {
      // Navigator.of(context).pushNamed('/');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });
    return Scaffold(
      body: Container(
        height: h * 1,
        width: w * 1,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/sbg_splash.jpg'),
                fit: BoxFit.values.first),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          'Bhagwad gita',
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
