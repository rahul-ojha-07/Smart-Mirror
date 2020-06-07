import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smartMirror/screens/home/future_page.dart';
import 'package:smartMirror/screens/home/home_page.dart';
import 'package:smartMirror/screens/home/location_screen.dart';
import 'package:smartMirror/screens/home/news_screen.dart';
import 'package:smartMirror/screens/home/todo_screen.dart';
import 'package:smartMirror/services/auth.dart';
import 'package:smartMirror/services/database.dart';
import 'package:smartMirror/utils/user_id.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int index = 2;
  AuthService _auth = AuthService();
  bool logout = false;

  Future<void> _getSimpleDialog() async {
    try{
      await showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Do you really want to LogOut ?"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context,true);
              },
              child: Text("Yes"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context,false);
              },
              child: Text("No"),
            )
          ],
        );
      }
    ).then((value) {
      setState(() {
        
        logout = value ?? false;
      });
    });
    }catch(e){
      print(e.toString());
    }
    
  }

  DatabaseService dbs = DatabaseService(uid: UserId.uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xff00BFA6),
        title: Text(_getTitle(index)),
        centerTitle: true,
        actions: <Widget>[
          // item
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () async {
              await _getSimpleDialog();
              if (logout){
                await _auth.signOut(UserId.uid).whenComplete(() {
                UserId.uid = '';
              });
              }
              
            },
          ),
        ],
      ),
      body: _getBody(index, dbs),
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(
            Icons.format_list_bulleted,
            size: 25,
            color: index == 0 ? Color(0xff00BFA6) : Colors.black,
          ),
          Icon(
            Icons.location_on,
            size: 25,
            color: index == 1 ? Color(0xff00BFA6) : Colors.black,
          ),
          Icon(
            Icons.home,
            size: 25,
            color: index == 2 ? Color(0xff00BFA6) : Colors.black,
          ),
          Icon(
            Icons.art_track,
            size: 25,
            color: index == 3 ? Color(0xff00BFA6) : Colors.black,
          ),
          Icon(
            Icons.not_interested,
            size: 25,
            color: index == 4 ? Color(0xff00BFA6) : Colors.black,
          ),
        ],
        index: 2,
        color: Colors.white,
        backgroundColor: Colors.white,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
      ),
    );
  }

  Widget _getBody(int index, DatabaseService dbs) {
    var bodyMap = {
      0: TODO(),
      1: Location(),
      2: Home(),
      3: News(dbs: dbs),
      4: SomeFutureTask(),
    };
    return bodyMap[index];
  }

  String _getTitle(int index) {
    var bodyMap = {
      0: "TO-DO",
      1: "Location",
      2: "Home",
      3: "News",
      4: "Some Future Task",
    };
    return bodyMap[index];
  }
}
