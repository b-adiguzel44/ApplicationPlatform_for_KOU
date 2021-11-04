import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/models/my_user.dart';
import 'package:kou_basvuru_platform/models/user_Model.dart';
import 'package:kou_basvuru_platform/screens/sayfalar/KisiselBilgiGuncelleme.dart';
import 'package:kou_basvuru_platform/widget/social_login_button.dart';
import 'package:provider/provider.dart';


class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? ad = "", soyad = "", kullaniciTipi = "", adres = "", mail = "";
    userModel _userModel = Provider.of<userModel>(context);
    ad = _userModel.user.ad;
    soyad = _userModel.user.soyad;
    adres = _userModel.user.adres;
    mail = _userModel.user.mail;
    kullaniciTipi = _userModel.user.pozisyon;

    buildPage(String s) {
      var tabBarDurum = s;

      if (tabBarDurum == "Basvuru") {
        return Scaffold(
            backgroundColor: Colors.green[100],
            body: FutureBuilder<List<String>>(
              future: _userModel.basvuruGetir(),
              builder: (context,snapshot){
                if(snapshot.hasData)
                  {
                    var basvurular = snapshot.data;
                    if(basvurular!.length>0)
                      {
                         return ListView.builder(
                           itemCount: basvurular.length,
                           itemBuilder: (context,index){
                             return ListTile(title: Text(snapshot.data![index]),);
                           }

                        );
                      }
                    else
                      {
                        return Center(child: Text("Kayıtlı Başvuru Bulunamadı"),);
                      }

                  }
                else
                  return Center(child: CircularProgressIndicator());

              }
            ),

                        );
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
                            enabled: false,
                            initialValue: kullaniciTipi,
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
                                labelText: 'Mail',
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            enabled: false,
                            initialValue: ad,
                            decoration: InputDecoration(
                                labelText: 'Ad', border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            enabled: false,
                            initialValue: soyad,
                            decoration: InputDecoration(
                                labelText: 'Soyad',
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            enabled: false,
                            initialValue: adres,
                            decoration: InputDecoration(
                                labelText: 'Adres',
                                border: OutlineInputBorder()),
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
                  icon: Icon(Icons.history),
                  text: 'Onay Bekleyen',
                ),
                Tab(
                  icon: Icon(Icons.assignment_turned_in_outlined),
                  text: 'Onaylanan',
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
