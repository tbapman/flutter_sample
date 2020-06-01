import 'package:flutter/material.dart';


class FlatButtonExapmle extends StatelessWidget{
  static const String _title='Flat Button';
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(title: const Text(_title),),
        body:Center(
        child: FlatButton( 
          color: Colors.blue,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          splashColor: Colors.blueAccent,
          onPressed: (){},
          child: Text('Flat Button',style:TextStyle(fontSize:20.0)),
        ),
      ),
      )
      
    );
  }
}