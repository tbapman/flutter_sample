import 'package:flutter/material.dart';
import 'package:flutter_sample/prac/bottom_navigation_bar.dart';

class IconButtonSample extends StatelessWidget{
  static const String _title='Icon Button Sample';

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title:_title,
      home:Scaffold(appBar: AppBar(title:const Text(_title)),body:MyStatefulWidget()),

    );
  }
}

class MyStatefulWidget extends StatefulWidget{
  MyStatefulWidget({Key key}):super(key:key);

  @override 
  _MyStatefulWidgetState createState()=>_MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>{
  double _volume=0.0;
  Widget build(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon:Icon(Icons.volume_up),
          tooltip: 'Increase volume by 10',
          onPressed: (){
            setState(() {
              _volume+=10;
            });
          },
        ),
        Text('Volume:$_volume')
      ],
    );
  }
}