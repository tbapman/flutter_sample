import 'package:flutter/material.dart';

class ScaffoldSample2 extends StatelessWidget{
  static const String _title='Flutter Code Sample';
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title:_title,
      home:MyStatefulWidget(),
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
      appBar: AppBar(title:Text('Sample code')),
      body:Center(child: Text('You have pressed the button $_count times'),),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child:Container(height: 50.0)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>setState((){
          _count++;
        }),
        tooltip: '长按提示',
        child:Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}