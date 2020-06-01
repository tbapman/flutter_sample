import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text('Drawer Demo')
      ),
      drawer: Drawer(
        child: ListView( 
          padding:EdgeInsets.zero,
          children:const <Widget>[
            DrawerHeader(
              decoration:BoxDecoration(
                color:Colors.blue
              ),
              child:Text(
                'Drawer Header',
                style:TextStyle(
                  color:Colors.white,
                  fontSize:24
                ),
              ),
            ),
            ListTile(
              leading:Icon(Icons.message),
              title:Text('Message')
            ),
            ListTile(
              leading:Icon(Icons.account_circle),
              title:Text('Profile')
            ),
            ListTile(
              leading:Icon(Icons.settings),
              title:Text('Settings')
            )
          ],
        ),
      ),
    );
  }
}