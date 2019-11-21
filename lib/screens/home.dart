import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _MyHomeState createState() => new _MyHomeState();
}

class _MyHomeState extends State<Home>{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'home',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Home'),),
        body: new Container(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new  Text('Am at home'),
                new RaisedButton(child:new Text('back'),onPressed: () {Navigator.of(context).pushNamed('/second');})
              ],
            ),
          ),
        ),

      ),
    );

  }
}