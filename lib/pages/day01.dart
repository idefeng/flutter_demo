import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:core';

class Day1Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Day1PageState();
  }
}

class Day1PageState extends State<Day1Page> {
  String _sectionTime = "00:00.00";
  String _totalTime = "00:00.00";
  Stopwatch _stopwatch = Stopwatch();
  int _recordTime = 0;
  List<String> _recordList = List();

  void _handleLeftBtn() {
    if (_stopwatch.isRunning) {
      _recordList.add(_sectionTime);
      _recordTime = _stopwatch.elapsedMilliseconds;
    } else {
      setState(() {
        _sectionTime = '00:00.00';
        _totalTime = '00:00.00';
        _recordList.clear();
        _recordTime = 0;
      });
      _stopwatch.reset();
    }
  }

  void _handleRightBtn() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    } else {
      _stopwatch.start();

      Timer.periodic(Duration(milliseconds: 10), (interval) {
        var milSecond,
            second,
            minute,
            countingTime,
            secmilSecond,
            secsecond,
            secminute,
            seccountingTime;

        countingTime = _stopwatch.elapsedMilliseconds;
        minute = (countingTime / (60 * 1000)).floor();
        second = ((countingTime - 6000 * minute) / 1000).floor();
        milSecond = ((countingTime % 1000) / 10).floor();
        seccountingTime = countingTime - _recordTime;
        secminute = (seccountingTime / (60 * 1000)).floor();
        secsecond = ((seccountingTime - 6000 * secminute) / 1000).floor();
        secmilSecond = ((seccountingTime % 1000) / 10).floor();

        setState(() {
          _totalTime = (minute % 60).toString().padLeft(2, '0') +
              ":" +
              (second % 60).toString().padLeft(2, '0') +
              "." +
              (milSecond % 60).toString().padLeft(2, '0');
          _sectionTime = (secminute % 60).toString().padLeft(2, '0') +
              ":" +
              (secsecond % 60).toString().padLeft(2, '0') +
              "." +
              (secmilSecond % 60).toString().padLeft(2, '0');
        });
        if (!_stopwatch.isRunning) {
          interval.cancel();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text("Stop Watch")),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.chevron_left),
              tooltip: "返回",
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SectionTimeRow(sectionTime: _sectionTime),
            TotalTimeRow(
              totalTime: _totalTime,
            ),
            WatchControl(
              watchOn: _stopwatch.isRunning,
              onLeftBtn: _handleLeftBtn,
              onRightBtn: _handleRightBtn,
            ),
            Expanded(
              child: WatchRecord(
                recordList: _recordList,
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SectionTimeRow extends StatelessWidget {
  SectionTimeRow({Key key, this.sectionTime: '00:00.00'}) : super(key: key);

  final String sectionTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10.0, right: 20.0),
          child: Text(sectionTime,
              style: TextStyle(
                  fontFamily: "RobotMono",
                  fontSize: 30.0,
                  fontWeight: FontWeight.w200)),
        ),
      ],
    );
  }
}

class TotalTimeRow extends StatelessWidget {
  TotalTimeRow({Key key, this.totalTime: '00:00.00'}) : super(key: key);

  final String totalTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(totalTime,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontFamily: "RobotMono",
                  fontSize: 70.0)),
        ),
      ],
    );
  }
}

class WatchControl extends StatefulWidget {
  WatchControl(
      {Key key,
      @required this.onRightBtn,
      @required this.onLeftBtn,
      this.watchOn})
      : super(key: key);

  final Function onLeftBtn;
  final Function onRightBtn;
  final bool watchOn;

  @override
  State<StatefulWidget> createState() {
    return WatchControlState();
  }
}

class WatchControlState extends State<WatchControl> {
  String startBtnText = '启动';
  Color startBtnColor = Color(0xFF60B644);
  String stopBtnText = '复位';
  Color underlayColor = Color(0xFFEEEEEE);

  _onRightBtn() {
    if (!widget.watchOn) {
      setState(() {
        startBtnText = '停止';
        startBtnColor = Color(0xFFFF0044);
        stopBtnText = '计次';
        underlayColor = Color(0xFFEEEEEE);
      });
    } else {
      setState(() {
        startBtnText = '启动';
        startBtnColor = Color(0xFF60B644);
        stopBtnText = '复位';
        underlayColor = Color(0xFFEEEEEE);
      });
    }

    widget.onRightBtn();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Ink(
          height: 70.0,
          width: 70.0,
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(35.0),
              border: Border.all(
                color: Color(0xFFFF0000),
              )),
          child: InkWell(
            borderRadius: BorderRadius.circular(35.0),
            onTap: widget.onLeftBtn,
            child: Center(
              child: Text(stopBtnText),
            ),
          ),
        ),
        Ink(
          height: 70.0,
          width: 70.0,
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(35.0),
              border: Border.all(
                color: Color(0xFF000000),
              )),
          child: InkWell(
            borderRadius: BorderRadius.circular(35.0),
            onTap: _onRightBtn,
            child: Center(
              child: Text(
                startBtnText,
                style: TextStyle(color: startBtnColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WatchRecord extends StatelessWidget {
  WatchRecord({Key key, this.recordList}) : super(key: key);

  final List<String> recordList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recordList.length,
      itemBuilder: (context, index) {
        int targetIndex = recordList.length - index;
        return Container(
            height: 40.0,
            padding:
                EdgeInsets.only(top: 5.0, left: 3.0, right: 30.0, bottom: 5.0),
            decoration: BoxDecoration(
                border: BorderDirectional(
                    bottom: BorderSide(color: Color(0xFFBBBBBB)))),
            child: Row(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '计次 $targetIndex',
                      style: TextStyle(color: Color(0xFF777777)),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    recordList[targetIndex - 1],
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Color(0xFF222222), fontFamily: "RobotoMono"),
                  ),
                )
              ],
            ));
      },
    );
  }
}
