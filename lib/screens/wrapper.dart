import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartMirror/models/user.dart';
import 'package:smartMirror/screens/home/home_page.dart';
import 'package:smartMirror/screens/authetication/login_page.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    

    // return either home or login screen
    if (user == null) {
      return LoginScreen();
    } else {
      return Home();
    }
  }
}
