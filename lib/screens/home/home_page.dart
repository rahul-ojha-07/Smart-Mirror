import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smartMirror/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        backgroundColor: Colors.grey[600],
      ),
      
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              // color: Colors.green[400],
              elevation: 0,
              onPressed: () {
                Navigator.pushNamed(context, '/menu');
              },
              child: Text("Menu Page"),
            ),
            RaisedButton(
              // color: Colors.green[400],
              elevation: 0,
              onPressed: () async {
                await _auth.signOut();
              },
              child: Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }
}
