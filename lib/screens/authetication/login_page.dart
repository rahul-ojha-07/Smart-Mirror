import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartMirror/screens/loading_screen.dart';
import 'package:smartMirror/services/auth.dart';
import 'package:smartMirror/utils/constants.dart';

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
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 0,
                color: Colors.grey[700],
                style: BorderStyle.none,
              ),
            ),
            hoverColor: Colors.grey[700],
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 0,
                color: Colors.grey[700],
                style: BorderStyle.none,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 0,
                color: Colors.grey[700],
                style: BorderStyle.none,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 0,
                color: Colors.grey[700],
                style: BorderStyle.none,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 0,
                color: Colors.grey[700],
                style: BorderStyle.none,
              ),
            ),
            fillColor: Colors.grey[700],
            filled: true,
            contentPadding: EdgeInsets.all(20.0),
            prefixIcon: Icon(
              Icons.email,
              color: Colors.white,
            ),
            hintText: 'Enter your Email',
            hintStyle: kHintTextStyle,
            errorStyle: TextStyle(
              color: Colors.amber,
            ),
          ),
        ),
      ],
    );
  }

  bool hidePassword = true;

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
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 0,
                color: Colors.grey[700],
                style: BorderStyle.none,
              ),
            ),
            hoverColor: Colors.grey[700],
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 0,
                color: Colors.grey[700],
                style: BorderStyle.none,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 0,
                color: Colors.grey[700],
                style: BorderStyle.none,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 0,
                color: Colors.grey[700],
                style: BorderStyle.none,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 0,
                color: Colors.grey[700],
                style: BorderStyle.none,
              ),
            ),
            fillColor: Colors.grey[700],
            filled: true,
            contentPadding: EdgeInsets.all(20.0),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            suffixIcon: IconButton(
                color: Colors.grey,
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
              color: Colors.amber,
            ),
          ),
        ),
      ],
    );
  }

  bool autoValidate = false;
  String error = '';
  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
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
              print(result);
              // Navigator.replace(context, oldRoute: , newRoute: null)
              // Navigator.pushNamed(context, '/menu');
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
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.grey[700],
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
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
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.dark,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          // colors: [
                          //   Color(0xFF73AEF5),
                          //   Color(0xFF61A4F1),
                          //   Color(0xFF478DE0),
                          //   Color(0xFF398AE5),
                          // ],
                          colors: [
                            Colors.grey[500],
                            Colors.grey[600],
                            Colors.grey[700],
                            Colors.grey[800],
                          ],
                          stops: [0.1, 0.4, 0.7, 0.9],
                        ),
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 120.0,
                        ),
                        child: Form(
                          key: _loginFormKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 30.0),
                              _buildEmailTF(),
                              SizedBox(height: 30.0),
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
                    )
                  ],
                ),
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
//                             color: Colors.grey[700],
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
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   borderSide: BorderSide(
//                                       width: 0,
//                                       color: Colors.grey[700],
//                                       style: BorderStyle.none),
//                                 ),
//                                 hoverColor: Colors.grey[700],
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   borderSide: BorderSide(
//                                       width: 0,
//                                       color: Colors.grey[700],
//                                       style: BorderStyle.none),
//                                 ),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   borderSide: BorderSide(
//                                       width: 0,
//                                       color: Colors.grey[700],
//                                       style: BorderStyle.none),
//                                 ),
//                                 fillColor: Colors.grey[700],
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
