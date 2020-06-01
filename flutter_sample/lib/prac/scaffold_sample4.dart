import 'package:flutter/material.dart';
import 'package:flutter_sample/prac/scaffold_sample3.dart';

class AppBarBottomSample extends StatefulWidget{
  @override 
  _AppBarBottomSampleState createState()=>_AppBarBottomSampleState();
}

class _AppBarBottomSampleState extends State<AppBarBottomSample> with SingleTickerProviderStateMixin{
  TabController _tabController;
  @override 
  void initState(){
    super.initState();
    _tabController=TabController(vsync: this,length: choices.length); 
  }
  @override 
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }
  void _nextPage(int delta){
    final int newIndex=_tabController.index+delta;
    if(newIndex<0||newIndex>=_tabController.length){//到达第一个或最后一个不执行
      return;
    }
    //自由拓展部分，到达第一个时，再点击返回最后一个
    //点击最后一个时到达第一个
    // if(newIndex<0){
    //   _tabController.animateTo(_tabController.length-1);
    // }
    // if(newIndex>=_tabController.length){
    //   print('end');
    //   _tabController.animateTo(0);
    // }

    _tabController.animateTo(newIndex);
  }
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title:const Text('AppBar Bottom Widget'),
          leading:IconButton(
            tooltip:'Previous choice',
            icon:const Icon(Icons.arrow_back),
            onPressed: (){_nextPage(-1);},
          ),
          actions: <Widget>[
            IconButton(
              icon:Icon(Icons.arrow_forward),
              tooltip:'Next Choice',
              onPressed: (){_nextPage(1);},
            ),
          ],
          bottom:PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Theme(
              data:Theme.of(context).copyWith(accentColor:Colors.white),//重点色
              child:Container(
                height: 48.0,
                alignment: Alignment.center,
                child: TabPageSelector(controller: _tabController),
              ),
            ),
          ),
        ),
        body:TabBarView(
          controller: _tabController,
          children: choices.map((Choice choice){
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ChoiceCard(choice: choice),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Choice{
  const Choice({this.title,this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget{
  const ChoiceCard({Key key,this.choice}):super(key:key);
  final Choice choice;
  @override 
  Widget build(BuildContext context){
    final TextStyle textStyle=Theme.of(context).textTheme.display1;
    return Card(
      color:Colors.white,
      child:Center(
        child:Column(
          mainAxisSize:MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon,size:128.0,color:textStyle.color),
            Text(choice.title,style:textStyle),
          ],
        ),
      ),
    );
  }
}