import 'package:flutter/material.dart';


class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {

  String dropDownValue = 'Select...';

  List<String> dropDownItems = ["International","Bollywood","Sports","Faishon","Technology"];


  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TO-DO",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff212121),
      ),
      body: Center(child: Text("News Page")),
      
    );
  }
  
}