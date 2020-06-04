import 'package:flutter/material.dart';
import 'package:smartMirror/screens/home/news_screen.dart';

import 'package:smartMirror/services/auth.dart';
import 'package:smartMirror/services/database.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// for database
import 'package:smartMirror/utils/user_id.dart';

class Home extends StatefulWidget {
  final DatabaseService dbs;
  Home({this.dbs});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // bool status = true;
  AuthService _auth = AuthService();
  DatabaseService dbs = DatabaseService(uid: UserId.uid);
  bool loading = true;
  bool status = true;
  @override
  void initState() {
    super.initState();
    setState(() {
      dbs.updateData().then((value) {
        setState(() {
          status = value['mirrorStatus'];
          loading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // initState();
    // _assignStatus();
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
                onPressed: () async {
                  await Navigator.pushNamed(context, '/location')
                      .then((value) async {
                    if (value != null) {
                      await dbs.updateLocation(value).then((value) async {
                        await dbs.updateData();
                      });
                    }
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
                    // Navigator.pushNamed(context, '/news');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => News(dbs: dbs),
                        ));
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
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: loading
                  ? SpinKitFadingCube(
                      color: Colors.black,
                    )
                  : RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Color(0xff121212))),
                      icon: status
                          ? Icon(Icons.brightness_7, color: Colors.white)
                          : Icon(Icons.brightness_3, color: Colors.grey[200]),
                      splashColor:
                          !status ? Colors.green[300] : Colors.orange[300],
                      color: !status ? Colors.red[900] : Colors.green[900],
                      label: Text(
                        "ON/OFF",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        await dbs.toggleMirrorStatus();

                        dbs.updateData();
                        setState(() {
                          status = !status;
                          loading = false;
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
