import 'package:flutter/material.dart';
import 'package:flutter_app/tabs/home_tab.dart';
import 'package:flutter_app/tabs/info_tab.dart';
import 'package:flutter_app/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text("Palestras"),
            centerTitle: true,
          ),
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
//        Scaffold(
//          appBar: AppBar(
//            title: Text("Produtos"),
//            centerTitle: true,
//          ),
//          drawer: CustomDrawer(_pageController),
//          body: ProductsTab(),
//          floatingActionButton: CartButton(),
//        ),
//        Scaffold(
//          appBar: AppBar(
//            title: Text("Lojas"),
//            centerTitle: true,
//          ),
//          body: PlacesTab(),
//          drawer: CustomDrawer(_pageController),
//        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Info"),
            centerTitle: true,
          ),
          body: InfoTab(),
          drawer: CustomDrawer(_pageController),
        )
      ],
    );
  }
}
