import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kou_basvuru_platform/models/my_user.dart';

abstract class AuthService {
  Future<MyUser?> currentUser();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<MyUser?> signInWithEmailAndPassword(String email, String password,String pozisyon);
  Future<MyUser?> createUserWithEmailAndPassword(String email, String password,String pozisyon);

  Future<bool?> signOut();

}