import 'package:uas_traveleasy/page/login.dart';
import 'package:uas_traveleasy/page/regis.dart';
import 'package:flutter/material.dart';
import 'package:uas_traveleasy/page/homepg.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 203, 242, 254),

      body: SafeArea(child: 
      Center(
        child: Padding(
          padding: const EdgeInsets.all(27.0),
          child: Column(
            children: [
              const Spacer(),
              Image.asset('assets/start.png',
              width: 300,
              ),
              const SizedBox(height:40),
              Text("Mari Jelajahi Duniamu \n lzzgooo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              ),
              const SizedBox(height:20),
              const Text("Semua tujuanmu ada di sini,\n enjoyin aja ngab",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black45,
                fontSize:16,
              ),
              ),
              const Spacer(),
              Padding(
  padding: const EdgeInsets.only(bottom: 30),
  child: Column(
    children: <Widget>[
      SizedBox(
        width: double.maxFinite,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(context, 
              MaterialPageRoute(builder: (context) => const Login()),
            );
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 8,
            )
          ),
          child: const Text("Login"),
        ),
      ),
      SizedBox(height: 10), // Add some space between the buttons
      SizedBox(
        width: double.maxFinite,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(context, 
              MaterialPageRoute(builder: (context) => const Regis()),
            );
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 8,
            )
          ),
          child: const Text("Register"),
        ),
      ),
    ],
  ),
)
              ],
              ),
        ),
      )),
    );
  }
}