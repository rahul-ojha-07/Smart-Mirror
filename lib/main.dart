import 'package:flutter/material.dart';
import 'package:smartMirror/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:smartMirror/services/auth.dart';
import 'package:smartMirror/models/user.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       initialRoute: '/home',
//       routes: {
//         '/login': (context) => LoginScreen(),
//         '/home': (context) => Home(),
//         '/menu': (context) => Menu(),
//         '/signup': (context) => SignupScreen(),
//       },
//     ),
//   );
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
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
