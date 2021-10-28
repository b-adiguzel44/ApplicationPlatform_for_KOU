import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/models/user_Model.dart';
import 'package:kou_basvuru_platform/widget/social_login_button.dart';
import 'package:provider/provider.dart';
class YazOkuluBasvuru extends StatefulWidget {
  const YazOkuluBasvuru({Key? key}) : super(key: key);

  @override
  _YazOkuluBasvuruState createState() => _YazOkuluBasvuruState();
}

class _YazOkuluBasvuruState extends State<YazOkuluBasvuru> with TickerProviderStateMixin{


  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    if (newIndex < 0 || newIndex >= _tabController.length) return;
    _tabController.animateTo(newIndex);
  }

  String sayfaAdi="Bilgiler";
  String? ad="Emre",soyad="Erken",ogrNo="181307072",adres="İzmit",mail="181307072@kocaeli.edu.tr";
  @override
  Widget build(BuildContext context) {


    userModel _userModel = Provider.of<userModel>(context);
    ad =_userModel.user.ad;
    soyad=_userModel.user.soyad;
    adres=_userModel.user.adres;
    mail=_userModel.user.mail;
    return DefaultTabController(length: 4,
        child: Scaffold(
          appBar: AppBar(title: Text("Yaz Okulu Başvuru"),
            backgroundColor: Colors.green,
            //centerTitle: true,
            //actions: [FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("Çıkış",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))],
            elevation: 20,
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [Tab(icon: Icon(Icons.person),text: 'Bilgiler',),
                Tab(icon: Icon(Icons.document_scanner),text: 'Form',),
                Tab(icon: Icon(Icons.addchart),text: 'Belgeler',),
                Tab(icon: Icon(Icons.assignment_turned_in_outlined),text: 'Onay',)],)
            ,),
          body: TabBarView(controller:_tabController,
            children: [buildPage('Bilgiler'),
              buildPage('Form'),
              buildPage('Belgeler'),
              buildPage('Onay'),],)
          ,));

  }

  buildPage(String s){

    if(s=="Bilgiler")
    {
      return Scaffold(
          backgroundColor: Colors.green[100],
          body: Center(
              child: SingleChildScrollView(
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10), padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                          children: <Widget>[
                            Text("KİŞİSEL BİLGİLER",style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(height: 30,),
                            TextFormField(
                              enabled: false,
                              initialValue: mail,
                              decoration: InputDecoration(labelText: 'Mail',
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

                            SizedBox(height: 10,),
                            SocailLoginButton(yukseklik:40, textColor: Colors.white,
                                buttonColor:Colors.green,
                                buttonText: "Devam Et",
                                buttonIcon: Icon(null),
                                onPress:() {
                                  _nextPage(1);

                                }
                            )
                          ]
                      )
                  )
              )
          )
      );
    } else if(s=="Form")
    {return Scaffold(
        backgroundColor: Colors.green[100],
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    margin: const EdgeInsets.fromLTRB(15, 10, 15, 10), padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                        children: <Widget>[
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
                              buttonText: "Devam Et",
                              buttonIcon: Icon(null),
                              onPress:() { _nextPage(1);}
                          )
                        ]
                    )
                )
            )
        )
    );

    }
    else if(s=="Belgeler")
    {
      return Scaffold(
          backgroundColor: Colors.green[100],
          body: Center(
              child: SingleChildScrollView(
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10), padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                          children: <Widget>[
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
                                buttonText: "Devam Et",
                                buttonIcon: Icon(null),
                                onPress:() { _nextPage(1);}
                            )
                          ]
                      )
                  )
              )
          )
      );
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
                                buttonText: "Devam Et",
                                buttonIcon: Icon(null),
                                onPress:() { _nextPage(1);}
                            )
                          ]
                      )
                  )
              )
          )
      );
    }
  }
}