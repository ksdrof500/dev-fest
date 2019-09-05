import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  final Function onTap;

  const HomeScreen({Key key, this.onTap}) : super(key: key);

  @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();

}

class _DrawerWidgetState extends State<HomeScreen> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Drawer"),
        leading: GestureDetector(
            onTap: widget.onTap,
            child: Icon(Icons.menu)),
      ),
      body: Center(
        child: Text("Tela Inicial"),
      ),
    );
  }
}
