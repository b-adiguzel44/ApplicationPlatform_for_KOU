import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/models/user_Model.dart';
import 'package:kou_basvuru_platform/screens/sayfalar/admin_login.dart';
import 'package:kou_basvuru_platform/screens/sayfalar/student_login.dart';
import 'package:kou_basvuru_platform/services/firebase_auth_servise.dart';
import 'package:kou_basvuru_platform/shared/constants.dart';
import 'package:kou_basvuru_platform/widget/social_login_button.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/login_bg.jpg'), fit: BoxFit.fill)),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 20.0),
          padding:
              const EdgeInsets.symmetric(vertical: 100.0, horizontal: 20.0),
          // color: Colors.brown[100],  // TODO : Silinecek propetry (şuanlık duruyor)
          child: Column(
            children: <Widget>[
              const CircleAvatar(
                backgroundImage: AssetImage('assets/kou2.png'),
                backgroundColor: Colors.white,
                radius: 70.0,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Kocaeli Üniversitesi\nBaşvuru Platformu',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'roboto-bold'),
              ),
              SizedBox(height: 50),
              SocailLoginButton(
                textColor: Colors.white,
                buttonColor: Colors.green,
                buttonText: "ÖĞRENCİ GİRİŞ",
                buttonIcon: Icon(Icons.person),
                onPress: () {
                  // Admin Giriş Paneline git
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentLogin(
                                auth: FirebaseAuthService(),
                              )));
                },
              ),
              SocailLoginButton(
                textColor: Colors.white,
                buttonColor: Colors.green,
                buttonText: "ADMİN GİRİŞ",
                buttonIcon: Icon(Icons.account_balance_outlined),
                onPress: () {
                  // Admin Giriş Paneline git
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminLogin(
                                auth: FirebaseAuthService(),
                              )));
                },
              ), // Öğrenci Login sayfasına yönlendirme
              const SizedBox(height: 20),
            ],
          ),
        )
      ],
    ));
  }
}
