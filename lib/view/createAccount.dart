import 'package:flutter/material.dart';
import 'package:grocery_app/controller/profileController.dart';
import 'package:grocery_app/view/global.dart';
import 'package:grocery_app/view/home.dart';

class AccountCreateScreen extends StatelessWidget {
  const AccountCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Welcome To GroBag App",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Create your account on GroBag",
          style: TextStyle(fontSize: 16),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Color.fromARGB(153, 90, 89, 89),
              borderRadius: BorderRadius.circular(15)),
          child: TextField(
            controller: nameController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 12, right: 15),
                hintText: "Enter Your Name",
                hintStyle: TextStyle(color: Colors.white)),
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              await ProfileController.createProfile(
                      currentUserID, nameController.text)
                  .then((_) {
                print("ACCOUNT CREATED SUCCESSFULLY");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              });
            },
            child: Text("Create"))
      ]),
    );
  }
}
