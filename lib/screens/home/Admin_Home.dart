import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/screens/sayfalar/KisiselBilgiGuncelleme.dart';
import 'package:kou_basvuru_platform/widget/social_login_button.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? ad="Emre",soyad="Erken",adNo="181307072",adres="İzmit",mail="181307072@kocaeli.edu.tr";
    buildPage(String s){
      var tabBarDurum=s;

      if(tabBarDurum=="Basvuru")
      {
        return Scaffold(
            backgroundColor: Colors.green[100],
            body: Center(
                child: SingleChildScrollView(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(30, 10, 30, 10), padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column()))));

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
                              TextFormField(
                                enabled: false,
                                initialValue: adNo,
                                decoration: InputDecoration(labelText: 'Admin Numarası',
                                    border: OutlineInputBorder()),
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                enabled: false,
                                initialValue: ad,
                                decoration: InputDecoration(labelText: 'Ad',
                                    border: OutlineInputBorder()),
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                enabled: false,
                                initialValue: soyad,
                                decoration: InputDecoration(labelText: 'Soyad',
                                    border: OutlineInputBorder()),
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                enabled: false,
                                initialValue: adres,
                                decoration: InputDecoration(labelText: 'Adres',
                                    border: OutlineInputBorder()),
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                enabled: false,
                                initialValue: mail,
                                decoration: InputDecoration(labelText: 'Mail',
                                    border: OutlineInputBorder()),
                              ),
                              SizedBox(height: 10,),
                              SocailLoginButton(yukseklik:40, textColor: Colors.white,
                                  buttonColor:Colors.green,
                                  buttonText: "Güncelle",
                                  buttonIcon: Icon(null),
                                  onPress:() {Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => const KisiselBilgiGuncelle()));}
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
            actions: [IconButton(icon: Icon(Icons.search), onPressed:(){} ,),],
            elevation: 20,
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [Tab(icon: Icon(Icons.history),text: 'Onay Bekleyen',),
                Tab(icon: Icon(Icons.assignment_turned_in_outlined),text: 'Onaylanan',),
                Tab(icon: Icon(Icons.person),text: 'Profil',)],)
            ,),
          body: TabBarView(children: [buildPage('Basvuru'),
            buildPage('Basvurular'),
            buildPage('Profil'),],)
          ,));
  }
}
