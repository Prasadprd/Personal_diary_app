import 'package:flutter/material.dart';
import 'package:personal_diary/models/user.dart';

import 'package:personal_diary/screens/AddNote/shownote.dart';
import 'package:personal_diary/screens/Home/brew_tile.dart';
// import 'package:personal_diary/screens/Home/brew_list.dart';
import 'package:personal_diary/screens/Home/home.dart';
import 'package:personal_diary/screens/verification.dart';

import 'package:personal_diary/screens/wrapper.dart';
import 'package:personal_diary/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:personal_diary/screens/AddNote/addnote2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser>.value(
      value: AuthService().user,
      child: MaterialApp(home: MyHomePage(), routes: {
        '/home': (context) => Home(),
        '/addnote': (context) => Addnote(),
        '/shownote': (context) => ShowNote(),
        'bruetile': (context) => BrewTile(),
        '/wrapper': (context) => Wrapper(),
      }),
    );
  }
}
