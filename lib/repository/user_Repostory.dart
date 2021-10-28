import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/models/my_user.dart';
import 'package:kou_basvuru_platform/services/auth.dart';
import 'package:kou_basvuru_platform/services/fake_auth.dart';
import 'package:kou_basvuru_platform/services/firebase_auth_servise.dart';
import 'package:kou_basvuru_platform/services/firestore_db_service.dart';
enum AppMode{DEBUG,RELEASE}
class UserRepostory implements AuthService{
  FirebaseAuthService _firebaseAuthService= FirebaseAuthService();
  FakeAuth _fakeAuth= FakeAuth();
  FirestoreDBServise _firestoreDBServise= FirestoreDBServise();//veritabanı
  AppMode appMode= AppMode.RELEASE;
  @override
  Future<MyUser?> currentUser() async{
    if(appMode==AppMode.DEBUG)
      {
          return await _fakeAuth.currentUser();
      }
    else
      {
        MyUser? _user= await _firebaseAuthService.currentUser();
        return await _firestoreDBServise.readUser(_user!.userID);
      }
  }

  @override
  Future<MyUser?> signInWithEmailAndPassword(String email, String password,String pozisyon) async{
    if(appMode==AppMode.DEBUG)
    {
      return await _fakeAuth.signInWithEmailAndPassword(email, password,pozisyon);
    }
    else
    {
      MyUser _user;
      _user= (await _firebaseAuthService.signInWithEmailAndPassword(email , password,pozisyon))!;
      return await _firestoreDBServise.readUser(_user.userID);
    }
  }

  @override
  Future<bool?> signOut() async{
    if(appMode==AppMode.DEBUG)
    {
      return await _fakeAuth.signOut();
    }
    else
    {
      return await _firebaseAuthService.signOut();
    }
  }

  @override
  Future<MyUser?> createUserWithEmailAndPassword(String email, String password,String pozisyon) async{
    if(appMode==AppMode.DEBUG)
    {
      return await _fakeAuth.createUserWithEmailAndPassword(email, password,pozisyon);
    }
    else
    {
      MyUser _user;
      bool sonuc;
      _user= (await _firebaseAuthService.createUserWithEmailAndPassword(email, password,pozisyon))!;
      sonuc =  await _firestoreDBServise.saveUserWithEmailAndPassword(_user);
      if(sonuc==true)
        {

          return await _firestoreDBServise.readUser(_user.userID);
        }
      else
        return null;
    }
  }

  Future<bool> UpdateUserName(String UserId,String UserAd,String UserSoyad,String UserAdres)async
  {
    if(appMode==AppMode.DEBUG)
    {
      return false;
    }
    else
    {
      return await _firestoreDBServise.updateUserAd(UserId, UserAd,UserSoyad,UserAdres);
    }
  }
  Future<MyUser> readUser(String? id) async {
    return await _firestoreDBServise.readUser(id);
  }
}