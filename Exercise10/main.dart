import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:path_provider/path_provider.dart';
void main() => runApp(const MyApp());
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  String textData = '';
  TextEditingController controller = TextEditingController();
  void send_data() async{
    Directory? appDocDir = await getExternalStorageDirectory();

    String appDocPath = '';
    if(appDocDir!=null){
      // print("Hello");
      appDocPath = appDocDir.path;
    }
    else print("Null");
    print(appDocPath);
    File write_file = File('$appDocPath/text.txt');
    print(write_file.path);
    write_file.writeAsString(textData);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title : Text('lab')),
        body: Center(
          child : Column(
            children : [ TextField(controller: controller),
              ElevatedButton(onPressed: (){
                textData = controller.text;
                print(textData);
                send_data();
              }
                  , child: Text('Press to save to SD CARD'))
            ],
          ),
        ),
      ),
    );
  }
}
