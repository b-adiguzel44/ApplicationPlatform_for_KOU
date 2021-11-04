import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/models/user_Model.dart';
import 'package:kou_basvuru_platform/screens/sayfalar/CAPBasvurusu.dart';
import 'package:kou_basvuru_platform/screens/sayfalar/DGSBasvurusu.dart';
import 'package:kou_basvuru_platform/screens/sayfalar/DersIntibakBasvurusu.dart';
import 'package:kou_basvuru_platform/screens/sayfalar/KisiselBilgiGuncelleme.dart';
import 'package:kou_basvuru_platform/screens/sayfalar/YatayGecisBasvurusu.dart';
import 'package:kou_basvuru_platform/screens/sayfalar/YazOkuluBasvuru.dart';
import 'package:kou_basvuru_platform/widget/social_login_button.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String tabBarDurum = "";
    bool guncelleme = false;
    String? ad = "", soyad = "", kullaniciTipi = "", adres = "", mail = "";
    String? telefon;
    String? tcNo;
    String? sinifNo;
    String? dogumTarihi;
    String? universite;
    String? fakulte;
    String? bolum;
    userModel _userModel = Provider.of<userModel>(context);
    ad = _userModel.user.ad;
    soyad = _userModel.user.soyad;
    adres = _userModel.user.adres;
    mail = _userModel.user.mail;
    kullaniciTipi = _userModel.user.pozisyon;
    telefon = _userModel.user.telefon;
    tcNo = _userModel.user.tcNo;
    sinifNo = _userModel.user.sinifNo;
    dogumTarihi = _userModel.user.dogumTarihi;
    universite = _userModel.user.universite;
    fakulte = _userModel.user.fakulte;
    bolum = _userModel.user.bolum;
    buildPage(String s) {
      tabBarDurum = s;

      if (tabBarDurum == "Basvuru") {
        return Scaffold(
            backgroundColor: Colors.green[100],
            body: Center(
                child: SingleChildScrollView(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SocailLoginButton(
                                  yukseklik: 70,
                                  textColor: Colors.white,
                                  buttonColor: Colors.green,
                                  buttonText: "Yaz Okulu Başvurusu Oluştur",
                                  buttonIcon: Icon(null),
                                  onPress: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                YazOkuluBasvuru()));
                                  }),
                              SocailLoginButton(
                                  yukseklik: 70,
                                  textColor: Colors.white,
                                  buttonColor: Colors.green,
                                  buttonText: "Yatay Geçiş Başvurusu Oluştur",
                                  buttonIcon: Icon(null),
                                  onPress: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                YatayGecisBasvuru()));
                                  }),
                              SocailLoginButton(
                                  yukseklik: 70,
                                  textColor: Colors.white,
                                  buttonColor: Colors.green,
                                  buttonText: "DGS Başvurusu Oluştur",
                                  buttonIcon: Icon(null),
                                  onPress: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DGSBasvuru()));
                                  }),
                              SocailLoginButton(
                                  yukseklik: 70,
                                  textColor: Colors.white,
                                  buttonColor: Colors.green,
                                  buttonText: "ÇAP Başvurusu Oluştur",
                                  buttonIcon: Icon(null),
                                  onPress: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CAPBasvuru()));
                                  }),
                              SocailLoginButton(
                                  yukseklik: 70,
                                  textColor: Colors.white,
                                  buttonColor: Colors.green,
                                  buttonText: "Ders İntibak Başvurusu Oluştur",
                                  buttonIcon: Icon(null),
                                  onPress: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DersIntibakBasvuru()));
                                  })
                            ])))));
      } else if (tabBarDurum == "Basvurular") {
        return Scaffold(
            backgroundColor: Colors.green[100],
            body: Center(
                child: SingleChildScrollView(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column()))));
      } else {
        return Scaffold(
            backgroundColor: Colors.green[100],
            body: Center(
                child: SingleChildScrollView(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage(_userModel.user.fotoUrl!),
                            ),
                          ),
                          TextFormField(
                            enabled: guncelleme,
                            initialValue: kullaniciTipi,
                            decoration: InputDecoration(
                                labelText: 'Kullanıcı Tipi',
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            enabled: guncelleme,
                            initialValue: mail,
                            decoration: InputDecoration(
                                labelText: 'Mail',
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            enabled: guncelleme,
                            initialValue: tcNo,
                            decoration: InputDecoration(
                                labelText: 'Tc No', border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            enabled: guncelleme,
                            initialValue: ad,
                            decoration: InputDecoration(
                                labelText: 'Ad', border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            enabled: guncelleme,
                            initialValue: soyad,
                            decoration: InputDecoration(
                                labelText: 'Soyad',
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            enabled: guncelleme,
                            initialValue: adres,
                            decoration: InputDecoration(
                                labelText: 'Adres',
                                border: OutlineInputBorder()),
                          ),
                          TextFormField(
                            initialValue: telefon,
                            enabled: guncelleme,
                            decoration: InputDecoration(
                                labelText: 'Telefon',
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          TextFormField(
                            initialValue: dogumTarihi,
                            enabled: guncelleme,
                            decoration: InputDecoration(
                                labelText: 'Dogum Tarihi', border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            //controller: soyadController,
                            enabled: guncelleme,
                            initialValue: sinifNo,
                            decoration: InputDecoration(
                                labelText: 'Sınıf', border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            //controller: soyadController,
                            enabled: guncelleme,
                            initialValue: universite,
                            decoration: InputDecoration(
                                labelText: 'Üniversite', border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            //controller: adresController,
                            enabled: guncelleme,
                            initialValue: fakulte,
                            decoration: InputDecoration(
                                labelText: 'Fakülte', border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SocailLoginButton(
                              yukseklik: 40,
                              textColor: Colors.white,
                              buttonColor: Colors.green,
                              buttonText: "Kişisel Bilgileri Güncelle",
                              buttonIcon: Icon(null),
                              onPress: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            KisiselBilgiGuncelle()));
                              })
                        ])))));
      }
    }

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("KOU BAŞVURU SİSTEMİ"),
            backgroundColor: Colors.green,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Çıkış",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ))
            ],
            elevation: 20,
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Tab(
                  icon: Icon(Icons.add),
                  text: 'Başvuru',
                ),
                Tab(
                  icon: Icon(Icons.history),
                  text: 'Başvurularım',
                ),
                Tab(
                  icon: Icon(Icons.person),
                  text: 'Profil',
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              buildPage('Basvuru'),
              buildPage('Basvurular'),
              buildPage('Profil'),
            ],
          ),
        ));
  }
}
