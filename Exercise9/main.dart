
import 'package:sensors/sensors.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:location/location.dart';

void main() {


  return runApp(const location_wid());
}
class location_wid extends StatefulWidget {


  const location_wid({Key? key}) : super(key: key);

  @override
  _location_widState createState() => _location_widState();
}

class _location_widState extends State<location_wid> {
  Location location = Location();
  bool _isServiceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData _locationData = LocationData.fromMap({});

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title : Text("Lab Geo")),
        body: Center(child : Column(mainAxisAlignment : MainAxisAlignment.center,children : [
          Icon(Icons.location_on, size: 50,),
          Text('\nLatitude: ' + _locationData.latitude.toString() +  '\n\nLongitude:'  + _locationData.longitude.toString() + '\n\nAltitude: ' + _locationData.altitude.toString() + '\n', style: TextStyle(fontSize: 20, color: Colors.blue))
          ,ElevatedButton(onPressed: ()async{
            _isServiceEnabled = await location.serviceEnabled();
            if(!_isServiceEnabled)
              _isServiceEnabled = await location.requestService();
            print(_isServiceEnabled);
            PermissionStatus permission = await location.hasPermission();
            if(permission==PermissionStatus.denied)
              permission = await location.requestPermission();
            print(permission==PermissionStatus.granted);
            _locationData = await location.getLocation();
            // print(_locationData.latitude);
            setState(() {
            });
          },child:  Text('Get Location'),
          ),

        ]),
        ), ),
    );
  }
}