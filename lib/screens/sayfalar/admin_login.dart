import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/models/my_user.dart';
import 'package:kou_basvuru_platform/models/user_Model.dart';
import 'package:kou_basvuru_platform/screens/home/Admin_Home.dart';
import 'package:kou_basvuru_platform/screens/home/home.dart';
import 'package:kou_basvuru_platform/services/fake_auth.dart';
import 'package:kou_basvuru_platform/services/firebase_auth_servise.dart';
import 'package:kou_basvuru_platform/shared/constants.dart';
import 'package:kou_basvuru_platform/shared/loading.dart';
import 'package:kou_basvuru_platform/services/auth.dart';
import 'package:kou_basvuru_platform/screens/sayfalar/registration.dart';
import 'package:kou_basvuru_platform/widget/social_login_button.dart';
import 'package:provider/provider.dart';
enum FormType{Register,Login}
class AdminLogin extends StatefulWidget {
  final AuthService auth ;
  const AdminLogin({Key? key,required this.auth}) : super(key: key);

  @override
  AdminLoginState createState() => AdminLoginState();
}

class AdminLoginState extends State<AdminLogin> {
void bildirim(String hata1,hata2)
{
  showDialog(context: context, builder: (context) {
    return AlertDialog(backgroundColor: Colors.green[100],
      title: Text(hata1),
      content: Text(hata2),
      elevation: 20,

      actions: <Widget>[
        FlatButton(
          child: Text("Tamam"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
  );
}



  // Editing Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String?  _email , _sifre;
  late String _buttonText,_linkText;
  var _formType =FormType.Login;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    degistir()
    {
      setState(() {
        _formType= _formType==FormType.Login ? FormType.Register : FormType.Login;
      });
    }
    _formSubmit(BuildContext context) async {
      // Is everything valid according to our regulations in our fields?
      if (_formKey.currentState!.validate()) {
        print('valid info');
      }
      _formKey.currentState!.save();
      print(_email);
      print(_sifre);
      final _userModel = Provider.of<userModel>(context, listen: true);
      String _girisYapilanKullanici = "Admin";
      if (_formType == FormType.Login) {
        if (await _userModel.signInWithEmailAndPassword(
            _email!, _sifre!, _girisYapilanKullanici) != null) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AdminHome()));
        }
        else {
          bildirim("Oturum Açma Hatası", "Geçersiz Kullanıcı Adı veya Şifre");
        }
      }
      else {
        if (await _userModel.createUserWithEmailAndPassword(
            _email!, _sifre!, _girisYapilanKullanici) != null) {
          MyUser olusturulanUser;
          olusturulanUser = await _userModel.user;
          print("Kayıt Oluşturan User:" + olusturulanUser.userID.toString());
          bildirim("", "Kullanıcı Başarıyla Oluşturuldu");
        }
        else {
          bildirim("Kullanıcı Oluşturma Hatası", "Geçersiz Kullanıcı Adı veya Şifre");
        }
      }
    }
    _buttonText= _formType==FormType.Login? "GİRİŞ YAP" : "KAYIT OL";
    _linkText= _formType==FormType.Login? "Hesabınız Yok Mu? Kayıt Olun" : "Hesabınız Var Mı? Giriş Yapın";

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
          _email=value.toString();
        },
        textInputAction: TextInputAction.next
    );
    //Password Field
    final passwordField = TextFormField(
        obscureText: true,
        decoration: textInputDecoration.copyWith(
            labelText: 'Şifre',
            suffixIcon: const Icon(Icons.vpn_key)
        ),
        autocorrect: false,
        controller: passwordController,
        validator: (val) => ((val != null && val.isEmpty) || val!.length < 6) ?
        "Şifrenizi boş geçemezseniz" : null,
        onSaved: (value)
        {
          passwordController.text = value!;
          _sifre=value.toString();
        },
        textInputAction: TextInputAction.done
    );


    // endregion


    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Center(
        child: SingleChildScrollView(
          child: Container(

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
                    'Admin Girişi',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontFamily: 'roboto-bold'),
                  ),
                  const SizedBox(height: 25),
                  emailField,
                  const SizedBox(height: 35),
                  passwordField,
                  const SizedBox(height: 35),

                  SocailLoginButton( textColor: Colors.white,
                    buttonColor:Colors.green,
                    buttonText: _buttonText,
                    buttonIcon: Icon(null),
                    onPress:()=> _formSubmit(context),),

                  FlatButton(onPressed: ()=>degistir(), child: Text(_linkText)),

                ],
              ),
            ),

          ),



        ),
      ),
    );



  }




}
