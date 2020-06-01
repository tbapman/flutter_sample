import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<Album> fetchAlbum() async {
  final response=await http.get('http://192.168.0.106:3000/users/getUsers');
  if(response.statusCode==200){
    return Album.fromJson(json.decode(response.body));
  }else{
    throw Exception('Fail to load album');
  }
}

class Album{
  final String id;
  final String username;
  final String avatar;
  Album({this.id,this.username,this.avatar});

  factory Album.fromJson(Map<String,dynamic> json){
    return Album(
      id:json['data'][0]['id'],
      username: json['data'][0]['username'],
      avatar:json['data'][0]['avatar'],
    );
  }
}

class BasicDemo extends StatefulWidget{
  BasicDemo({Key key}):super(key:key);

  @override 
  _BasicDemoState createState()=>_BasicDemoState();
}

class _BasicDemoState extends State<BasicDemo>{
  Future<Album> futureAlbum;

  @override 
  void initState(){
    super.initState();
    futureAlbum=fetchAlbum();
  }
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title:'Fetch Data Example',
      theme:ThemeData(primarySwatch: Colors.blue),
      home:Scaffold(
        appBar: AppBar(title: Text('Fethc Data Example')),
        body:Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context,snapshot){
              if(snapshot.hasData){
                print('-----------------');
                print('$snapshot');
                return Column(
                  children: <Widget>[
                    Text('用户名：${snapshot.data.username}'),
                    Text('用户id：${snapshot.data.id}'),
                    Image.network('${snapshot.data.avatar}')
                  ],
                );
                // return Text('hello');
              }else if(snapshot.hasError){
                return Text('${snapshot.error}');
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}