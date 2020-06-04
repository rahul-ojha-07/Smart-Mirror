import 'package:flutter/material.dart';


class AddTODO extends StatefulWidget {
  final List lst;

  AddTODO({this.lst});

  @override
  _AddTODOState createState() => _AddTODOState();
}

class _AddTODOState extends State<AddTODO> {
  var newItem = {'checked': false, "description": ""};

  @override
  Widget build(BuildContext context) {
    List lst = widget.lst;

    return Scaffold(
        backgroundColor: Color(0xffd3d3d3),
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
        body: Center(
          child: Card(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    onChanged: (value) {
                      newItem['description'] = value;
                    },
                    decoration: InputDecoration(),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                      onPressed: () async {
                        widget.lst.add(newItem);
                        
                        Navigator.pop(
                          context,lst
                        );
                      },
                      child: Text(
                        "Add Task",
                      ),
                    )
                ],
              ),
            ),
          ),
        ));
  }
}

class EditTODO extends StatefulWidget {
  final String task;

  EditTODO({this.task});

  @override
  _EditTODOState createState() => _EditTODOState();
}

class _EditTODOState extends State<EditTODO> {


  
  @override
  Widget build(BuildContext context) {
  final taskEdit = TextEditingController(text: widget.task);
    return Scaffold(
        backgroundColor: Color(0xffd3d3d3),
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
        body: Center(
          child: Card(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: taskEdit,
                    onChanged: (value) {
                      print(value);
                    },
                    decoration: InputDecoration(),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                      onPressed: () async {
                        // lst.add(newItem);
                        // await DatabaseService(uid: UserId.uid).addNewTODO(lst);
                        Navigator.pop(
                          context,taskEdit.text
                        );
                      },
                      child: Text(
                        "Add Task",
                      ),
                    )
                ],
              ),
            ),
          ),
        ));
  }
}
