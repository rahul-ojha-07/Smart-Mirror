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
    "Business",
    "Health",
    "Sports",
    "Science",
    "Technology"
  ];

  @override
  void initState() { 
    super.initState();
    widget.dbs.updateData().then((value) { 
      setState((){
        dropDownValue = value['newsPreference']??"Select...";
        
      });
    });
  }
  String dropDownValue = "Select...";

  

  
  // dropDownValue = dropDownItems.contains(widget.data)? widget.data :'Select...';
  
  
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.white,
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
                    dropDownValue = newValue;
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
    "Business":'assets/images/business.png',
    "Health":'assets/images/health.png',
    "Sports":'assets/images/sports.ico',
    "Science":'assets/images/science.png',
    "Technology":'assets/images/tech.ico'
    };

    return imageMap[newsType];
  }


}
