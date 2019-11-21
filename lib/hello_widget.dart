import 'package:flutter/material.dart';

class HelloWidget extends StatelessWidget {
  const HelloWidget({
    Key key,@required this.name
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            new Text('hello'),
            new Text('world'),
            new Text(this.name),
          ],
        ),
      ),
    );
  }
}