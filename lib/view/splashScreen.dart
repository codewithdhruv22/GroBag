import 'package:flutter/material.dart';
import 'package:grocery_app/view/auth/loginScreen.dart';
import 'package:grocery_app/view/global.dart';
import 'package:grocery_app/view/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkLoginStatus() {
    Future.delayed(Duration(seconds: 2), () {
      print(fAuth.currentUser);
      if (fAuth.currentUser == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("GroBag")),
    );
  }
}
