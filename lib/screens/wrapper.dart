import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartMirror/models/user.dart';
import 'package:smartMirror/screens/authetication/authenticate.dart';
import 'package:smartMirror/screens/home/navigation_page.dart';
import 'package:smartMirror/utils/user_id.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // get the state of the user if null then logged out else logged in
    final user = Provider.of<User>(context);
    

    // return either home or login screen based on the user
    if (user == null) {
      return Authenticate();
    } else {
      UserId.uid = user.uid;
      
      return NavigationPage();
    }
  }
}
