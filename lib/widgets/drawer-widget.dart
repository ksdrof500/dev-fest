import 'package:flutter/material.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
//identifica qual item foi selecionado
  int itemSelect = 0;

//Cria uma listview com os itens do menu
  Widget _listMenu() {
    return ListView(
      children: <Widget>[
        _avatar(),
        _tiles("Programacao", Icons.home, 0, () {}),
        _tiles("Palestrantes", Icons.grade, 1, () {}),
        _tiles("Sobre", Icons.home, 2, () {}),
        Divider(),
        _tiles("SAIR", Icons.arrow_back, 3, () {}),
        Divider(),
      ],
    );
  }

//cria cada item do menu
  Widget _tiles(String text, IconData icon, int item, Function onTap) {
    return ListTile(
      leading: Icon(icon),
      onTap: onTap,
      selected: item == itemSelect,
      title: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          child: _listMenu()),
    );
  }

  //cria o avatar com nome, email e imagem
  Widget _avatar() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
      height: 170.0,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 8.0,
            left: 0.0,
            child: Text(
              "DevFest\nSul",
              style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
              left: 0.0,
              bottom: 0.0,
              child: ScopedModelDescendant<UserModel>(
                builder: (context, child, model) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        child: Text(
                          !model.isLoggedIn()
                              ? "Entre ou cadastre-se >"
                              : "Sair",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          if (!model.isLoggedIn())
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                          else
                            model.signOut();
                        },
                      )
                    ],
                  );
                },
              ))
        ],
      ),
    );
  }
}
