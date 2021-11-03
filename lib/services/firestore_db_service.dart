// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/models/my_user.dart';
import 'package:kou_basvuru_platform/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDBServise implements DataBaseService {
  final FirebaseFirestore _firestoreAuth = FirebaseFirestore.instance;
  @override
  Future<bool> saveUserWithEmailAndPassword(MyUser saveUser) async {
    await _firestoreAuth
        .collection("Kullanıcılar")
        .doc(saveUser.userID)
        .set(saveUser.toMap());
    readUser(saveUser.userID);
    return true;
  }

  @override
  Future<MyUser> readUser(String? id) async {
    DocumentSnapshot<Map<String, dynamic>> _okunanUser =
        await _firestoreAuth.collection("Kullanıcılar").doc(id).get();

    MyUser okunanUserNesnesi;
    okunanUserNesnesi =
        MyUser.fromMap(_okunanUser.data() as Map<String, dynamic>);
    print("Okunan user bilgisi " + okunanUserNesnesi.toString());
    return okunanUserNesnesi;
  }

  @override
  Future<bool> updateUserAd(
      String UserId, String UserAd, String UserSoyad, String UserAdres) async {
    await _firestoreAuth
        .collection("Kullanıcılar")
        .doc(UserId)
        .update({"ad": UserAd, "soyad": UserSoyad, "adres": UserAdres});
    return true;
  }

  // ignore: non_constant_identifier_names
  Future<bool> updateProfilFoto(String UserId, String url) async {
    await _firestoreAuth.collection("Kullanıcılar").doc(UserId).update({
      "fotoUrl": url,
    });
    return true;
  }
}
