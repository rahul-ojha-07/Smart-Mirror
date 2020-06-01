import 'package:flutter/material.dart';
import 'package:smartMirror/pages/home_page.dart';
import 'package:smartMirror/pages/login_page.dart';
import 'package:smartMirror/pages/menu_page.dart';
import 'package:smartMirror/pages/signup_page.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/home',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => Home(),
        '/menu': (context) => Menu(),
        '/signup': (context) => SignupScreen(),
      },
    ),
  );
}

/****
 * todo list
 * place 
 * news 
 * 
 */


// firease_auth
// cloud_firestore
