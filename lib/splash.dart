import 'package:uas_traveleasy/page/homepg.dart';
import 'package:flutter/material.dart';
import 'package:uas_traveleasy/page/welcome_page.dart';
import 'package:uas_traveleasy/page/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2300), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset(
            'assets/splash.png',
            width: 200, 
          ),
        ),
      ),
    );
  }
}
