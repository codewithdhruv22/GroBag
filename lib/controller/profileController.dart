import 'package:firebase_database/firebase_database.dart';

class ProfileController {
  static Future createProfile(String phoneNum, String name) async {
    //Db Ref
    //- users
    //- 11223 - Name , PhoneNo, Created
    //- 11233 - Name , PhoneNo, Created
    //- 12323 - Name , PhoneNo, Created
    //...
    await FirebaseDatabase.instance
        .ref()
        .child("users")
        .child(phoneNum)
        .set({"Name": name, "Phone": phoneNum, "CreatedAt": DateTime.now().toString()});
  }
}
