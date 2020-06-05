import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  color: Color(0xff212121),
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);


final todoTextStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'OpenSans',
  fontSize: 20.0,
);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.grey[700],
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);