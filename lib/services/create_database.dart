import 'package:cloud_firestore/cloud_firestore.dart';

class CreateDatabase {
  String email;
  CollectionReference collection;
  CreateDatabase({this.email});
  void Create() {
    final CollectionReference collection =
        FirebaseFirestore.instance.collection(this.email);
  }

  CollectionReference getReference() {
    return collection;
  }
}
