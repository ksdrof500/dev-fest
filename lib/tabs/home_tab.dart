import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/datas/speaker_data.dart';
import 'package:flutter_app/tiles/talk_tile.dart';

class HomeTab extends StatelessWidget {
  final vsync;

  HomeTab(this.vsync);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("speakers").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else
          return Container(
            child: TalkTile(vsync, SpeakerData().fromListDocument(snapshot.data.documents))
          );
      },
    );
  }
}
