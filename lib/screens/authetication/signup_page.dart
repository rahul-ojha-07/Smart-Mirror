import 'package:flutter/material.dart';
import 'package:smartMirror/screens/loading_screen.dart';
import 'package:smartMirror/services/auth.dart';
import 'package:smartMirror/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:smartMirror/utils/user_id.dart';

class SignupScreen extends StatefulWidget {
  final Function toggleView;
  SignupScreen({this.toggleView});
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool autoValidate = false;
  bool loading = false;
  final _signUpKey = GlobalKey<FormState>();
  AuthService _auth = AuthService();

  // Person person = Person();
  String email;
  String password;
  String name;

  Widget _buildNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          autovalidate: autoValidate,
          validator: (name) {
            if (name.isEmpty) {
              return "Name Can Not be empty!";
            } else {
              this.name = name;
              return null;
            }
          },
          style: TextStyle(
            color: Color(0xff212121),
            fontFamily: 'OpenSans',
            fontSize: 15.0,
          ),
          decoration: InputDecoration(
            helperText: ' ',
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Color(0xffff79ff),
              ),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 2,
                color: Colors.red[900],
              ),
            ),
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.all(5.0),
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xff212121),
            ),
            hintText: 'Enter Full Name',
            hintStyle: kHintTextStyle,
            errorStyle: TextStyle(
              color: Colors.red[900],
            ),
          ),
        ),
      ],
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
          autovalidate: autoValidate,
          validator: (email) {
            if (email.isEmpty) {
              return "Email Can Not be empty!";
            } else {
              this.email = email;
              return null;
            }
          },
          style: TextStyle(
            color: Color(0xff212121),
            fontFamily: 'OpenSans',
            fontSize: 15.0,
          ),
          decoration: InputDecoration(
            helperText: ' ',
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            )),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xffff79ff),
              width: 2,
            )),
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.all(5.0),
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
            } else if (psw.length < 6) {
              return "Password length must be greater than 6 characters";
            } else {
              password = psw;
              return null;
            }
          },
          style: TextStyle(
            color: Color(0xff212121),
            fontFamily: 'OpenSans',
            fontSize: 15.0,
          ),
          decoration: InputDecoration(
            helperText: ' ',
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            )),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xffff79ff),
              width: 2,
            )),
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.all(5.0),
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xff212121),
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

  bool hideCofirmPassword = true;

  Widget _buildConfirmPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirm Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        TextFormField(
          obscureText: hideCofirmPassword,
          keyboardType: TextInputType.visiblePassword,
          autovalidate: autoValidate,
          validator: (psw) {
            if (psw.isEmpty) {
              return "this field can not be empty";
            } else if (psw != password) {
              return "Password do not match";
            } else {
              return null;
            }
          },
          style: TextStyle(
            color: Color(0xff212121),
            fontFamily: 'OpenSans',
            fontSize: 15.0,
          ),
          decoration: InputDecoration(
            helperText: ' ',
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            )),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xffff79ff),
              width: 2,
            )),
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.all(5.0),
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xff212121),
            ),
            suffixIcon: IconButton(
                color: Color(0xff212121),
                icon: Icon(
                  hideCofirmPassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    hideCofirmPassword = !hideCofirmPassword;
                  });
                }),
            hintText: 'Re-Enter your Password',
            hintStyle: kHintTextStyle,
            errorStyle: TextStyle(
              color: Colors.red[900],
            ),
          ),
        ),
      ],
    );
  }

  String error = '';

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          if (_signUpKey.currentState.validate()) {
            setState(() {
              loading = true;
            });
            dynamic result = await _auth.signUpUser(name, email, password);
            UserId.uid = result.uid;
            print(result.uid);

            print(UserId.uid);

            if (result == null) {
              setState(() {
                error = 'please supply a valid email';
                loading = false;
              });
            }
            print('$name  $email  $password');
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
        color: Color(0xffff79ff),
        child: Text(
          'REGISTER',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSigninBtn() {
    return GestureDetector(
      onTap: () {
        widget.toggleView();
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an Account? ',
              style: TextStyle(
                color: Color(0xff212121),
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Log In',
              style: TextStyle(
                color: Color(0xffff79ff),
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
          resizeToAvoidBottomPadding: false,
            backgroundColor: Color(0xffff79ff),
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.dark,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.0,
                          vertical: 20.0,
                        ),
                        child: SizedBox(
                          child: Card(
                            margin: EdgeInsets.all(10),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Form(
                                key: _signUpKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Register',
                                      style: TextStyle(
                                        color: Color(0xff212121),
                                        fontFamily: 'OpenSans',
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10.0),
                                    _buildNameTF(),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    _buildEmailTF(),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    _buildPasswordTF(),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    _buildConfirmPasswordTF(),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    _buildRegisterBtn(),
                                    _buildSigninBtn(),
                                    Text(
                                      error,
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
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
}
