import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        title: Text(
          'Personal Diary App',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          FlatButton.icon(
              onPressed: () {},
              icon: Icon(Icons.person),
              label: Text('Sign In')),
          FlatButton.icon(
            icon: Icon(Icons.search),
            onPressed: () {},
            label: Text(''),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/night.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red[800],
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        tooltip: 'Add a note',
      ),
    );
  }
}
