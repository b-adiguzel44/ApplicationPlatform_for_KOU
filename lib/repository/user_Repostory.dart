import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker_platform_interface/src/types/picked_file/unsupported.dart';
import 'package:kou_basvuru_platform/models/my_user.dart';
import 'package:kou_basvuru_platform/services/auth.dart';
import 'package:kou_basvuru_platform/services/fake_auth.dart';
import 'package:kou_basvuru_platform/services/firebase_auth_servise.dart';
import 'package:kou_basvuru_platform/services/firebase_storage_service.dart';
import 'package:kou_basvuru_platform/services/firestore_db_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepostory implements AuthService {
  FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  FakeAuth _fakeAuth = FakeAuth();
  FirestoreDBServise _firestoreDBServise = FirestoreDBServise(); //veritabanı
  FirebaseStorageServise _firebaseStorage = FirebaseStorageServise();
  AppMode appMode = AppMode.RELEASE;
  @override
  Future<MyUser?> currentUser() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuth.currentUser();
    } else {
      MyUser? _user = await _firebaseAuthService.currentUser();
      return await _firestoreDBServise.readUser(_user!.userID);
    }
  }

  @override
  Future<MyUser?> signInWithEmailAndPassword(
      String email, String password, String pozisyon) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuth.signInWithEmailAndPassword(
          email, password, pozisyon);
    } else {
      MyUser _user;
      _user = (await _firebaseAuthService.signInWithEmailAndPassword(
          email, password, pozisyon))!;
      return await _firestoreDBServise.readUser(_user.userID);
    }
  }

  @override
  Future<bool?> signOut() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuth.signOut();
    } else {
      return await _firebaseAuthService.signOut();
    }
  }

  @override
  Future<MyUser?> createUserWithEmailAndPassword(
      String email, String password, String pozisyon) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuth.createUserWithEmailAndPassword(
          email, password, pozisyon);
    } else {
      MyUser _user;
      bool sonuc;
      _user = (await _firebaseAuthService.createUserWithEmailAndPassword(
          email, password, pozisyon))!;
      sonuc = await _firestoreDBServise.saveUserWithEmailAndPassword(_user);
      if (sonuc == true) {
        return await _firestoreDBServise.readUser(_user.userID);
      } else
        return null;
    }
  }

  Future<bool> UpdateUserName(
      String UserId, String UserAd, String UserSoyad, String UserAdres,String Telefon , String tcNo , String DogumTarih) async {
    if (appMode == AppMode.DEBUG) {
      return false;
    } else {
      return await _firestoreDBServise.updateUserAd(
          UserId, UserAd, UserSoyad, UserAdres , Telefon , tcNo , DogumTarih);
    }
  }

  Future<MyUser> readUser(String? id) async {
    return await _firestoreDBServise.readUser(id);
  }

  Future<String> uploadFile(
      String? userID, String fileType, File profilFoto, String dosyaAdi,) async {
    if (appMode == AppMode.DEBUG) {
      return "";
    } else {
      var profilFotoUrl =
          await _firebaseStorage.uploadFile(userID!, fileType, dosyaAdi,profilFoto );
      await _firestoreDBServise.updateProfilFoto(userID, profilFotoUrl);
      return profilFotoUrl;
    }
  }
  Future<bool> basvuruKaydet(MyUser user, String BasuruTuru) async{
    if (appMode == AppMode.DEBUG) {
      return false;
    } else {
      var sonuc = await _firestoreDBServise.basvuruKaydet(user, BasuruTuru);
      return sonuc;
    }

  }
  Future<List<String>>  basvuruGetir(){

      var basvuruListesi = _firestoreDBServise.basvuruGetir();
      return basvuruListesi;



  }
}
