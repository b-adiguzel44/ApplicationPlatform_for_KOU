import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/screens/authenticate/admin_login.dart';
import 'package:kou_basvuru_platform/screens/authenticate/student_login.dart';
import 'package:kou_basvuru_platform/shared/constants.dart';


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
                    image: AssetImage('assets/login_bg.jpg'),
                    fit: BoxFit.fill
                )
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(100.0, 30.0, 0.0, 20.0),
            padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 20.0),
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
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold, fontFamily: 'roboto-bold'),
                ),
                SizedBox(height: 50),
                // Öğrenci Login sayfasına yönlendirme
                ElevatedButton.icon(
                    style: buttonStyle.copyWith(
                      backgroundColor: MaterialStateProperty.all(Colors.green[600]),
                      overlayColor: MaterialStateProperty.all(Colors.green[200]),
                    ),
                    onPressed: () {
                      // Öğrenci Giriş Paneline git
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => StudentLogin() )
                      );
                    },
                    icon: const Icon(Icons.person),
                    label: const Text('Öğrenci Girişi')
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                    style: buttonStyle.copyWith(
                      backgroundColor: MaterialStateProperty.all(Colors.green[600]),
                      overlayColor: MaterialStateProperty.all(Colors.green[200]),
                    ),
                    onPressed: () {
                      // Admin Giriş Paneline git
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AdminLogin() )
                      );
                    },
                    icon: const Icon(Icons.account_balance_outlined),
                    label: const Text('Yönetici Girişi')
                ),

              ],
            ),
          )
        ],
      )
    );
  }
}
