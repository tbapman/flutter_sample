import 'package:flutter/material.dart';

class ScaffoldSample1 extends StatelessWidget{
  static const String _title='Flutter Code Sample';
  @override 

  Widget build(BuildContext context){
    return MaterialApp(
      title:_title,
      home:MyStatefulWidget()
    );
  }
}

class MyStatefulWidget extends StatefulWidget{
  MyStatefulWidget({Key key}):super(key:key);

  @override 
  _MyStatefulWidgetState createState()=>_MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>{
  int _count=0;
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(title:const Text('Sample Code')),
      body:Center(child:Text('You have pressed the buton $_count times')),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>setState(()=>_count++),
        tooltip: '长按提示',
        child:const Icon(Icons.add)
      ),
    );
  }
}