import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/shared/constants.dart';
import 'package:kou_basvuru_platform/services/auth.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

  // Creating our AuthService instance
  final AuthService _auth = AuthService();
  // For validating our form fields we generate a GlobalKey, type of FormState
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    // region Benim Kod

    // return Container(
    //   decoration: BoxDecoration(color: Colors.green[200]),
    //   child: Text('Admin Panel'),
    // );

    // endregion

    // region Yakup KOD
    // TODO : FormField leri birleştir Form widget altında (Tekrardan diz)
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/kou2.png",
                    width: 125,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                      'Yönetici Girişi',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontFamily: 'roboto-bold'),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: SizedBox(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 350,
                      // E-posta TextField
                      child: TextField(
                        obscureText: false,
                        decoration: textInputDecoration.copyWith(
                          labelText: 'E-mail Giriniz'
                        )
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 350,
                      // Şifre TextField
                      child: TextField(
                        obscureText: true,
                        decoration: textInputDecoration.copyWith(
                            labelText: 'Şifre Giriniz'
                        )
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 350,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text("Giriş"),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(color: Colors.red),
                          ),
                          Expanded(
                            flex: 4,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.red.shade700),
                              ),
                              onPressed: () {},
                              child: const Text("Şifremi Unuttum"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // endregion


  }
}
