import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {


  late final String uid;
  DataBaseService({required this.uid});


  // collection reference (Having a reference to a particular collection in the database)
  // We have a collection reference to a collection named "Faculty" in our Firebase Firestore Cloud
  final CollectionReference FacultyCollection = FirebaseFirestore.instance.collection('Faculty');



}