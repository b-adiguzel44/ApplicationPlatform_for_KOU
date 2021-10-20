// We'll be creating MyUser objects from tha data we're getting from
// Firebase Authenticate and Firebase Firestore

class MyUser {

  // Generates automatically in Firebase
  late final String uid;
  // This is always true because we're registering students all the time
  bool isStudent = true;

  // Named Constructor
  MyUser({required this.uid});

  // Toggle User (Student / Admin) => just to be safe
  void toggleUser()
  {
    isStudent = !isStudent;
  }

}