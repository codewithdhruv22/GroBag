import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../global.dart';

class OtpVerify extends StatefulWidget {
  const OtpVerify({super.key});

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  String vefID = "";
  TextEditingController otpController = TextEditingController();

  _verifyOtp(String pin) async {
    AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationIDg, smsCode: pin);

    try {
      final authCred = await fAuth.signInWithCredential(phoneAuthCredential);
      if (authCred.user != null) {
        print("BADHAI HO AAP AA GAYE");
        //LOGIN SCUESS
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1593629718768-e8860d848a15?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=503&q=80"),
                    fit: BoxFit.cover)),
          ),
          Column(
            children: [
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Color.fromARGB(153, 90, 89, 89),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: otpController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Enter Your 6-Digit Number",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
              ElevatedButton(
                  onPressed: () => _verifyOtp(otpController.text),
                  child: Text("Verify OTP")),
              SizedBox(height: 20),
            ],
          )
        ],
      ),
    );
  }
}
