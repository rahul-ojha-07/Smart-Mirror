import 'package:flutter/material.dart';
import 'package:smartMirror/screens/home/todo_tasks.dart';
import 'package:smartMirror/screens/loading_screen.dart';
import 'package:smartMirror/services/database.dart';
import 'package:smartMirror/utils/user_id.dart';

class TODO extends StatefulWidget {
  @override
  _TODOState createState() => _TODOState();
}

class _TODOState extends State<TODO> {
  final dbs = DatabaseService(uid: UserId.uid);
  List lst = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    dbs.updateData().then((value) {
      setState(() {
        lst = value['toDoList'] ?? [];
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(persons);

    return Scaffold(
      backgroundColor: Colors.white,
      body: loading
          ? Loading()
          : lst.length == 0
              ? Center(child: Text("No Task At the Moment Add some Tasks."))
              : ListView.builder(
                  itemCount: lst.length,
                  itemBuilder: (_, index) {
                    return Card(
                      color: Color(0xfff1f1f1),
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
                                  decoration: lst[index]['checked'] ? TextDecoration.lineThrough :TextDecoration.none,
                                  color: Colors.black,
                                  fontFamily: 'OpenSans',
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            Column(children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.delete_outline,
                                    color: Color(0xffff5252),
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      lst.remove(lst[index]);
                                    });
                                    await dbs.addNewTODO(lst);
                                  }),
                              IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Color(0xff00B0FF),
                                ),
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
        backgroundColor: Color(0xff00BFA6),
      ),
    );
  }
}
