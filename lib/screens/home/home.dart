



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



  // Home sayfasına giriş yapıldıktan sonra Mavi bir avatar gözüküyor olması lazım
  // TODO: Home ekranından sonra giriş yapan kullanıcı türüne (öğrenci/admin) göre ilgili sayfa ve kısımları buraya getir

  @override
  Widget build(BuildContext context) {
    String tabBarDurum="";
    bool guncelleme=false;
    String? ad="",soyad="",kullaniciTipi="",adres="",mail="";
    userModel _userModel = Provider.of<userModel>(context);
    ad =_userModel.user.ad;
    soyad=_userModel.user.soyad;
    adres=_userModel.user.adres;
    mail=_userModel.user.mail;
    kullaniciTipi = _userModel.user.pozisyon;
    buildPage(String s){
      tabBarDurum=s;

      if(tabBarDurum=="Basvuru")
      {
        return Scaffold(
            backgroundColor: Colors.green[100],
            body: Center(
                child: SingleChildScrollView(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[SocailLoginButton( yukseklik:70,textColor: Colors.white,
                                buttonColor:Colors.green,
                                buttonText: "Yaz Okulu Başvurusu Oluştur",
                                buttonIcon: Icon(null),
                                onPress:(){Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => YazOkuluBasvuru()));}),
                              SocailLoginButton(yukseklik:70, textColor: Colors.white,
                                  buttonColor:Colors.green,
                                  buttonText: "Yatay Geçiş Başvurusu Oluştur",
                                  buttonIcon: Icon(null),
                                  onPress:(){Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => YatayGecisBasvuru()));}),
                              SocailLoginButton(yukseklik:70, textColor: Colors.white,
                                  buttonColor:Colors.green,
                                  buttonText: "DGS Başvurusu Oluştur",
                                  buttonIcon: Icon(null),
                                  onPress:(){Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => DGSBasvuru()));}),
                              SocailLoginButton(yukseklik:70, textColor: Colors.white,
                                  buttonColor:Colors.green,
                                  buttonText: "ÇAP Başvurusu Oluştur",
                                  buttonIcon: Icon(null),
                                  onPress:(){Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => CAPBasvuru()));}),
                              SocailLoginButton(yukseklik:70, textColor: Colors.white,
                                  buttonColor:Colors.green,
                                  buttonText: "Ders İntibak Başvurusu Oluştur",
                                  buttonIcon: Icon(null),
                                  onPress:(){Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => DersIntibakBasvuru()));})]
                        )
                    )
                )
            ));
      }else if(tabBarDurum=="Basvurular")
      {return Scaffold(
          backgroundColor: Colors.green[100],
          body: Center(
          child: SingleChildScrollView(
          child: Container(
          margin: const EdgeInsets.fromLTRB(30, 10, 30, 10), padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column()))));

      }
      else
      {

        return Scaffold(
            backgroundColor: Colors.green[100],
            body: Center(
                child: SingleChildScrollView(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(15, 10, 15, 10), padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          children: <Widget>[
                            Padding(padding: const EdgeInsets.all(8),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(_userModel.user.fotoUrl!),
                              ),),
                            TextFormField(
                              enabled: guncelleme,
                              initialValue: kullaniciTipi,
                              decoration: InputDecoration(labelText: 'Kullanıcı Tipi',
                              border: OutlineInputBorder()),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              enabled: guncelleme,
                              initialValue: mail,
                              decoration: InputDecoration(labelText: 'Mail',
                                  border: OutlineInputBorder()),
                            ),

                            SizedBox(height: 10,),
                            TextFormField(
                              enabled: guncelleme,
                              initialValue: ad,
                              decoration: InputDecoration(labelText: 'Ad',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              enabled: guncelleme,
                              initialValue: soyad,
                              decoration: InputDecoration(labelText: 'Soyad',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              enabled: guncelleme,
                              initialValue: adres,
                              decoration: InputDecoration(labelText: 'Adres',
                                  border: OutlineInputBorder()),
                            ),

                            SizedBox(height: 20,),
                            SocailLoginButton(yukseklik:40, textColor: Colors.white,
                                buttonColor:Colors.green,
                                buttonText: "Güncelle",
                                buttonIcon: Icon(null),
                                onPress:() {Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => KisiselBilgiGuncelle()));}
                                )
                          ]
                        )
                    )
                )
            )
        );
      }
    }

    return DefaultTabController(length: 3,
        child: Scaffold(
        appBar: AppBar(title: Text("KOU BAŞVURU SİSTEMİ"),
          backgroundColor: Colors.green,
          centerTitle: true,
          leading:IconButton(icon: Icon(Icons.menu),
            onPressed:(){} ,),
          actions: [FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("Çıkış",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))],
          elevation: 20,
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [Tab(icon: Icon(Icons.add),text: 'Başvuru',),
              Tab(icon: Icon(Icons.history),text: 'Başvurularım',),
              Tab(icon: Icon(Icons.person),text: 'Profil',)],)
          ,),
          body: TabBarView(children: [buildPage('Basvuru'),
        buildPage('Basvurular'),
        buildPage('Profil'),],)
          ,));

  }

}
