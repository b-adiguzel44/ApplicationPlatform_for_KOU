
import 'package:flutter/material.dart';

class MyUser {
  final String? userID;
  String? mail;
  String? fotoUrl;
  String? pozisyon;
  String? ad;
  String? soyad;
  String? adres;

  MyUser({required this.userID, required this.mail, required this.pozisyon});

  Map<String, dynamic> toMap() {
    return {
      "userID": userID,
      "mail": mail,
      "fotoUrl": fotoUrl ?? "",
      "pozisyon": pozisyon ?? "",
      "ad":ad ?? "",
      "soyad": soyad ?? "",
      "adres" : adres ?? ""
    };
  }

  MyUser.fromMap(Map<String, dynamic> map)
      :
        userID = map['userID'],
        mail = map['mail'],
        fotoUrl = map['fotoUrl'],
        pozisyon = map['pozisyon'],
        ad = map['ad'],
        soyad = map['soyad'],
        adres = map['adres'];

  @override
  String toString() {
    return 'MyUser{userID: $userID, mail: $mail, fotoUrl: $fotoUrl, pozisyon: $pozisyon, ad: $ad, soyad: $soyad, adres: $adres}';
  }
}