import 'package:flutter/material.dart';

//创建一个有状态的widget需要2个类
class BaiscAppBarSample extends StatefulWidget {
  @override
  _BaiscAppBarSampleState createState() => _BaiscAppBarSampleState();
}

//定义2个字段 字符串title及IconData类型的icon
class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

//定义一个列表 其中每一项都是Choice类
const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

//除了上面使用命名参数，也可以使用位置参数，使用此方法时，定义Choice类时无需大括号
// const List<Choice> choices = const <Choice>[
//   const Choice( 'Car',  Icons.directions_car),
//   const Choice( 'Bicycle',  Icons.directions_bike),
//   const Choice( 'Boat',  Icons.directions_boat),
//   const Choice( 'Bus',  Icons.directions_bus),
//   const Choice( 'Train',  Icons.directions_railway),
//   const Choice( 'Walk',  Icons.directions_walk),
// ];

class ChoiceCard extends StatelessWidget {
  //定义一个Choice类的字段 choice
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, //聚集widget
            // crossAxisAlignment: CrossAxisAlignment.center,//交叉轴居中 去掉不影响
            children: <Widget>[
              Icon(choice.icon, size: 128.0, color: textStyle.color),
              Text(choice.title, style: textStyle)
            ],
          ),
        ));
  }
}

class _BaiscAppBarSampleState extends State<BaiscAppBarSample> {
  Choice _selectedChoice = choices[0]; //该字段相当于react中的state，默认展示第一项
  //点击按钮时的回调
  void _select(Choice choice) {
    print('${choice.title}');
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Basic AppAar'), //标题栏
          actions: <Widget>[
            IconButton(
              icon: Icon(choices[0].icon),
              onPressed: () {
                _select(choices[0]);
              },
            ),
            IconButton(
              icon: Icon(choices[1].icon),
              onPressed: () {
                _select(choices[1]);
              },
            ),
            PopupMenuButton<Choice>(
              //弹出式按钮
              onSelected: _select, //这个选择事件不是放在map循环中有些奇怪
              itemBuilder: (BuildContext context) {
                return choices.skip(2).map((Choice choice) {
                  //跳过前2条，因为已经展示过了
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ChoiceCard(choice: _selectedChoice) //默认展示第一项
            ),
      ),
    );
  }
}
