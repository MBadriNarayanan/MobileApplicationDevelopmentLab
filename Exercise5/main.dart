import 'package:flutter/material.dart';


void main() {
  runApp(new MaterialApp(
    home: Traffic(),
  ));
}
class Traffic extends StatelessWidget {
  const Traffic({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App that makes use of Graphics'),
          backgroundColor: Colors.lightGreen,
        ),

        body:Center(
          child: Container(
            width: 100,
            height: 220,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red
                  ),
                ),
                SizedBox(
                    height:15
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.amber
                  ),
                ),
                SizedBox(
                    height:15
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,color: Colors.green
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}