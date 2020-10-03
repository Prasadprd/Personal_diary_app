import 'package:flutter/material.dart';
import 'package:personal_diary/models/dairy_data.dart';
//import 'package:personal_diary/screens/AddNote/addnote.dart';
import 'package:personal_diary/services/auth.dart';
import 'package:personal_diary/screens/Home/brew_list.dart';
import 'package:personal_diary/services/database.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      catchError: (context, error) {
        print('error');
        return error;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[800],
          title: Text(
            'Personal Diary App',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          actions: [
            FlatButton.icon(
                onPressed: () async {
                  await AuthService().logOut();
                },
                icon: Icon(Icons.person),
                label: Text('logout')),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/red2.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: BrewList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // final prefs = await SharedPreferences.getInstance();
            // prefs.setInt('counter', 0);

            // await DatabaseService(counter: prefs.getInt('counter') ?? 0)
            //     .updateUserData('0', 'new crew member', '');
            // prefs.setInt('counter', prefs.getInt('counter') + 1 ?? 1);
            Navigator.pushNamed(context, '/addnote');
            //return BrewList();
          },
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: Colors.red[500],
          ),
          tooltip: 'Add a note',
        ),
      ),
    );
  }
}
