import 'package:flutter/material.dart';
import 'package:day1stopwatch/utils/flutter_icon_icons.dart';

class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _BottomNavigationColor = Colors.blue;
  BottomNavigationBar bottomNavigationItems;

  @override
  Widget build(BuildContext context) {
    return  bottomNavigationItems = BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                FlutterIcon.clouds,
                color: _BottomNavigationColor,
              ),
              title: Text("天气",
                  style: TextStyle(fontSize: 14.0, color: _BottomNavigationColor)),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                FlutterIcon.compass,
                color: _BottomNavigationColor,
              ),
              title: Text("时景",
                  style: TextStyle(fontSize: 14.0, color: _BottomNavigationColor))),
          BottomNavigationBarItem(
              icon: Icon(
                FlutterIcon.eclipse,
                color: _BottomNavigationColor,
              ),
              title: Text("小视频",
                  style: TextStyle(fontSize: 14.0, color: _BottomNavigationColor))),
          BottomNavigationBarItem(
              icon: Icon(
                FlutterIcon.hail,
                color: _BottomNavigationColor,
              ),
              title: Text("我",
                  style: TextStyle(fontSize: 14.0, color: _BottomNavigationColor)))
        ],
        fixedColor: Colors.orange,
        type: BottomNavigationBarType.fixed,
      );
  }
}