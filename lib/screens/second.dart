import 'package:flutter/material.dart';

class Second extends StatefulWidget{
  @override
  _MySecondState createState() => new _MySecondState();
}

class _MySecondState extends State<Second>{
  List<bool> _data = new List<bool>();

  @override
  void initState() {
    setState(() {
      for (int i =0; i <10; i++){
        _data.add(false);
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Second Page',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Second page'),),
        body:    new ListView.builder(itemCount: _data.length,itemBuilder: (BuildContext context, int index){
          return new Card(child: new Container(padding: new EdgeInsets.all(5.0),
            child: new Column(
              children: <Widget>[
                new Text('This is item $index'),
              ],
            ),));

        }),

      ),
    );

  }
}