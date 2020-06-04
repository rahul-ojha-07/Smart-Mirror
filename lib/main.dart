import 'package:flutter/material.dart';
import 'package:smartMirror/screens/authetication/login_page.dart';
import 'package:smartMirror/screens/authetication/signup_page.dart';
import 'package:smartMirror/screens/home/home_page.dart';
import 'package:smartMirror/screens/home/location_screen.dart';
import 'package:smartMirror/screens/home/news_screen.dart';
import 'package:smartMirror/screens/home/todo_screen.dart';
import 'package:smartMirror/screens/loading_screen.dart';
import 'package:smartMirror/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:smartMirror/services/auth.dart';
import 'package:smartMirror/models/user.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        routes: {
          '/login': (context) => LoginScreen(),
          '/home': (context) => Home(),
          '/signup': (context) => SignupScreen(),
          '/wrapper': (context) => Wrapper(),
          '/loading': (context) => Loading(),
          '/location': (context) => Location(),
          '/todo': (context) => TODO(),
          '/news': (context) => News(),
        },
        initialRoute: '/wrapper',
      ),
    );
  }
}

/****
 * todo list
 * place 
 * news 
 * 
 */

// firease_auth
// cloud_firestore
