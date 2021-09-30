import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

mixin FirestoreAbbreviations {
  var firestore = FirebaseFirestore.instance;
  var storage = FirebaseStorage.instance;
}
