import 'package:personal_diary/models/dairy_data.dart';
import 'package:personal_diary/screens/Home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brew = Provider.of<List<Brew>>(context);

    return ListView.builder(
      itemCount: brew.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: brew[index]);
      },
    );
  }
}
