import 'package:flutter/material.dart';

import 'package:personal_diary/models/dairy_data.dart';

class ShowNote extends StatelessWidget {
  Brew data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Container(
        color: Colors.red[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Text(
                'Date :${data.thisInstance}',
                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.red[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Your mood that day:',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey[800],
                        fontFamily: 'AmaticsSC-Regular'),
                  ),
                  SizedBox(width: 0),
                  Text(
                    data.emoji,
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              margin: EdgeInsets.all(20),
              child: Text(
                data.title,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              margin: EdgeInsets.all(20),
              child: Text(
                data.note,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
