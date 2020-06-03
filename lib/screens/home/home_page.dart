import 'package:flutter/material.dart';
import 'package:smartMirror/models/person.dart';
import 'package:smartMirror/screens/home/todo_screen.dart';
import 'package:smartMirror/services/auth.dart';
import 'dart:async';
// for database
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartMirror/services/database.dart';
import 'package:provider/provider.dart';
import 'package:smartMirror/utils/user_id.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool status = true;

  AuthService _auth = AuthService();
  
  bool test = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      appBar: AppBar(
        backgroundColor: Color(0xff121212),
        title: Text("Home"),
        centerTitle: true,
        actions: [
          // item
        ],
      ),
      body: Center(
    child: GridView.count(
      primary: false,
      padding: EdgeInsets.all(10.0),
      crossAxisCount: 2,
      // maxCrossAxisExtent: 0.0,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      children: <Widget>[
        // SizedBox(height:10.0),
        // SizedBox(height:10.0),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton.icon(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Color(0xff121212))),
            icon: Icon(
              Icons.list,
              color: Colors.green,
            ),
            color: Color(0xff121212),
            label: Text(
              "TO-DO List",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              setState(() {
                Navigator.pushNamed(context, '/todo');
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton.icon(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Color(0xff121212))),
            icon: Icon(
              Icons.edit_location,
              color: Colors.green,
            ),
            color: Color(0xff121212),
            label: Text(
              "Set Location",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              setState(() {
                Navigator.pushNamed(context, '/location');
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton.icon(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Color(0xff121212))),
            // shape: ,
            icon: Icon(
              Icons.art_track,
              color: Colors.green,
            ),
            color: Color(0xff121212),
            label: Text(
              "News Preference",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              setState(() {
                Navigator.pushNamed(context, '/news');
              });
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton.icon(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Color(0xff121212))),
            // shape: ,
            icon: Icon(
              Icons.do_not_disturb,
              // color: Colors.green,
            ),
            color: Color(0xff121212),
            label: Text(
              "Extra",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton.icon(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Color(0xff121212))),
            icon: status
                ? Icon(Icons.brightness_7, color: Colors.white)
                : Icon(Icons.brightness_3, color: Colors.grey[200]),
            splashColor: !status ? Colors.green[300] : Colors.orange[300],
            color: !status ? Colors.red[900] : Colors.green[900],
            label: Text(
              "ON/OFF",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              print(_auth.getUid());
              // sleep2();
              Future.delayed(const Duration(seconds: 1), () {
                setState(() {
                  status = !status;
                });
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton.icon(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Color(0xff121212))),
            // shape: ,
            icon: Icon(
              Icons.person,
              color: Colors.green,
            ),
            color: Color(0xff121212),
            label: Text(
              "Log out",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              UserId.uid = '';
              await _auth.signOut();
            
              
            
            },
          ),
        ),
      ],
    ),
    ),
    );
  }
}
