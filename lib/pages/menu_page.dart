import 'dart:math';

import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Text("Menu"),
        centerTitle: true,
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          padding: EdgeInsets.all(10.0),
          crossAxisCount: 2,
          // maxCrossAxisExtent: 0.0,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: <Widget>[
            // SizedBox(height:10.0),
            // SizedBox(height:10.0),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton.icon(
                icon: Icon(
                  Icons.list,
                  color: Colors.green,
                ),
                color: Colors.grey[400],
                label: Text("TO-DO List"),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton.icon(
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.green,
                ),
                color: Colors.grey[400],
                label: Text("Set Location"),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton.icon(
                // shape: ,
                icon: Icon(
                  Icons.art_track,
                  color: Colors.green,
                ),
                color: Colors.grey[400],
                label: Text("News Preferance"),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton.icon(
                icon: status
                    ? Icon(Icons.brightness_7, color: Colors.orange[800])
                    : Icon(Icons.brightness_3, color: Colors.grey[200]),
                splashColor: !status ? Colors.green[300] : Colors.red[300],
                color: !status ? Colors.red[300] : Colors.green[300],
                label: Text("ON/OFF"),
                onPressed: () {
                  setState(() {
                    status = !status;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton.icon(
                // shape: ,
                icon: Icon(
                  Icons.do_not_disturb,
                  // color: Colors.green,
                ),
                color: Colors.grey[400],
                label: Text("Extra"),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton.icon(
                // shape: ,
                icon: Icon(
                  Icons.do_not_disturb,
                  // color: Colors.green,
                ),
                color: Colors.grey[400],
                label: Text("Extra"),
                onPressed: () {},
              ),
            ),
          ],
          // children: List<Widget>.generate(
          //   6,
          //   (index) => GridTile(
          //     child: Card(
          //       child: Center(
          //           child: Text(
          //         "Text",
          //         style: TextStyle(
          //           color: Color((Random().nextDouble() * 0xFFFFFFFF).toInt())
          //               .withOpacity(1.0),
          //         ),
          //       )),
          //       color: Color((Random().nextDouble() * 0xFFFFFFFF).toInt() << 0)
          //           .withOpacity(1.0),
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
