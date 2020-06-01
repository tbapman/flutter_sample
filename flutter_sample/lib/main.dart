import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import './prac/first_app.dart';
import './prac/second_app.dart';
import './prac/scaffold_sample1.dart';
import './prac/scaffold_sample2.dart';
import './prac/scaffold_sample3.dart';
import './prac/scaffold_sample4.dart';
import './prac/scaffold_sample5.dart';
import './prac/bottom_navigation_bar.dart';
import './prac/drawer_demo.dart';

import './prac/button/raised_button_sample.dart';
import './prac/button/floating_action_button_sample.dart';
import './prac/button/flat_button.dart';
import './prac/button/icon_button_sample.dart';

import './prac/future/basic_demo.dart';
import './prac/future/infinite_list_view.dart';
import './prac/future/infinite_grid_view.dart';
import './prac/future/custom_scroll_view_test_route.dart';
import './prac/future/scroll_controller_test_route.dart';
import './prac/scroll_notification_test_route.dart';

import './prac/will_pop_scope_test_route.dart';
import './prac/color_luminance.dart';
import './prac/theme_test_route.dart';
import './prac/dialog_sample.dart';
import './prac/show_custom_dialog.dart';
import './prac/drag_sample.dart';
import './prac/scale_sample.dart';

import './prac/animation/animation_sample.dart';
import './prac/animation/hero_ainmation_sample.dart';
import './prac/animation/stagger_animation.dart';
import './prac/animation/animated_switcher_counter_route.dart';
import './prac/gradient_button_route.dart';
import './prac/turn_box_test.dart';
import './prac/custom_paint_toute.dart';
import './prac/gradient_circular_progress_route.dart';

//whatsApp
import './whatsApp/main.dart';

//todo
// import './todo/main.dart';
import './prac/camera_sample.dart';
List<CameraDescription> cameras = [];
Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => FirstScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/one': (context) => FirstApp(),
      '/two': (context) => SecondApp(),
      '/three': (context) => ScaffoldSample1(),
      '/four': (context) => ScaffoldSample2(),
      '/five': (context) => BaiscAppBarSample(),
      '/six': (context) => AppBarBottomSample(),
      '/seven': (context) => TabbedAppBar(),
      '/eight': (context) => BottomNavigationBarSample(),
      '/nine': (context) => DrawerDemo(),
      '/ten': (context) => RaiseButtonSample(),
      '/eleven': (context) => FloatingActionButtonSample(),
      '/twelve': (context) => FlatButtonExapmle(),
      '/thirteen': (context) => IconButtonSample(),
      '/fourteen': (context) => BasicDemo(),
      '/fifteen': (context) => InfiniteListView(),
      '/sixteen': (context) => InfiniteGridView(),
      '/seventeen': (context) => CustomScrollViewTestRoute(),
      '/eighteen': (context) => ScrollControllerTestRoute(),
      '/nineteen': (context) => ScrollNotificationTestRoute(),
      '/twenty': (context) => WillPopScopeTestRoute(),
      '/twenty-one': (context) => ColorLuminance(),
      '/twenty-two': (context) => ThemeTestRoute(),
      '/twenty-three': (context) => ShowCustomDialog(),
      '/twenty-four': (context) => DialogSample(),
      '/twenty-five': (context) => DragSample(),
      '/twenty-six': (context) => ScaleTextRoute(),
      '/twenty-seven': (context) => ScaleAnimationRoute(),
      '/twenty-eight': (context) => HeroAnimationRoute(),
      '/twenty-nine': (context) => StaggerAnimation(),
      '/thirty': (context) => AnimatedSwitcherCounterRoute(),
      '/thirty-one': (context) => GradientButtonRoute(),
      '/thirty-two': (context) => TurnBoxRoute(),
      '/thirty-three': (context) => CustomPaintRoute(),
      '/thirty-four': (context) => GradientCircularProgressRoute(),
      '/thirty-five': (context) => WhatsApp(cameras:cameras),
      '/thirty-six': (context) => CameraScreen(cameras),
      // '/thirty-seven': (context) => ToDo(),
    },
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text('todo'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/thirty-seven');
            },
          ),
          RaisedButton(
            child: Text('Camera实例'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/thirty-six');
            },
          ),
            RaisedButton(
            child: Text('WhatsApp'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/thirty-five');
            },
          ),
           RaisedButton(
            child: Text('圆形渐变进度条'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/thirty-four');
            },
          ),
           RaisedButton(
            child: Text('五子棋'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/thirty-three');
            },
          ),
            RaisedButton(
            child: Text('自定义旋转'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/thirty-two');
            },
          ),
            RaisedButton(
            child: Text('按钮封装'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/thirty-one');
            },
          ),
           RaisedButton(
            child: Text('通用动画切换'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/thirty');
            },
          ),
           RaisedButton(
            child: Text('交织动画'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/twenty-nine');
            },
          ),
          RaisedButton(
            child: Text('飞行组件'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/twenty-eight');
            },
          ),
          RaisedButton(
            child: Text('基本动画'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/twenty-seven');
            },
          ),
          RaisedButton(
            child: Text('图片缩放'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/twenty-six');
            },
          ),
          RaisedButton(
            child: Text('拖拽'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/twenty-five');
            },
          ),
          RaisedButton(
            child: Text('对话框'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/twenty-four');
            },
          ),
          RaisedButton(
            child: Text('自定义对话框'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/twenty-three');
            },
          ),
          RaisedButton(
            child: Text('路由换肤'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/twenty-two');
            },
          ),
          RaisedButton(
            child: Text('颜色亮度'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/twenty-one');
            },
          ),
          RaisedButton(
            child: Text('导航返回拦截'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/twenty');
            },
          ),
          RaisedButton(
            child: Text('滚动百分比'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/nineteen');
            },
          ),
          RaisedButton(
            child: Text('滚动监听'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/eighteen');
            },
          ),
          RaisedButton(
            child: Text('自定义滚动'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/seventeen');
            },
          ),
          RaisedButton(
            child: Text('网格'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/sixteen');
            },
          ),
          RaisedButton(
            child: Text('无限上拉列表'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/fifteen');
            },
          ),
          RaisedButton(
            child: Text('获取网络数据'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/fourteen');
            },
          ),
          RaisedButton(
            child: Text('按钮之Icon Button'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/thirteen');
            },
          ),
          RaisedButton(
            child: Text('按钮之Flat Button'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/twelve');
            },
          ),
          RaisedButton(
            child: Text('按钮之Floating Action Button'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/eleven');
            },
          ),
          RaisedButton(
            child: Text('按钮之Raised Button'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/ten');
            },
          ),
          RaisedButton(
            child: Text('抽屉'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/nine');
            },
          ),
          RaisedButton(
            child: Text('底部导航栏'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/eight');
            },
          ),
          RaisedButton(
            child: Text('选项卡式的AppBar'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/seven');
            },
          ),
          RaisedButton(
            child: Text('具有自定义底部widget的AppBar'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/six');
            },
          ),
          RaisedButton(
            child: Text('Scaffold组件3'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/five');
            },
          ),
          RaisedButton(
            child: Text('Scaffold组件2'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/four');
            },
          ),
          RaisedButton(
            child: Text('Scaffold组件'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/three');
            },
          ),
          RaisedButton(
            child: Text('布局'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/two');
            },
          ),
          RaisedButton(
            child: Text('第一个组件'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/one');
            },
          ),
        ],
      ),
    );
  }
}


