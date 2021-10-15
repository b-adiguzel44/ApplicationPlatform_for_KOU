// ignore: unused_import
// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/material/colors.dart';

import 'homepage.dart'; //google'ın uygulama geliştiricilere yönelik sunduğu paketin adı material.io

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => iskele(),
        "/loginpage": (context) => loginpages(),
      },
    );
  }
}

// ignore: camel_case_types
class loginpages extends StatelessWidget {
  const loginpages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kocaeli Üniversitesi Başvuruları"),
        backgroundColor: Colors.green.shade600,
      ),
      body: loginpage(),
    );
  }
}



// ignore: camel_case_types
class iskele extends StatelessWidget {
  const iskele({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kocaeli Üniversitesi"),
        backgroundColor: Colors.green.shade600,
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  
  final username = TextEditingController();
  final password = TextEditingController();
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white70,
    primary: Colors.green[600],
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  final ButtonStyle raisedButtonStyle2 = ElevatedButton.styleFrom(
    onPrimary: Colors.white70,
    primary: Colors.red.shade900,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );


  girisyap(){
    if (username.text=="1" && password.text=="1") {
      Navigator.pushNamed(context, "/loginpage");
      
    } else {
      Navigator.pushNamed(context, "/");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Image.asset(
              "images/kou.png",
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 100, left: 20, right: 20),
                  height: 50,
                  child: TextField(
                    controller: username,
                    decoration: InputDecoration(
                      labelText: 'Öğrenci Numarası Giriniz',
                      labelStyle: TextStyle(
                        color: Colors.black87,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green.shade700,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green.shade700,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  height: 50,
                  child: TextField(
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                      labelText: 'Şifrenizi Giriniz',
                      labelStyle: TextStyle(
                        color: Colors.black87,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green.shade700,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green.shade700,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(children: <Widget>[
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(
                      top: 10,
                      left: 20,
                    ),
                    height: 60,
                    child: ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: girisyap,
                      child: Text('Giriş'),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(
                      top: 10,
                      right: 20,
                      left: 150,
                    ),
                    height: 60,
                    child: ElevatedButton(
                      style: raisedButtonStyle2,
                      onPressed: () {},
                      child: Text('Şifremi Unuttum'),
                    ),
                  ),
                ])
              ],
            ),
          ],
        ),
      ],
    );
  }
}








// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: "Uygulama Çerçevem",
//       home: AnaEkran(),//home parametresi başka bir parametre çağırmaya yarar
//     );
//   }
// }

// class AnaEkran extends StatelessWidget {
//   const AnaEkran({Key? key}) : super(key: key);

//   get blue => null;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("App Bar Açıklaması"),
//       ),
      
//       // ignore: avoid_unnecessary_containers
//       body:  Container(
//           child: const Center(
//         child: Text("Center child içindeki Child Texti"),
//       )),
//     );
//   }
// }





