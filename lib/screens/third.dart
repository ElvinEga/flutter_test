import 'package:flutter/material.dart';

class Third extends StatefulWidget{
  @override
  _MyThirdState createState() => new _MyThirdState();
}

class _MyThirdState extends State<Third>{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Third Page',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Third page'),),
        body: new Container(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new  Text('Am at Third'),
                new RaisedButton(child:new Text('back'),onPressed: () {Navigator.of(context).pop();}),
                new RaisedButton(child:new Text('Home'),onPressed: () {Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);})
              ],
            ),
          ),
        ),

      ),
    );

  }
}