import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/services/auth.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {


  // Creating our AuthService instance
  final AuthService _auth = AuthService();
  // For validating our form fields we generate a GlobalKey, type of FormState
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: Register sayfasının tasarımı
    return Scaffold(
      appBar: AppBar(
        title: Text('Kayıt İşlemi'),
        backgroundColor: Colors.green[400],
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green,
        child: Text('Üye olun'),

      ),
    );
  }
}
