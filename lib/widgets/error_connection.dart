import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorConnection extends StatelessWidget {

  ErrorConnection();

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 8.0,
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.cloud_off,
              size: 100.0,
              color: Colors.blue,
            ),
            new Text(
              "Erro de conexão",
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: new RaisedButton(
                onPressed: () {
//                    ΩloadNewsRecent
                },
                child: new Text("TENTAR NOVAMENTE"),
                color: Colors.blue,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
