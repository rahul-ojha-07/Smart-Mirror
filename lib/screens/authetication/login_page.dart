import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartMirror/screens/loading_screen.dart';
import 'package:smartMirror/services/auth.dart';
import 'package:smartMirror/utils/constants.dart';
import 'package:smartMirror/utils/user_id.dart';

class LoginScreen extends StatefulWidget {
  final Function toggleView;
  LoginScreen({this.toggleView});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;

  final _loginFormKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();

  String mail;
  String psw;
  bool hidePassword = true;
  bool autoValidate = false;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Color(0xff00e5ff),
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.dark,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    Container(
                      height: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 20.0,
                      ),
                      child: Card(
                        margin: EdgeInsets.all(10),
                        // borderOnForeground: true,
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 80, 10.0, 160),
                          child: Form(
                            key: _loginFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'OpenSans',
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                _buildEmailTF(),
                                SizedBox(height: 10.0),
                                _buildPasswordTF(),
                                SizedBox(height: 5.0),
                                Center(
                                  child: Text(
                                    error,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                                // SizedBox(height: 10.0),
                                _buildLoginBtn(),
                                SizedBox(height: 20.0),
                                _buildSignupBtn(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          validator: (text) {
            if (text.isEmpty) {
              return "Email Can Not be empty!";
            } else {
              mail = text;
              return null;
            }
          },
          autovalidate: autoValidate,
          style: TextStyle(
            color: Color(0xff212121),
            fontFamily: 'OpenSans',
            fontSize: 15.0,
          ),
          decoration: InputDecoration(
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            )),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xff00e5ff),
              width: 2,
            )),
            fillColor: Colors.white54,
            filled: true,
            helperText: ' ',
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xff212121),
            ),
            hintText: 'Enter your Email',
            hintStyle: kHintTextStyle,
            errorStyle: TextStyle(
              color: Colors.red[900],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topRight,
      //     end: Alignment.bottomCenter,
      //     // colors: [
      //     //   Color(0xFF73AEF5),
      //     //   Color(0xFF61A4F1),
      //     //   Color(0xFF478DE0),
      //     //   Color(0xFF398AE5),
      //     // ],
      //     colors: [
      //       // Colors.grey[500],
      //       // Colors.grey[600],
      //       // Colors.white,
      //       // Colors.grey[800],
      //       Color(0xffE040FB),
      //       Color(0xffFF5252),
      //       Color(0xff76FF03),
      //       Color(0xff00e5ff),
      //     ],
      //     stops: [1.0, 2.0, 3.0, 4.0],
      //   ),
      // ),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          if (_loginFormKey.currentState.validate()) {
            setState(() {
              loading = true;
            });
            dynamic result = await _auth.signInUser(mail, psw);

            if (result == null) {
              print("Error sign in");
              setState(() {
                error = "Email/Password is Wrong";
                loading = false;
              });
            } else {
              print("signed in");
              UserId.uid = result.uid;
              print(result.uid);

              print(UserId.uid);
            }

            print("$mail and $psw");
          } else {
            setState(() {
              autoValidate = true;
            });
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xff00e5ff),
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        TextFormField(
          obscureText: hidePassword,
          keyboardType: TextInputType.visiblePassword,
          autovalidate: autoValidate,
          validator: (psw) {
            if (psw.isEmpty) {
              return "Password can not be empty";
            } else {
              this.psw = psw;
              return null;
            }
          },
          style: TextStyle(
            color: Color(0xff212121),
            fontFamily: 'OpenSans',
            fontSize: 15.0,
          ),
          decoration: InputDecoration(
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            )),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xff00e5ff),
              width: 2,
            )),
            helperText: ' ',
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.all(10.0),
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xff212121),
              size: 29,
            ),
            suffixIcon: IconButton(
                color: Color(0xff212121),
                icon: Icon(
                  hidePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                }),
            hintText: 'Enter your Password',
            hintStyle: kHintTextStyle,
            errorStyle: TextStyle(
              color: Colors.red[900],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        widget.toggleView();
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Color(0xff212121),
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Register',
              style: TextStyle(
                color: Color(0xff00e5ff),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Padding(
//                           padding:
//                               EdgeInsets.symmetric(horizontal: 0, vertical: 20),
//                           child: Material(
//                             borderRadius: BorderRadius.circular(10.0),
//                             color: Colors.white,
//                             elevation: 2,
//                             shadowColor: Colors.blueGrey,
//                             child: TextFormField(
//                               validator: (str) {
//                                 if (str.isEmpty) {
//                                   return "Not";
//                                 } else {
//                                   return null;
//                                 }
//                               },decoration: InputDecoration(
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   borderSide: BorderSide(
//                                       width: 0,
//                                       color: Colors.white,
//                                       style: BorderStyle.none),
//                                 ),
//                                 hoverColor: Colors.white,
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   borderSide: BorderSide(
//                                       width: 0,
//                                       color: Colors.white,
//                                       style: BorderStyle.none),
//                                 ),
//                                 border: UnderlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   borderSide: BorderSide(
//                                       width: 0,
//                                       color: Colors.white,
//                                       style: BorderStyle.none),
//                                 ),
//                                 fillColor: Colors.white,
//                                 filled: true,
//                                 contentPadding: EdgeInsets.all(20.0),
//                               ),
//                               cursorColor: Color(0XFFFFCC00),
//                               style: TextStyle(
//                                 color: Colors.blueAccent,
//                               ),
//                             ),
//                           ),
//                         ),
