import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Scaffold(

        appBar: AppBar(
            title: Text('GUI Components, Fonts & Colours'),
            centerTitle: true,
            backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Center(
            child: Text(
                'Name: M Badri Narayanan\n'
                'Register Number: 185002018\n'
                'Class: IT A\n'
                'Exercise: 2\n',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.black,
              fontFamily: 'PatrickHand',
            ),),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){},
            child: Text('Click')
        ),
    ),
));