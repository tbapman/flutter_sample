import 'package:flutter/material.dart';

class FloatingActionButtonSample extends StatelessWidget {
  static const String _title='Floating Action Button';

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title:_title,
      home:MyStatelessWidget()
    );
  }
}

class MyStatelessWidget extends StatelessWidget{
  MyStatelessWidget({Key key}):super(key:key);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('Floating Action Button'),
      ),
      body:Center(child: const Text('Press the button below!')),
        floatingActionButton:FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.navigation),
          backgroundColor: Colors.green,
        ),
    );
  }
}