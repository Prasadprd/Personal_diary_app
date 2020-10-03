import 'package:personal_diary/models/user.dart';
import 'package:personal_diary/screens/Authenticate/authentication.dart';
import 'package:personal_diary/screens/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
