import 'package:cloud_firestore/cloud_firestore.dart';

class SpeakerData {
  String id;
  String title;
  String description;
  List speakerList;
  List imageList;

  SpeakerData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    speakerList = snapshot.data["speakers"];
    imageList = snapshot.data["images"];
  }

}