import 'package:flutter/material.dart';
import 'package:smartMirror/services/auth.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Home> {
  bool status = true;

  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff424242),
      appBar: AppBar(
        backgroundColor: Color(0xff1b1b1b),
        title: Text("Home"),
        centerTitle: true,
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
                    side: BorderSide(color: Color(0xffd3d3d3))),
                icon: Icon(
                  Icons.list,
                  color: Colors.green,
                ),
                color: Color(0xffe3e3e3),
                label: Text("TO-DO List"),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton.icon(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Color(0xffd3d3d3))),
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.green,
                ),
                color: Color(0xffe3e3e3),
                label: Text("Set Location"),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton.icon(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Color(0xffd3d3d3))),
                // shape: ,
                icon: Icon(
                  Icons.art_track,
                  color: Colors.green,
                ),
                color: Color(0xffe3e3e3),
                label: Text("News Preferance"),
                onPressed: () {},
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton.icon(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Color(0xffd3d3d3))),
                // shape: ,
                icon: Icon(
                  Icons.do_not_disturb,
                  // color: Colors.green,
                ),
                color: Color(0xffe3e3e3),
                label: Text("Extra"),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton.icon(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Color(0xffd3d3d3))),
                icon: status
                    ? Icon(Icons.brightness_7, color: Colors.white)
                    : Icon(Icons.brightness_3, color: Colors.grey[200]),
                splashColor: !status ? Colors.green[300] : Colors.orange[300],
                color: !status ? Colors.red[900] : Colors.green[900],
                label: Text("ON/OFF"),
                onPressed: () {
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
                    side: BorderSide(color: Color(0xffd3d3d3))),
                // shape: ,
                icon: Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                color: Color(0xffe3e3e3),
                label: Text("Log out"),
                onPressed: () async {
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
