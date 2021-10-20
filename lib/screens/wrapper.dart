import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/screens/authenticate/authenticate.dart';
import 'package:kou_basvuru_platform/screens/home/home.dart';
import 'package:kou_basvuru_platform/shared/loading.dart';
import 'package:kou_basvuru_platform/models/my_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Accesing user data from the Provider (We're holding the UID of the logged in user)
    final user = Provider.of<User?>(context);


    // if the user is null coming from the Provider
    // The user is signed out or didn't sign in at all
    if(user == null) {
      return Authenticate();
    }
    // if the user variable isn't null then the user signed in
    // therefore, letting the valid user navigate to the home page
    else {
      return Home();
    }

  }
}
