import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kou_basvuru_platform/models/my_user.dart';
import 'package:kou_basvuru_platform/services/auth.dart';


class FirebaseAuthService implements AuthService{
  final FirebaseAuth _firebaseauth = FirebaseAuth.instance;
  @override
  Future<MyUser?> currentUser() async {
try{
User user = await _firebaseauth.currentUser!;
return _userFrontFirebase(user,"");
}
catch(e){
print("Hata cURREN uSER AUTH"+e.toString());
}

  }
  MyUser? _userFrontFirebase(User? user,String pozisyon)
  {//firebasedeki user ıd veriliyor
    try{
      if(user==null) {
        return null;
      }
      return MyUser(userID: user.uid,mail: user.email , pozisyon:pozisyon);
    }
    catch(e)
    {
      print("HATA CURRENT USER"+e.toString());
      return null;
    }


  }


  @override
  Future<MyUser?> signInWithEmailAndPassword(String email, String password,String pozisyon) async{
    try{

      UserCredential sonuc = await _firebaseauth.signInWithEmailAndPassword(email: email, password: password);
      return _userFrontFirebase(sonuc.user,pozisyon);
    }
    catch(e){
      return null;
    }
  }

  @override
  Future<bool?> signOut()  async {
    try{
      await _firebaseauth.signOut();
      return null;
    }
    catch(e)
    {
      print("HATA ÇIKIŞ"+e.toString());
      return null;
    }

  }

  @override
  Future<MyUser?> createUserWithEmailAndPassword(String email, String password,String pozisyon) async{
   try{

     UserCredential sonuc = await _firebaseauth.createUserWithEmailAndPassword(email:email, password: password);
     return _userFrontFirebase(sonuc.user,pozisyon);
   }
   catch(e){
        return null;
   }
  }

}
