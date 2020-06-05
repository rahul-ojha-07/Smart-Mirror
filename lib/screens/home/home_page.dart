import 'package:flutter/material.dart';

import 'package:smartMirror/services/database.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// for database
import 'package:smartMirror/utils/user_id.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  
  // bool status = true;
  
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
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: loading
              ? SpinKitFadingCube(
                  color: Colors.black,
                  size: 20,
                )
              : IconButton(
                  
                  icon: Icon(Icons.power_settings_new,size:200,color: !status ? Colors.red[300] : Colors.green[300],),
                  splashColor: !status ? Colors.green[300] : Colors.orange[300],
                  
                  
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
      ),
    );
  }
}
