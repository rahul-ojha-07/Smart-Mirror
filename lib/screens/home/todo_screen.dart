import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartMirror/models/person.dart';
import 'package:smartMirror/screens/home/todo_tasks.dart';
import 'package:smartMirror/screens/loading_screen.dart';
import 'package:smartMirror/services/auth.dart';
import 'package:smartMirror/services/database.dart';
import 'package:smartMirror/utils/constants.dart';
import 'package:smartMirror/utils/user_id.dart';

class TODO extends StatefulWidget {
  @override
  _TODOState createState() => _TODOState();
}

class _TODOState extends State<TODO> {
  @override
  Widget build(BuildContext context) {
    Future getLists() async {
      var firestore = Firestore.instance;

      QuerySnapshot qn = await firestore.collection("persons").getDocuments();

      return qn.documents;
    }

    List lst = [];

    final dbs = DatabaseService(uid: UserId.uid);

    // print(persons);

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
      body: FutureBuilder(
        future: getLists(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Loading(),
            );
          } else {
            for (var data in snapshot.data) {
              if (data['uid'] == UserId.uid) {
                lst = data['toDoList'];
                print(lst);
              }
            }
            // List<String> toDos = snapshot.data
            return lst.length == 0
                ? Center(child: Text("No Task At the Moment Add some Tasks."))
                : ListView.builder(
                    itemCount: lst.length,
                    itemBuilder: (_, index) {
                      return Card(
                        // color: Color(0xff212121),
                        margin: EdgeInsets.fromLTRB(8, 10, 8, 0),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Checkbox(
                                  value: lst[index]['checked'],
                                  onChanged: (s) {
                                    setState(() {
                                      lst[index]['checked'] =
                                          !lst[index]['checked'];
                                      dbs.addNewTODO(lst);
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  lst[index]['description'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'OpenSans',
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              Column(children: [
                                IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () async {
                                      setState(() {
                                        lst.remove(lst[index]);
                                      });
                                      await dbs.addNewTODO(lst);
                                    }),
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () async {
                                    String newDesc = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => EditTODO(
                                              task: lst[index]["description"],
                                            ),
                                          ),
                                        ) ??
                                        lst[index]["description"];
                                    setState(() {
                                      lst[index]["description"] = newDesc;
                                    });
                                    await dbs.addNewTODO(lst);
                                  },
                                ),
                              ]),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          List newlst = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTODO(
                    lst: lst,
                  ),
                ),
              ) ??
              lst;
          setState(() {
            lst = newlst;
          });
          // this.build(context);
          await DatabaseService(uid: UserId.uid).addNewTODO(newlst);
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff212121),
      ),
    );
  }
}
