import 'package:flutter/material.dart';

class BottomNavigationBarSample extends StatelessWidget{
  static const String _title='Flutter Code Sample';
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title:_title,
      home:MyStatefulWidget()
    );
  }
}
//底部导航栏为有状态widegt，故需要2个类
class MyStatefulWidget extends StatefulWidget{
  MyStatefulWidget({Key key}):super(key:key);//类似于vue或者react中的key

  @override 
  _MyStatefulWidgetState createState()=>_MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>{
  int _selectedIndex=0; //唯一的state
  static const TextStyle optionStyle=TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold
  );
  static const List<Widget> _widgetOptions=<Widget>[
    Text(
      'Index 0:Home',
      style:optionStyle
    ),
    Text(
      'Index 1:Buiness',
      style: optionStyle,
    ),
    Text(
      'Index 2:School',
      style:optionStyle
    ),
  ];

  //不用显示的传参 可自动获取索引
  //只要_selectedIndex一改变，底部导航栏和内容都会改变
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }


  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('BottomNavigationBar Sample')
      ),
      body:Center(
        child:_widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            title:Text('Home')
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.business),
            title:Text('Business')
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.school),
            title:Text('School')
          ),
        ],
          currentIndex:_selectedIndex,
          selectedItemColor:Colors.amber[800],
          onTap:_onItemTapped
      ),
    );
  }
}