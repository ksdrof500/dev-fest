import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/datas/speaker_data.dart';

class SpeakerScreen extends StatefulWidget {

  final SpeakerData speaker;

  SpeakerScreen(this.speaker);

  @override
  _SpeakerScreenState createState() => _SpeakerScreenState(speaker);
}

class _SpeakerScreenState extends State<SpeakerScreen> {

  final SpeakerData speaker;

  _SpeakerScreenState(this.speaker);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme
        .of(context)
        .primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(speaker.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images: speaker.imageList.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              autoplay: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  speaker.title,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500
                  ),
                  maxLines: 3,
                ),
                Text(
                  speaker.description,
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor
                  ),
                ),
                SizedBox(height: 16.0,),
                SizedBox(
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.5
                    ),
                    children: speaker.speakerList.map(
                            (speaker) {
                              return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.0)),
                                      border: Border.all(
                                          color: primaryColor,
                                          width: 1.0
                                      )
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(speaker)
                              );
                        }
                    ).toList(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
