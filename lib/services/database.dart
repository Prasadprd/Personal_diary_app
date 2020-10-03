import 'package:personal_diary/models/dairy_data.dart';
import 'package:personal_diary/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personal_diary/services/create_database.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class DatabaseService {
  final int counter;

  CollectionReference collection = CreateDatabase().collection ??
      FirebaseFirestore.instance.collection('newuser');

  DatabaseService({this.counter});

  Future<void> updateUserData(String emoji, String title, String note) async {
    print('Hey ');
    return await collection
        .doc(counter.toString())
        .set({'emoji': emoji, 'title': title, 'note': note, 'time': '10:30'});
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data);
      return Brew(
          title: doc.data()['title'] ?? '',
          note: doc.data()['note'] ?? '',
          emoji: doc.data()['emoji'] ?? '',
          id: doc.data()['id'] ?? '');
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: counter.toString(),
        title: snapshot.data()['title'],
        emoji: snapshot.data()['emoji'],
        note: snapshot.data()['note']);
  }

  // get brews stream

  Stream<List<Brew>> get brews {
    return collection.snapshots().map(_brewListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return collection
        .doc(counter.toString())
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
