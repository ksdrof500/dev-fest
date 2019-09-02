import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/datas/speaker_data.dart';
import 'package:flutter_app/tiles/place_tile.dart';

class HomeTab extends StatelessWidget {
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
          return ListView(
            children:
              snapshot.data.documents.map((doc) =>
                    PlaceTile(SpeakerData.fromDocument(doc))).toList(),
          );
      },
    );
  }
}
