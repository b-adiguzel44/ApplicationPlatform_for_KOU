import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/screens/authenticate/admin_login.dart';
import 'package:kou_basvuru_platform/screens/authenticate/student_login.dart';


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
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/login_bg.jpg'),
                    fit: BoxFit.fill
                )
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(100.0, 30.0, 0.0, 20.0),
            padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 20.0),
            // color: Colors.brown[100],  // TODO : Silinecek propetry (şuanlık duruyor)
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/kou2.png'),
                  backgroundColor: Colors.white,
                  radius: 70.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Kocaeli Üniversitesi\nBaşvuru Platformu',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold, fontFamily: 'roboto-bold'),
                ),
                SizedBox(height: 50),
                // Öğrenci Login sayfasına yönlendirme
                ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green[600]),
                      overlayColor: MaterialStateProperty.all(Colors.green[200]),
                      elevation: MaterialStateProperty.all(3.0)
                    ),
                    onPressed: () {
                      // Öğrenci Giriş Paneline git
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => StudentLogin() )
                      );
                    },
                    icon: Icon(Icons.person),
                    label: Text('Öğrenci Girişi')
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green[600]),
                        overlayColor: MaterialStateProperty.all(Colors.green[200]),
                        elevation: MaterialStateProperty.all(3.0)
                    ),
                    onPressed: () {
                      // Admin Giriş Paneline git
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AdminLogin() )
                      );
                    },
                    icon: Icon(Icons.account_balance_outlined),
                    label: Text('Yönetici Girişi')
                ),

              ],
            ),
          )
        ],
      )
    );
  }
}
