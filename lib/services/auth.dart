import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  // FirebaseAuth Instance
  final FirebaseAuth _auth = FirebaseAuth.instance;


  // Sign-in with email & password


  // Register with E-mail & Password and other user data



  // Sign out
  Future signOut() async {

    try {
      return await _auth.signOut();   // Firebase Authenticate built-in method
    } catch(e) {
      // In case of occuring an error, print in the console and return null
      print(e.toString());
      return null;
    }

  }


}