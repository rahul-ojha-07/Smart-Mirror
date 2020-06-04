import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartMirror/services/database.dart';


class News extends StatefulWidget {
  // final String data;
  final DatabaseService dbs;
  News({this.dbs});
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {

  // DatabaseService dbs = DatabaseService(uid:UserId.uid);
  
    List<String> dropDownItems = [
    'Select...',
    "International",
    "Bollywood",
    "Sports",
    "Fashion",
    "Technology"
  ];

  String dropDownValue = "Select...";

  String setDropDownValue(){
    dropDownValue = dropDownItems.contains(widget.dbs.currentUserData['newsPreference'] ?? "hgk") ? widget.dbs.currentUserData['newsPreference'] : 'Select...';
    return dropDownValue; 
  }

  
  // dropDownValue = dropDownItems.contains(widget.data)? widget.data :'Select...';
  
  
  Widget build(BuildContext context) {
  
    setDropDownValue();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News Preferences",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff212121),
      ),
      body: Center(
        child: Container(
          // color: Color(0xfff1f1f1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height:150.0, child:Image.asset(_getImageName(dropDownValue),fit: BoxFit.fill,)),
              DropdownButton(
                value: dropDownValue,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 36,
                elevation: 8,
                style: TextStyle(
                  color: Color(0xff212121),
                  fontFamily: 'OpenSans', 
                  fontSize: 36,
                ),
                onChanged: (newValue) async{
                  setState(() {
                    widget.dbs.currentUserData['newsPreference'] = newValue;
                  });
                  await widget.dbs.updateNews(newValue);
                  await widget.dbs.updateData();
                },
                items: dropDownItems.map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle( 
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }


  String _getImageName(String newsType){
    var imageMap = {
       'Select...':'assets/images/news.ico',
    "International":'assets/images/world.ico',
    "Bollywood":'assets/images/movies.ico',
    "Sports":'assets/images/sports.ico',
    "Fashion":'assets/images/fashion.ico',
    "Technology":'assets/images/tech.ico'
    };

    return imageMap[newsType];
  }


}
