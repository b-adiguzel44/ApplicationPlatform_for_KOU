
import 'dart:math';

import 'package:flutter/material.dart';

class MyUser {
  final String? userID;
  String? mail;
  String? fotoUrl;
  String? pozisyon;
  String? ad;
  String? soyad;
  String? adres;
  String? telefon;
  String? tcNo;
  String? sinifNo;
  String? dogumTarihi;
  String? universite;
  String? fakulte;
  String? bolum;
  String? basvuruTuru, basvuruDurumu="false";


  MyUser({required this.userID, required this.mail, required this.pozisyon});

  Map<String, dynamic> toMap() {
    return {
      "userID": userID,
      "mail": mail,
      "fotoUrl": fotoUrl ?? "1",
      "pozisyon": pozisyon ?? "1",
      "ad":ad ?? "1",
      "soyad": soyad ?? "1",
      "adres" : adres ?? "1",
      "telefon" : telefon ?? "1",
      "tcNo": tcNo ?? "1",
      "sinifNo": sinifNo ?? "1",
      "dogumTarihi": dogumTarihi ?? "1",
      "universite":universite ?? "1",
      "fakulte": fakulte ?? "1",
      "bolum" : bolum ?? "1"
    };
  }
  Map<String, dynamic> toBasvuru(String basvuruTuru) {
    return {
      "basvuruDurumu" : basvuruDurumu,
      "basvuruTuru" : basvuruTuru,
      "userId": userID,
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
        adres = map['adres'],
        telefon = map['telefon'],
        tcNo = map['tcNo'],
        sinifNo = map['sinifNo'],
        dogumTarihi = map['dogumTarihi'],
        universite = map['universite'],
        fakulte = map['fakulte'],
        bolum = map['bolum'];

  MyUser.fromBasvuru(Map<String, dynamic> map)
      :
        userID = map['userId'],
        basvuruTuru = map['basvuruTuru'],
        basvuruDurumu= map['basvuruDurumu'];

  @override
  String toString() {
    return 'MyUser{userID: $userID, mail: $mail, fotoUrl: $fotoUrl, pozisyon: $pozisyon, ad: $ad, soyad: $soyad, adres: $adres, telefon: $telefon, tcNo: $tcNo, sinifNo: $sinifNo, dogumTarihi: $dogumTarihi, universite: $universite, fakulte: $fakulte, bolum: $bolum}';
  }
}