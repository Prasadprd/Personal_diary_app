import 'package:personal_diary/models/dairy_data.dart';
import 'package:flutter/material.dart';
//import 'package:personal_diary/screens/AddNote/shownote.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
          onTap: () {
            return Navigator.pushNamed(context, '/shownote', arguments: brew);
          },
          child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: Text(
                brew.emoji,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              title: Text(brew.title),
              subtitle: Text(brew.note),
            ),
          )),
    );
  }
}
