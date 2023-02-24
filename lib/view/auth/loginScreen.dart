import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/view/global.dart';
import 'package:grocery_app/view/auth/otpVerify.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String vefID = "";
  TextEditingController phoneController = TextEditingController();

  _loginAccount() {
    FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${phoneController.text}",
        verificationCompleted: (phoneAuthCredentianl) async {},
        verificationFailed: (verificationFailed) {
          print(verificationFailed);
        },
        codeSent: (verificationID, resendingToken) {
          print(verificationID);
          verificationIDg = verificationID;
          this.vefID = verificationID;
          setState(() {});
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => OtpVerify()));
        },
        codeAutoRetrievalTimeout: (verificaitonID) async {});
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
                  controller: phoneController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Enter Your 10-Digit Number",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
              ElevatedButton(
                  onPressed: () => _loginAccount(), child: Text("Send OTP")),
              SizedBox(height: 20),
            ],
          )
        ],
      ),
    );
  }
}
