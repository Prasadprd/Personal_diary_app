//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Brew {
  final String title;
  final String emoji;
  final String note;
  final String id;
  String thisInstance = DateFormat.yMMMMEEEEd().format(DateTime.now());

  Brew({this.title, this.emoji, this.note, this.id});
}
