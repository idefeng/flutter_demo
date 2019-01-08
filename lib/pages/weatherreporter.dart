import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:day1stopwatch/utils/carousel.dart';
import 'package:day1stopwatch/utils/flutter_icon_icons.dart';

class WeatherReporter extends StatelessWidget {
  WeatherReporter({Key key, this.cityData}) : super(key: key);

  final cityData;
  final _weatherData = jsonDecode('''
[{
	"key": 0,
	"city": "北京",
	"night": true,
	"bg": "w2.png",
	"abs": "大部晴朗",
	"degree": 15,
	"today": {
		"week": "星期六",
		"day": "今天",
		"high": 16,
		"low": 14
	},
	"hours": [{
		"key": 101,
		"time": "现在",
		"icon": "0xe804",
		"degree": "15°",
		"color": "0xFFFFFFFF"
	}, {
		"key": 102,
		"time": "3时",
		"icon": "0xe80c",
		"degree": "15°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 103,
		"time": "4时",
		"icon": "0xe80c",
		"degree": "16°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 104,
		"time": "5时",
		"icon": "0xe80c",
		"degree": "16°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 105,
		"time": "6时",
		"icon": "0xe80c",
		"degree": "16°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 106,
		"time": "06:21",
		"icon": "0xe829",
		"degree": "日出",
		"color": "0xFFfedf32"
	}, {
		"key": 107,
		"time": "7时",
		"icon": "0xe80b",
		"degree": "16°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 108,
		"time": "8时",
		"icon": "0xe80b",
		"degree": "18°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 109,
		"time": "9时",
		"icon": "0xe803",
		"degree": "19°",
		"color": "0xFFfedf32"
	}, {
		"key": 110,
		"time": "10时",
		"icon": "0xe803",
		"degree": "122°",
		"color": "0xFFfedf32"
	}, {
		"key": 111,
		"time": "11时",
		"icon": "0xe803",
		"degree": "23°",
		"color": "0xFFfedf32"
	}, {
		"key": 112,
		"time": "13时",
		"icon": "0xe803",
		"degree": "22°",
		"color": "0xFFfedf32"
	}, {
		"key": 113,
		"time": "13时",
		"icon": "0xe803",
		"degree": "22°",
		"color": "0xFFfedf32"
	}, {
		"key": 114,
		"time": "14时",
		"icon": "0xe80b",
		"degree": "16°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 115,
		"time": "15时",
		"icon": "0xe80b",
		"degree": "22°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 116,
		"time": "16时",
		"icon": "0xe80b",
		"degree": "21°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 117,
		"time": "17时",
		"icon": "0xe80b",
		"degree": "19°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 118,
		"time": "18时",
		"icon": "0xe80b",
		"degree": "18°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 119,
		"time": "18:06",
		"icon": "0xe80b",
		"degree": "日落",
		"color": "0xE6FFFFFF"
	}, {
		"key": 120,
		"time": "19时",
		"icon": "0xe80c",
		"degree": "18°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 121,
		"time": "20时",
		"icon": "0xe80c",
		"degree": "18°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 122,
		"time": "21时",
		"icon": "0xe80c",
		"degree": "18°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 123,
		"time": "22时",
		"icon": "0xe80c",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 124,
		"time": "23时",
		"icon": "0xe814",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 125,
		"time": "0时",
		"icon": "0xe814",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 126,
		"time": "1时",
		"icon": "0xe814",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 127,
		"time": "2时",
		"icon": "0xe814",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}],
	"days": [{
		"key": 21,
		"day": "星期一",
		"icon": "0xe80b",
		"high": 21,
		"low": 16
	}, {
		"key": 22,
		"day": "星期二",
		"icon": "0xe81a",
		"high": 22,
		"low": 14
	}, {
		"key": 23,
		"day": "星期三",
		"icon": "0xe81a",
		"high": 21,
		"low": 11
	}, {
		"key": 24,
		"day": "星期四",
		"icon": "0xe81a",
		"high": 12,
		"low": 8
	}, {
		"key": 25,
		"day": "星期五",
		"icon": "0xe81a",
		"high": 9,
		"low": 7
	}, {
		"key": 26,
		"day": "星期六",
		"icon": "0xe80b",
		"high": 13,
		"low": 9
	}, {
		"key": 27,
		"day": "星期日",
		"icon": "0xe81a",
		"high": 17,
		"low": 13
	}, {
		"key": 28,
		"day": "星期一",
		"icon": "0xe80b",
		"high": 18,
		"low": 14
	}, {
		"key": 29,
		"day": "星期二",
		"icon": "0xe80b",
		"high": 22,
		"low": 17
	}],
	"info": "今天：有暴雨，能见度低。最高气温29°。今晚局部多云，最低气温27°。",
	"rise": "06:21",
	"down": "18:06",
	"prop": "10%",
	"humi": "94%",
	"dir": "东北偏北",
	"speed": "3千米／小时",
	"feel": "15°",
	"rain": "0.0 厘米",
	"pres": "1,016 百帕",
	"sight": "5.0 公里",
	"uv": "0"
}, {
	"key": 1,
	"city": "张德锋",
	"night": false,
	"bg": "w3.png",
	"abs": "大部晴朗",
	"degree": 15,
	"today": {
		"week": "星期六",
		"day": "今天",
		"high": 16,
		"low": 14
	},
	"hours": [{
		"key": 101,
		"time": "现在",
		"icon": "0xe804",
		"degree": "15°",
		"color": "0xFFFFFFFF"
	}, {
		"key": 102,
		"time": "3时",
		"icon": "0xe80c",
		"degree": "15°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 103,
		"time": "4时",
		"icon": "0xe80c",
		"degree": "16°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 104,
		"time": "5时",
		"icon": "0xe80c",
		"degree": "16°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 105,
		"time": "6时",
		"icon": "0xe80c",
		"degree": "16°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 106,
		"time": "06:21",
		"icon": "0xe829",
		"degree": "日出",
		"color": "0xFFfedf32"
	}, {
		"key": 107,
		"time": "7时",
		"icon": "0xe80b",
		"degree": "16°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 108,
		"time": "8时",
		"icon": "0xe80b",
		"degree": "18°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 109,
		"time": "9时",
		"icon": "0xe803",
		"degree": "19°",
		"color": "0xFFfedf32"
	}, {
		"key": 110,
		"time": "10时",
		"icon": "0xe803",
		"degree": "122°",
		"color": "0xFFfedf32"
	}, {
		"key": 111,
		"time": "11时",
		"icon": "0xe803",
		"degree": "23°",
		"color": "0xFFfedf32"
	}, {
		"key": 112,
		"time": "13时",
		"icon": "0xe803",
		"degree": "22°",
		"color": "0xFFfedf32"
	}, {
		"key": 113,
		"time": "13时",
		"icon": "0xe803",
		"degree": "22°",
		"color": "0xFFfedf32"
	}, {
		"key": 114,
		"time": "14时",
		"icon": "0xe80b",
		"degree": "16°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 115,
		"time": "15时",
		"icon": "0xe80b",
		"degree": "22°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 116,
		"time": "16时",
		"icon": "0xe80b",
		"degree": "21°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 117,
		"time": "17时",
		"icon": "0xe80b",
		"degree": "19°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 118,
		"time": "18时",
		"icon": "0xe80b",
		"degree": "18°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 119,
		"time": "18:06",
		"icon": "0xe80b",
		"degree": "日落",
		"color": "0xE6FFFFFF"
	}, {
		"key": 120,
		"time": "19时",
		"icon": "0xe80c",
		"degree": "18°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 121,
		"time": "20时",
		"icon": "0xe80c",
		"degree": "18°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 122,
		"time": "21时",
		"icon": "0xe80c",
		"degree": "18°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 123,
		"time": "22时",
		"icon": "0xe80c",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 124,
		"time": "23时",
		"icon": "0xe814",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 125,
		"time": "0时",
		"icon": "0xe814",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 126,
		"time": "1时",
		"icon": "0xe814",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 127,
		"time": "2时",
		"icon": "0xe814",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}],
	"days": [{
		"key": 21,
		"day": "星期一",
		"icon": "0xe80b",
		"high": 21,
		"low": 16
	}, {
		"key": 22,
		"day": "星期二",
		"icon": "0xe81a",
		"high": 22,
		"low": 14
	}, {
		"key": 23,
		"day": "星期三",
		"icon": "0xe81a",
		"high": 21,
		"low": 11
	}, {
		"key": 24,
		"day": "星期四",
		"icon": "0xe81a",
		"high": 12,
		"low": 8
	}, {
		"key": 25,
		"day": "星期五",
		"icon": "0xe81a",
		"high": 9,
		"low": 7
	}, {
		"key": 26,
		"day": "星期六",
		"icon": "0xe80b",
		"high": 13,
		"low": 9
	}, {
		"key": 27,
		"day": "星期日",
		"icon": "0xe81a",
		"high": 17,
		"low": 13
	}, {
		"key": 28,
		"day": "星期一",
		"icon": "0xe80b",
		"high": 18,
		"low": 14
	}, {
		"key": 29,
		"day": "星期二",
		"icon": "0xe80b",
		"high": 22,
		"low": 17
	}],
	"info": "今天：今天大部多云。现在气温 15°；最高气温23°。",
	"rise": "06:21",
	"down": "18:06",
	"prop": "10%",
	"humi": "94%",
	"dir": "东北偏北",
	"speed": "3千米／小时",
	"feel": "15°",
	"rain": "0.0 厘米",
	"pres": "1,016 百帕",
	"sight": "5.0 公里",
	"uv": "0"
}]''');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WeatherInfo(
        cityData: _weatherData,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                FlutterIcon.clouds,
                color: Colors.white,
              ),
              title: Text("天气",
                  style: TextStyle(fontSize: 14.0, color: Colors.white)),
                  backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                FlutterIcon.compass,
                color: Colors.white,
              ),
              title: Text("时景",
                  style: TextStyle(fontSize: 14.0, color: Colors.white))),
          BottomNavigationBarItem(
              icon: Icon(
                FlutterIcon.eclipse,
                color: Colors.white,
              ),
              title: Text("小视频",
                  style: TextStyle(fontSize: 14.0, color: Colors.white))),
          BottomNavigationBarItem(
              icon: Icon(
                FlutterIcon.hail,
                color: Colors.white,
              ),
              title: Text("我",
                  style: TextStyle(fontSize: 14.0, color: Colors.white)))
        ],
        fixedColor: Colors.orange,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Back', // used by assistive technologies
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  WeatherInfo({Key key, this.cityData}) : super(key: key);

  final cityData;

  @override
  Widget build(BuildContext context) {
    //第一行，定位行和热点新闻行
    var firstSection = Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text("+",
                style: TextStyle(fontSize: 16.0, color: Color(0xFFFFFFFF))),
            Expanded(
                child: Row(
              children: <Widget>[
                //定位地点
                Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text("东城区 中粮恒基夹道",
                      style:
                          TextStyle(fontSize: 16.0, color: Color(0xFFFFFFFF))),
                ),
                //定位图标
                Padding(
                  padding: EdgeInsets.only(left: 2.0),
                  child: Icon(Icons.location_on,
                      color: Color(0xFFFFFFFF), size: 14.0),
                ),
              ],
            )),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.assignment, color: Color(0xFFFFFFFF)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.calendar_today, color: Color(0xFFFFFFFF)),
            )
          ],
        ),
        //热点新闻
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Ink(
              height: 40.0,
              width: 160.0,
              decoration: BoxDecoration(
                  color: Colors.red,
                  // border: Border.all(color: Colors.white54),
                  borderRadius: BorderRadius.circular(5.0)),
              child: InkWell(
                borderRadius: BorderRadius.circular(35.0),
                child: Center(
                  child: Text(
                    "中国队2:1胜XX队",
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: () {},
              ),
            ),
          ],
        )
      ],
    );

    var secondSection = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        //温度
        Container(
          padding: EdgeInsets.only(left: 5.0),
          child: Text("-4",
              style: TextStyle(
                  fontSize: 130.0,
                  fontFamily: "RobotMono",
                  fontWeight: FontWeight.w100,
                  color: Color(0xFFFFFFFF))),
        ),
        //中间晴朗等
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Text("°",
                        style: TextStyle(
                            fontSize: 50.0, color: Color(0xFFFFFFFF))),
                  ),
                  Text("晴",
                      style:
                          TextStyle(fontSize: 16.0, color: Color(0xFFFFFFFF)))
                ],
              ),
              Icon(Icons.mode_edit, color: Color(0xFFFFFFFF), size: 20.0),
            ],
          ),
        ),
        //空气质量与大风预警
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Ink(
                height: 40.0,
                width: 120,
                decoration: BoxDecoration(
                  color: Color(0xFF000000),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(5.0),
                  onTap: () {},
                  child: Row(
                    //空气质量
                    children: <Widget>[
                      Text(
                        "| ",
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "优 ",
                        style:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.0),
                      ),
                      Text(
                        "40",
                        style:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //大风预警
            Ink(
              height: 60.0,
              width: 120,
              decoration: BoxDecoration(
                color: Color(0xFF000000),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(5.0),
                onTap: () {},
                child: Row(
                  children: <Widget>[
                    Text(
                      "| ",
                      style:
                          TextStyle(color: Colors.green, fontSize: 16.0,fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "大风预警",
                      style:
                          TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );

    //风力、温湿度、气压等
    var thirdSection = Container(
        padding: EdgeInsets.only(top: 10.0, left: 20.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.favorite_border,
                  color: Color(0xFFFFFFFF),
                  size: 14.0,
                ),
                Text(
                  "3级",
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.0),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Icon(
                    Icons.child_friendly,
                    color: Color(0xFFFFFFFF),
                    size: 14.0,
                  ),
                ),
                Text(
                  "19%",
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.0),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Icon(
                    Icons.bubble_chart,
                    color: Color(0xFFFFFFFF),
                    size: 14.0,
                  ),
                ),
                Text(
                  "1039 hPa",
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.0),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Color(0xFFFFFFFF),
                  size: 16.0,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "未来两小时不会降雪",
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.0),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Color(0xFFFFFFFF),
                    size: 16.0,
                  ),
                ],
              ),
            ),
          ],
        ));

    //动态图片
    var fourthSection = Container(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('Card控件来占位'),
              subtitle: Text('Card控件来占位Card控件来占位Card控件来占位Card控件来占位Card控件来占位Card控件来占位Card控件来占位Card控件来占位Card控件来占位Card控件来占位'),
            ),
            ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('Card控件来占位'),
                    onPressed: () {/* ... */},
                  ),
                  FlatButton(
                    child: const Text('Card控件来占位'),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    //底部，今天明天天气
    var fifthSection = Container(
      child: Padding(
        padding: EdgeInsets.only(left: 0.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "今天",
                          style: TextStyle(
                              color: Color(0xFFFFFFFF), fontSize: 16.0),
                        ),
                        Text(
                          "少云",
                          style: TextStyle(
                              color: Color(0xFFFFFFFF), fontSize: 18.0),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "1/-8°C",
                          style: TextStyle(
                              color: Color(0xFFFFFFFF), fontSize: 16.0),
                        ),
                        Container(
                          width: 35.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              border:
                                  Border.all(color: Colors.green, width: 1.0),
                              borderRadius: BorderRadius.circular(3.0)),
                          child: Center(
                              child: Text(
                            "优",
                            style: TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 14.0),
                            // textAlign: TextAlign.center,
                          )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "明天",
                          style: TextStyle(
                              color: Color(0xFFFFFFFF), fontSize: 16.0),
                        ),
                        Text(
                          "少云",
                          style: TextStyle(
                              color: Color(0xFFFFFFFF), fontSize: 18.0),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "1/-8°C",
                          style: TextStyle(
                              color: Color(0xFFFFFFFF), fontSize: 16.0),
                        ),
                        Container(
                          width: 35.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          child: Center(
                            child: Text(
                              "良",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF), fontSize: 14.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return new LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: new ConstrainedBox(
            constraints:
                new BoxConstraints(maxHeight: viewportConstraints.maxHeight),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/w3.png'), fit: BoxFit.cover)),
              child: Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                child: Column(
                  children: <Widget>[
                    firstSection,
                    secondSection,
                    thirdSection,
                    Expanded(
                      child: fourthSection,
                    ),
                    fifthSection
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
