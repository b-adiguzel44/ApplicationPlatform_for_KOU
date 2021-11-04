// ignore: file_names

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker_platform_interface/src/types/picked_file/unsupported.dart';
import 'package:kou_basvuru_platform/models/user_Model.dart';
import 'package:kou_basvuru_platform/models/my_user.dart';
import 'package:kou_basvuru_platform/repository/user_Repostory.dart';
import 'package:kou_basvuru_platform/services/auth.dart';
import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum ViewState { Idle, Busy }

class userModel with ChangeNotifier implements AuthService {
  ViewState _state = ViewState.Idle;
  UserRepostory _userRepostory = UserRepostory();
  late MyUser _user;
  MyUser get user => _user;

  ViewState get state => _state;
  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  userModel() {
    currentUser();
  }
  @override
  Future<MyUser?> currentUser() async {
    try {
      state = ViewState.Busy;
      _user = (await _userRepostory.currentUser())!;
      return _user;
    } catch (e) {
      print("Usermodel deki current userda hata" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<MyUser?> signInWithEmailAndPassword(
      String email, String password, String pozisyon) async {
    try {
      state = ViewState.Busy;

      _user = (await _userRepostory.signInWithEmailAndPassword(
          email, password, pozisyon))!;
      return _user;
    } catch (e) {
      print("Usermodel deki signin hata" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool?> signOut() async {
    try {
      state = ViewState.Busy;
      bool? sonuc;
      sonuc = await _userRepostory.signOut();

      return sonuc;
    } catch (e) {
      print("Usermodel deki sign userda hata" + e.toString());
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<MyUser?> createUserWithEmailAndPassword(
      String email, String password, String pozisyon) async {
    try {
      state = ViewState.Busy;
      _user = (await _userRepostory.createUserWithEmailAndPassword(
          email, password, pozisyon))!;
      return _user;
    } catch (e) {
      print("Usermodel deki current userda hata" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  Future<bool> UptadeUser(
      String UserId, String UserAd, String UserSoyad, String UserAdres, String Telefon , String tcNo , String DogumTarihi) async {
    bool sonuc;
    sonuc = await _userRepostory.UpdateUserName(
        UserId, UserAd, UserSoyad, UserAdres , Telefon , tcNo ,DogumTarihi);
    return sonuc;
  }

  @override
  Future<MyUser> readUser(String? id) async {
    return await _userRepostory.readUser(id);
  }

  Future<String> uploadFile(
      String? userID, String fileType, File profilFoto,String dosyaAdi,) async {
    var url = await _userRepostory.uploadFile(userID, fileType, profilFoto,dosyaAdi);
    return url;
  }

  Future<bool> basvuruKaydet(MyUser user, String BasuruTuru) async{
    var sonuc = await _userRepostory.basvuruKaydet(user, BasuruTuru);
    return sonuc;

  }
  Future<List<String>>  basvuruGetir() {
    var basvuruListesi = _userRepostory.basvuruGetir();
    return basvuruListesi ;

  }

}
