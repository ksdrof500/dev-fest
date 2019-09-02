import 'package:flutter/material.dart';
import 'package:flutter_app/datas/speaker_data.dart';
import 'package:flutter_app/screens/speaker_screen.dart';

class PlaceTile extends StatelessWidget {
  final SpeakerData speakerData;

  PlaceTile(this.speakerData);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SpeakerScreen(speakerData)));
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 100.0,
              child: Image.network(
                speakerData.imageList.first,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    speakerData.title,
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                  ),
                  Text(
                    speakerData.speakerList.first,
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                  ),
                  Text(
                    speakerData.description,
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.end,
//            children: <Widget>[
//              FlatButton(
//                child: Text("Ver no Mapa"),
//                textColor: Colors.blue,
//                padding: EdgeInsets.zero,
//                onPressed: (){
//                  launch("https://www.google.com/maps/search/?api=1&query=${snapshot.data["lat"]},"
//                      "${snapshot.data["long"]}");
//                },
//              ),
//              FlatButton(
//                child: Text("Ligar"),
//                textColor: Colors.blue,
//                padding: EdgeInsets.zero,
//                onPressed: (){
//                  launch("tel:${snapshot.data["phone"]}");
//                },
//              ),
//            ],
//          )
          ],
        ),
      ),
    );
  }
}
