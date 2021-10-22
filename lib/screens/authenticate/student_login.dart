import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/shared/constants.dart';
import 'package:kou_basvuru_platform/shared/loading.dart';
import 'package:kou_basvuru_platform/services/auth.dart';
import 'package:kou_basvuru_platform/screens/authenticate/registration.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({Key? key}) : super(key: key);

  @override
  _StudentLoginState createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {

  // Creating our AuthService instance
  final AuthService _auth = AuthService();
  // For validating our form fields we generate a GlobalKey, type of FormState
  final _formKey = GlobalKey<FormState>();

  // Editing Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    // region Text Fields / Buttons

    // Email Field
    final emailField = TextFormField(
        obscureText: false,
        decoration: textInputDecoration.copyWith(
            hintText: 'xxxxxxxxx@kocaeli.edu.tr',
            labelText: 'E-mail',
            suffixIcon: const Icon(Icons.mail)
        ),
        autocorrect: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (val) =>
        ((val != null && val.isEmpty) || !val!.endsWith('@kocaeli.edu.tr'))
            ?
        'Lütfen kurumsal E-posta adresinizi giriniz' : null,
        onSaved: (value)
        {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next
    );


    // Password Field
    final passwordField = TextFormField(
        obscureText: true,
        decoration: textInputDecoration.copyWith(
            labelText: 'Şifre',
            suffixIcon: const Icon(Icons.vpn_key)
        ),
        autocorrect: false,
        controller: passwordController,
        validator: (val) => ((val != null && val.isEmpty) || val!.length < 11) ?
        "Şifrenizi boş geçemezseniz" : null,
        onSaved: (value)
        {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done
    );


    // endregion


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            // color: Colors.blueGrey,    // TODO : Silinecek propetry
            margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/kou2.png",
                    width: 125,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Öğrenci Girişi',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontFamily: 'roboto-bold'),
                  ),
                  const SizedBox(height: 25),
                  emailField,
                  // TextField(
                  //     obscureText: false,
                  //     decoration: textInputDecoration.copyWith(
                  //         labelText: 'E-mail Giriniz',
                  //         suffixIcon: Icon(Icons.person)
                  //     )
                  // ),
                  const SizedBox(height: 35),
                  passwordField,
                  // TextField(
                  //     obscureText: true,
                  //     decoration: textInputDecoration.copyWith(
                  //         labelText: 'Şifre Giriniz',
                  //         suffixIcon: Icon(Icons.password)
                  //     )
                  // ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    textDirection: TextDirection.ltr,
                    children: <Widget>[

                      // Giriş Yap
                      ElevatedButton(
                        style: buttonStyle.copyWith(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                            fixedSize: MaterialStateProperty.all(const Size.fromWidth(120))
                        ),
                        onPressed: () {     // TODO: async fonksiyon olacak  veritabanından bilgi çekilip kontrol edilecek

                          // Is everything valid according to our regulations in our fields?
                          if(_formKey.currentState!.validate())
                          {
                            print('valid info');
                          }


                        },
                        child: const Text("Giriş",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      // Şifremi Unuttum
                      ElevatedButton(
                        style: buttonStyle.copyWith(
                            backgroundColor: MaterialStateProperty.all(Colors.red[700]),
                            fixedSize: MaterialStateProperty.all(const Size.fromWidth(140))
                        ),
                        onPressed: () {
                          print('Şifremi unuttum');
                        },
                        child: const Text("Şifremi Unuttum",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 15),
                  // Kayıt Ol => registration.dart
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Üye değil misiniz? '),
                      GestureDetector(
                        onTap: () {

                          print("Üye ol Ekranına gider");
                          // Go to the registration screen
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Registration())
                          );
                        },
                        child: const Text(
                            'Kayıt olun',
                            style: TextStyle(
                              fontFamily: 'roboto-bold', fontSize: 15, color: Colors.blue
                            ) ,
                        ),
                      )
                    ],
                  )


                ],
              ),
            ),

          ),



        ),
      ),
    );



  }
}
