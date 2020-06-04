// import 'package:flutter/material.dart';

// class Location extends StatefulWidget {
//   @override
//   _LocationState createState() => _LocationState();
// }

// class _LocationState extends State<Location> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Location",
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xff212121),
//       ),
//       body: Center(
//         child: Text(
//           "Location Page",
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  var _currentAddress;

  bool hideThis = false;
  bool hideThat = false;
  bool hideForm = true;
  bool hideSubmit = true;
  bool hideList = true;

  List ps;

  String locationStr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
        backgroundColor: Color(0xff212121),
        centerTitle: true,
      ),
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (_currentPosition != null && hideThis == false)
              _getLocationTextCard(_currentAddress),
            if (!hideList) _listBuilder(),
            if (!hideForm)
              Container(
                color: Colors.amber,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.fromLTRB(10, 20, 10, 50),
                child: SizedBox(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: Colors.black,
                        size: 35,
                      ),
                      hintText: 'e.g. locality, city',
                      hintStyle: TextStyle(),
                    ),
                    style: TextStyle(
                      color: Color(0xff212121),
                      fontSize: 20,
                    ),
                    onChanged: (value) {
                      setState(() {
                        locationStr = value;
                      });
                    },
                  ),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (!hideThis)
                  SizedBox(
                    height: 70,
                    width: 150,
                    child: RaisedButton.icon(
                      color: Color(0xff212121),
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Get Current\n   Location",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          hideThat = true;
                          hideSubmit = false;
                        });
                        _getCurrentLocation();
                      },
                    ),
                  ),
                if (!hideThat)
                  SizedBox(
                    height: 70,
                    width: 150,
                    child: RaisedButton.icon(
                      color: Color(0xff212121),
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Find location",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          hideThis = true;
                          hideThat = true;
                          hideSubmit = false;
                          hideForm = false;
                        });
                      },
                    ),
                  ),
                if (!hideForm)
                  SizedBox(
                    height: 70,
                    width: 150,
                    child: RaisedButton.icon(
                      color: Color(0xff212121),
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Find location",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      onPressed: () {
                        _getAddressFromAdd(locationStr);
                      },
                    ),
                  ),
                if (!hideSubmit)
                  SizedBox(
                    height: 70,
                    width: 150,
                    child: RaisedButton.icon(
                      color: Color(0xff212121),
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      onPressed: () async {
                        Navigator.pop(context, finalValue);
                      },
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromAdd(String address) async {
    if (address == null || address == '') {
      return;
    }
    try {
      List<Placemark> ps = await geolocator.placemarkFromAddress(address);

      for (var x in ps) {
        print(x.toJson());
      }
      setState(() {
        _currentPosition = Position(longitude: 25.0, latitude: 30.0);

        _currentAddress = ps.toString();
        hideList = false;
        this.ps = ps.map((place) {
          return {
            'place':
                place.subLocality == "" ? place.locality : place.subLocality,
            'city': place.locality,
            'dist': place.subAdministrativeArea,
            'state': place.administrativeArea,
            'country': place.administrativeArea,
            'pin': place.postalCode,
          'position': {'lat':place.position.latitude,'long':place.position.longitude}
          };
        }).toList();
      });
    } catch (e) {
      print(e.toString());
    }
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress = {
          'place': place.subLocality == "" ? place.locality : place.subLocality,
          'city': place.locality,
          'dist': place.subAdministrativeArea,
          'state': place.administrativeArea,
          'country': place.administrativeArea,
          'pin': place.postalCode,
          'position': {'lat':place.position.latitude,'long':place.position.longitude}
        };
        finalValue = _currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }

  Widget _getLocationTextCard(var location) {
    return Card(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 40),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.location_on),
            if (location!=null) Flexible(
              child: Text(
                  "${location['place']}, ${location['city']}, ${location['state']}"),
            ),
            Radio(
              value: location,
              groupValue: location,
              onChanged: (value) {
                setState(() {
                  finalValue = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  var finalValue;
  var first;

  Widget _listBuilder() {
    return SizedBox(
      height: 240,
      width: 400,
      child: ListView.builder(
        itemCount: ps.length,
        itemBuilder: (BuildContext context, int index) {
          first = ps[0];
          finalValue = ps[0];
          return _getLocationTextCard(ps[index]);
        },
      ),
    );
  }
}
