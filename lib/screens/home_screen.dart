import 'package:flutter/material.dart';
import 'package:flutter_app/tabs/home_tab.dart';
import 'package:flutter_app/tabs/info_tab.dart';
import 'package:flutter_app/widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  var _current_tab = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.grey[200],
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Container(
//              child: new SearchWidget(),
                ),
            new Expanded(child: _getContent(_current_tab))
          ],
        ),
      ),
      bottomNavigationBar: new BottomNavigation(
          onTabNavigationBottom), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _getContent(index) {
    Widget content;
    switch (index) {
      case 0:
        content = new HomeTab(this);
        break;
      case 1:
//        content = new ContentNewsPage(this);
        break;
      default:
        {
          content = new InfoTab(new AnimationController(
              vsync: this, duration: new Duration(milliseconds: 500)));
          (content as InfoTab).animationController.forward();
        }
    }

    return content;
  }

  onTabNavigationBottom(index) {
    if (index != _current_tab) {
      setState(() {
        _current_tab = index;
      });
    }
  }
}
