//APP STARTING
//--LOGGED IN - HOME
//--LOGGED OUT - LOGIN SCREEN

// OTP VERIFY
//---ACCOUNT EXIST -- HOME
//---ACCOUNT NOT EXIST -- CREATE ACCOUNT

import 'package:flutter/material.dart';
import 'package:grocery_app/view/global.dart';
import 'package:grocery_app/view/splashScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            
            await fAuth.signOut().then((value) {

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SplashScreen()));
            });
          },
          child: Text("SIGN OUT"),
        ),
      ),
    );
  }
}
