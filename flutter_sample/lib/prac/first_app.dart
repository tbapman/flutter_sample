import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class FirstApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return new MaterialApp(
      // title:'Startup Name Generator2',
      theme:new ThemeData(
        primaryColor: Colors.blue
      ),
      home:new RandomWords()
    );
  }
}
//flutter创建一个有状态的widget需要两个类
//dart2.0中new关键字可以省略
class RandomWords extends StatefulWidget{
  @override 
  createState()=>new RandomWordsState();
}


class RandomWordsState extends State<RandomWords>{
  final _suggestions=<WordPair>[];//所有的单词对  相当于react中的this.state中的对象
  final _saved=new Set<WordPair>();//保存的单词对
  final _biggerFont=const TextStyle(fontSize:18.0);//使用const声明表示不可变
  @override
  Widget _buildSuggestions(){
    return ListView.builder(
      padding:const EdgeInsets.all(16.0),//四周填充16像素
      itemBuilder: (context,i){
        print('$i');
        print('-----');
        print('${_suggestions.length}');
        if(i.isOdd) return Divider();//奇数行返回一个分割线
        final index= i ~/2;//i除以2并向下取整
        if(index>=_suggestions.length){//如果是建议列表中最后一个单词对，再生成10个单词对
          _suggestions.addAll(generateWordPairs().take(10));//addAll方法用于拼接一个数组
        }
        return _buildRow(_suggestions[index]);//使用该方法构建每一行
      },
    );
  }

  Widget _buildRow(WordPair pair){
    final alreadySaved=_saved.contains(pair);
    return ListTile(
      title:Text(
        pair.asPascalCase,//首字母大写
        style:_biggerFont,
      ),
      trailing:Icon(
        alreadySaved?Icons.favorite:Icons.favorite_border,
        color:alreadySaved?Colors.red:null,
      ),
      onTap:(){
        setState((){
          if(alreadySaved){//已经在列表中再次点击移除
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      }
    );
  }
  //点击图标的回调
  void _pushSaved(){
    Navigator.of(context).push(//context哪里来的????
      MaterialPageRoute(
        builder:(context){
          final tiles=_saved.map((pair){
            return ListTile(
              title:Text(
                pair.asPascalCase,//首字母大写
                style:_biggerFont,
              ),
            );
          });
          final divided=ListTile.divideTiles(
            context: context,
            tiles:tiles,
          ).toList();//toList方法转成一个数组

          return Scaffold(
            appBar:AppBar(
              title:Text('Saved Suggestions'),
            ),
            body:ListView(children: divided)
          );
        }
      )
    );
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('Startup Name Generator'),
        actions: <Widget>[//标题栏右侧图标
          new IconButton(icon:Icon(Icons.list),onPressed: _pushSaved,)
        ],
      ),
      body:_buildSuggestions()
    );
  }
}