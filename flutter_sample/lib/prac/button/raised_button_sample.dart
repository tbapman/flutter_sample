import 'package:flutter/material.dart';

class RaiseButtonSample extends StatelessWidget {
  static const String _title = 'Raised Button';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const RaisedButton(
              onPressed: null,
              child: Text('Disabled Button', style: TextStyle(fontSize: 20))),
          const SizedBox(height: 30),
          RaisedButton(
              onPressed: (){},
              child:
                  const Text('Enabled Button', style: TextStyle(fontSize: 20))),
          const SizedBox(height: 30),
          RaisedButton(
              onPressed: null,
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ]),
                ),
                padding: const EdgeInsets.all(10.0),
                child: const Text('Gradient Button',
                    style: TextStyle(fontSize: 20)),
              ))
        ],
      ),
    );
  }
}
