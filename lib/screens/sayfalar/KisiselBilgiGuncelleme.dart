// ignore: file_names
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kou_basvuru_platform/models/user_Model.dart';
import 'package:kou_basvuru_platform/widget/social_login_button.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class KisiselBilgiGuncelle extends StatefulWidget {
  const KisiselBilgiGuncelle({Key? key}) : super(key: key);

  @override
  _KisiselBilgiGuncelleState createState() => _KisiselBilgiGuncelleState();
}

class _KisiselBilgiGuncelleState extends State<KisiselBilgiGuncelle> {
  late PickedFile? _profilFoto;
  final ImagePicker picker = ImagePicker();
  var imageFile;

  void _kameradanFotoCek() async {
    _profilFoto = await picker.getImage(source: ImageSource.camera);
    setState(() {
      imageFile = File(_profilFoto!.path);
    });
  }

  void _galeridenFotoCek() async {
    _profilFoto = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      var imageFile = File(_profilFoto!.path);
    });
  }

  final TextEditingController adController = TextEditingController();
  final TextEditingController soyadController = TextEditingController();
  final TextEditingController adresController = TextEditingController();
  final TextEditingController telefonController = TextEditingController();
  final TextEditingController tcNoController = TextEditingController();
  final TextEditingController dogumTarihiController = TextEditingController();
  String? ad, soyad, ogrNo, adres, mail, kullaniciTipi, fotoUrl = "";
  String? telefon= "";
  String? tcNo= "";
  String? sinifNo= "";
  String? dogumTarihi= "";
  String? universite= "";
  String? fakulte= "";
  String? bolum= "";
  String btnText = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userModel _userModel = Provider.of<userModel>(context);
    ad = _userModel.user.ad;
    soyad = _userModel.user.soyad;
    adres = _userModel.user.adres;
    mail = _userModel.user.mail;
    fotoUrl = _userModel.user.fotoUrl;
    kullaniciTipi = _userModel.user.pozisyon;
    telefon = _userModel.user.telefon;
    tcNo = _userModel.user.tcNo;
    sinifNo = _userModel.user.sinifNo;
    dogumTarihi = _userModel.user.dogumTarihi;
    universite = _userModel.user.universite;
    fakulte = _userModel.user.fakulte;
    bolum = _userModel.user.bolum;
    adController.text = ad!;
    soyadController.text = soyad!;
    adresController.text = adres!;
    telefonController.text = telefon!;
    tcNoController.text = tcNo!;
    dogumTarihiController.text = dogumTarihi!;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Kişisel Bilgi Güncelleme"),
          backgroundColor: Colors.green,
          centerTitle: true,
          elevation: 20,
        ),
        backgroundColor: Colors.green[100],
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    color: Colors.green[100],
                                    height: 120,
                                    child: Column(
                                      children: <Widget>[
                                        ListTile(
                                            leading: Icon(Icons.camera),
                                            title: Text("Kameradan Çek"),
                                            onTap: () {
                                              _kameradanFotoCek();
                                            }),
                                        ListTile(
                                            leading: Icon(Icons.image),
                                            title: Text("Galeriden Seç"),
                                            onTap: () {
                                              _galeridenFotoCek();
                                            }),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: CircleAvatar(
                            radius: 75,
                            backgroundImage: imageFile == null
                                ? NetworkImage(fotoUrl!)
                                : FileImage(imageFile) as ImageProvider,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: kullaniciTipi,
                        enabled: false,
                        decoration: InputDecoration(
                            labelText: 'Kullanıcı Tipi',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        enabled: false,
                        initialValue: mail,
                        decoration: InputDecoration(
                            labelText: 'Mail', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(controller: tcNoController,
                        enabled: true,
                        initialValue: tcNo,
                        decoration: InputDecoration(
                            labelText: 'Tc No', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        //initialValue: ogrNo.toString(),
                        controller: adController,
                        enabled: true,
                        decoration: InputDecoration(
                            labelText: 'Ad', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: soyadController,
                        enabled: true,
                        initialValue: soyad,
                        decoration: InputDecoration(
                            labelText: 'Soyad', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: adresController,
                        enabled: true,
                        initialValue: adres,
                        decoration: InputDecoration(
                            labelText: 'Adres', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(controller: telefonController,
                        initialValue: telefon,
                        enabled: true,
                        decoration: InputDecoration(
                            labelText: 'Telefon',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(controller: dogumTarihiController,
                        initialValue: dogumTarihi,
                        enabled: true,
                        decoration: InputDecoration(
                            labelText: 'Dogum Tarihi', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        //controller: soyadController,
                        enabled: true,
                        initialValue: sinifNo,
                        decoration: InputDecoration(
                            labelText: 'Sınıf', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        //controller: soyadController,
                        enabled: true,
                        initialValue: universite,
                        decoration: InputDecoration(
                            labelText: 'Üniversite', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        //controller: adresController,
                        enabled: true,
                        initialValue: fakulte,
                        decoration: InputDecoration(
                            labelText: 'Fakülte', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SocailLoginButton(
                          yukseklik: 40,
                          textColor: Colors.white,
                          buttonColor: Colors.green,
                          buttonText: "Kaydet",
                          buttonIcon: Icon(null),
                          onPress: () {
                            guncelle(context);
                          }),
                    ])))));
  }

  void bildirim(String hata1, hata2) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.green[100],
            title: Text(hata1),
            content: Text(hata2),
            elevation: 20,
            actions: <Widget>[
              FlatButton(
                child: Text("Tamam"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  void guncelle(BuildContext context) async {
    final _userModel = Provider.of<userModel>(context);

    if (_userModel.UptadeUser(_userModel.user.userID!, adController.text,
            soyadController.text, adresController.text , telefonController.text, tcNoController.text, dogumTarihiController.text) !=
        true) {
      _userModel.user.ad = adController.text;
      _userModel.user.soyad = soyadController.text;
      _userModel.user.adres = adresController.text;
      _userModel.user.telefon = telefonController.text;
      _userModel.user.tcNo = tcNoController.text;
      _userModel.user.dogumTarihi = dogumTarihiController.text;
      bildirim("", "Kişisel Bilgiler Başarıyla Güncellendi");
    } else {
      bildirim("Güncelleme Hatası", "Kişisel Bilgiler Güncellenemedi");
    }

    if (_profilFoto != null) {
      await _userModel.uploadFile(
          _userModel.user.userID, "/jpeg", imageFile,"");
    }
  }
}
