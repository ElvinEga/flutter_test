import 'package:flutter/material.dart';
import 'package:test_app/screens/second.dart';
import 'package:test_app/screens/third.dart';
import 'hello_widget.dart';

void main() => runApp(
  //some widget require this shit
    MaterialApp(
      title: 'Learn Fast',
      routes: <String,WidgetBuilder>{
        '/home': (BuildContext context) => new MyApp(),
        '/second': (BuildContext context) => new Second(),
        '/third': (BuildContext context) => new Third(),

      },
      home: MyApp(),
    ),);
enum myDialogAction{
  yes, no
}
class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp>{
  String _title = "My App";
  String _myState  = '';
  String _text ='';
  int _selectedRadio = 0;
  bool _isChecked = false  ;
  bool _isSwitched = false  ;
  double _sliderValue = 0;
  String _value = '';
  List<String> _values = new List<String>();

  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();


  @override
  void initState() {
    _values.addAll(['Male', 'Female']);
    _value = _values.elementAt(0);
  }


  void _showSnackBar(String message){
    _scaffoldState.currentState.showSnackBar(new SnackBar(content: new Text(message)));
  }

  void _pressed(String message){
setState(() {
  _myState = message;
});
_showSnackBar(message);
  }
  _btnClicked(){
    _showSnackBar(_textEditingController.text);
  }
  void _dialogResultMessage(myDialogAction value){
    _showSnackBar('You have selected $value');
  }
  // user defined function
  void _showDialog(String value) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert $value"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(onPressed:() {_dialogResultMessage(myDialogAction.yes);}, child: new Text("Yes")),
            new FlatButton(onPressed:() {_dialogResultMessage(myDialogAction.no);}, child: new Text("No")),
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onChanged(String value){
    setState(() {
      _text = value;
    });
  }
  void _onChecked(bool value){
    setState(() {
      _isChecked = value;
    });
  }
  void _onRadioChanged(int value){
    setState(() {
      _selectedRadio = value;
    });
  }
  void _onSwitchChanged(bool value){
    setState(() {
      _isSwitched = value;
    });
  }
  void _onSliderChanged(double value){
    setState(() {
      _sliderValue = value;
    });
  }
  void _onDropdownChanged(String value){
    setState(() {
      _value = value;
    });
  }

  List<Widget> makeRadios(){
    List<Widget> list = new List<Widget>();
    for(int i =0;i<3;i++){
      list.add(new Row(children: <Widget>[
        new Text ('Radio $i'),
        new Radio(value: i, groupValue: _selectedRadio, onChanged: (int value) {_onRadioChanged(value);})
      ],));
    }
    for(int i =0;i<3;i++){
      list.add(new RadioListTile(
          value: i,
          groupValue: _selectedRadio,
          onChanged: (int value) {_onRadioChanged(value);},
        activeColor: Colors.red,
        secondary: new Icon(Icons.home),
        subtitle: new Text('Sub title here $i'),
          ));
    }
    
    return list;
  }

  final TextEditingController _textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My App",
      home: new Scaffold(
        key: _scaffoldState,
        floatingActionButton: new FloatingActionButton(onPressed: null,backgroundColor: Colors.red,child: new Icon(Icons.star),),
        drawer: new Drawer(
          child: new Container(
            padding: new EdgeInsets.all(32.0),
            child: new Text('Drawer'),
          ),
        ),
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.home), onPressed: () {Navigator.of(context).pushNamed('/second');}),
            new IconButton(icon: new Icon(Icons.edit), onPressed: () {_showDialog('edit');}),
            new IconButton(icon: new Icon(Icons.email), onPressed: () {_pressed('email');})
          ],
        
        ),
        body:
            SingleChildScrollView(
    child: ConstrainedBox(
    constraints: BoxConstraints(),
     child:   Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Container(
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new Text(_myState),
                  new Text('World'),
                  new TextField(
                    onChanged:(String value) {_onChanged(value);},
                    controller: _textEditingController,
                    maxLines: 1,
                    autocorrect: true,
                  //  obscureText: true,
                    decoration: new InputDecoration(
                      icon: new Icon(Icons.mail),
                      hintText: 'Type Something here',
                      labelText: 'Whats happening'
                    ),
                  ),
                  new RaisedButton(onPressed: () {_btnClicked();},child: new Text("Click Me"),),
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text("Remember Me?"),
                      new Checkbox(value: _isChecked, onChanged: (bool value) {_onChecked(value);}),
                    ],
                  ),
                  new CheckboxListTile(value: _isChecked,title: new Text('Click to Check'), onChanged: (bool value) {_onChecked(value);}),
                  new Column(children: makeRadios(),),
                  new Switch(value: _isSwitched, onChanged: (bool value) {_onSwitchChanged(value);}),
                  new SwitchListTile(value: _isSwitched,
                      activeColor: Colors.red,
                      secondary: new Icon(Icons.home),
                      title: new Text("Switch "),
                      onChanged: (bool value) {_onSwitchChanged(value);}),
                  new Text('slider value : ${_sliderValue.round()}'),
                  new Slider(
                    min: 0,
                      max: 100,
                      value: _sliderValue,
                      onChanged: (double value) {_onSliderChanged(value);}),
                  new LinearProgressIndicator(value: _sliderValue*.01,),
                  new Text('Progress value : ${_sliderValue*.01}'),
                  new Text('Gender'),
                  new DropdownButton(
                    value: _value,
                      items: _values.map((String value){
                    return new DropdownMenuItem(value:value,
                        child: new Row(children: <Widget>[new Icon(Icons.person_outline),
                        new Text(value)],));}).toList(),
                      onChanged: (String value){_onDropdownChanged(value);}),
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new HelloWidget(name:"you"),
                      new HelloWidget(name:"me"),
                      new HelloWidget(name:"us"),
                      new HelloWidget(name:"we")
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        ),
        ),
      ),
    );
  }


}
