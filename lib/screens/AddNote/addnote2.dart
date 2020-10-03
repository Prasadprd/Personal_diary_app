//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:personal_diary/shared/constants.dart';
import 'package:personal_diary/services/database.dart';
import 'package:intl/intl.dart';

class Addnote extends StatefulWidget {
  @override
  _AddnoteState createState() => _AddnoteState();
}

class _AddnoteState extends State<Addnote> {
  //DateFormat dateFormat = DateFormat('yMMMd');
  String dateToday = DateFormat.yMMMMEEEEd().format(DateTime.now());

  final List<String> emoji = [
    '😊',
    '😍',
    '🤢',
    '😢',
    '😡',
    '😭',
    '😂',
    '😠',
    '😴'
  ];

  String _currentTitle;
  String _currentEmoji;
  String _currentNote;
  String docId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add A note',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[800],
        actions: [
          FlatButton.icon(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setInt('docId', prefs.getInt('docId') ?? 0);
              await DatabaseService()
                  .collection
                  .doc(prefs.getInt('docId').toString())
                  .set({
                'emoji': _currentEmoji,
                'title': _currentTitle,
                'note': _currentNote,
                'time': dateToday,
                'id': docId
              });
              docId = prefs.getInt('docId').toString();
              prefs.setInt('docId', prefs.getInt('docId') + 1);

              Navigator.pop(context);
            },
            icon: Icon(Icons.save),
            label: Text('SAVE'),
          )
        ],
      ),
      body: Form(
        // key: _formKey,

        child: Container(
          color: Colors.red[200],
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(dateToday.toString()),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Title'),
                  // validator: (val) =>
                  //     val.isEmpty ? 'Please enter a title' : null,
                  onChanged: (val) => setState(() => _currentTitle = val),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Select your mood from the list',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                  value: _currentEmoji ?? '😊',
                  decoration: textInputDecoration,
                  items: emoji.map((emoji) {
                    return DropdownMenuItem(
                      value: emoji,
                      child: Text('$emoji'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentEmoji = val),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Write more here'),
                  // validator: (val) =>
                  //     val.isEmpty ? 'Please enter a title' : null,
                  onChanged: (val) => setState(() => _currentNote = val),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
