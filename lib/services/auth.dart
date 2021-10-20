import 'package:firebase_auth/firebase_auth.dart';
import 'package:kou_basvuru_platform/models/my_user.dart';

class AuthService {

  // FirebaseAuth Instance
  final FirebaseAuth _auth = FirebaseAuth.instance;


  // create MyUser object based on User class (User class belongs to Firebase)
  // Return type must have '?' at the end, because of null-safe
  // Basically '?' thing says : probably it's gonna return as MyUser object
  MyUser? _myuserFromUser(User? user)
  {
    // If the instance of User class is NOT null, create an object from MyUser Class
    // passing the instance of User class' uid property, otherwise send null
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // region Sign-in with email & password
  Future signInWithEmailAndPassword(String email, String password) async
  {
    try {

      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User user = result.user as User;
      return _myuserFromUser(user);

    }
    catch (e)
    {
      print("Hata bulundu: ${e.toString()}");
      return null;
    }
  }
  // endregion


  // Register with E-mail & Password and other user data

  // region Sign out
  Future signOut() async {

    try {
      return await _auth.signOut();   // Firebase Authenticate built-in method
    } catch(e) {
      // In case of an error, print in the console and return null
      print(e.toString());
      return null;
    }

  }
  // endregion


  // region Streams


  Stream<User?> get user {
    // Notifies about changes to the user's sign-in state (such as sign-in or sign-out)
    return _auth.authStateChanges();
  }

  // endregion
}