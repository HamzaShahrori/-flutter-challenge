import 'algorithim.dart';
import 'analyzer.dart';

import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'dart:ui' as ui;
// import 'dart:convert';
import 'package:flutter/material.dart';



void main() {
  runApp( MaterialApp(
    title: 'Navigation Basics',
    home: Sort(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child:  Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Visual()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child:  Text('Go back!'),
        ),
      ),
    );
  }
}
  // runApp(MaterialApp(home:Sort()));
  //  runApp(MyApp());

// //
