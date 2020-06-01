import 'package:flutter/material.dart';
import 'package:smartMirror/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:smartMirror/utils/person.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool autoValidate = false;
  final _signUpKey = GlobalKey<FormState>();

  Person person = Person();

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
              person.name = name;
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
              Icons.email,
              color: Colors.white,
            ),
            hintText: 'Enter Full Name',
            hintStyle: kHintTextStyle,
            errorStyle: TextStyle(
              color: Colors.amber,
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
              person.email = email;
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
            } else if (psw.length < 6) {
              return "Password length must be greater than 6 characters";
            } else {
              person.password = psw;
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
            } else if (psw != person.password) {
              return "Password do not match";
            } else {
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
              color: Colors.amber,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          if (_signUpKey.currentState.validate()){
            print('${person.name}  ${person.email}  ${person.password}');
          }else {
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
          'REGISTER',
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

  Widget _buildSigninBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign In',
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
    return Scaffold(
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
                    vertical: 40.0,
                  ),
                  child: Form(
                    key: _signUpKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
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