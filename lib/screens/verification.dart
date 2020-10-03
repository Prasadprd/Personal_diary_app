import 'package:flutter/material.dart';
//import 'package:flutter_screen_lock/circle_input_button.dart';
import 'package:flutter_screen_lock/lock_screen.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic ifFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('firstTime');
    if (firstTime != null && !firstTime) {
      return showLockScreen(
        context: context,
        correctString: '1234',
        canBiometric: true,
        biometricButton: Icon(Icons.face),
        biometricAuthenticate: (context) async {
          final localAuth = LocalAuthentication();
          final didAuthenticate = await localAuth.authenticateWithBiometrics(
              localizedReason: 'Please authenticate');

          if (didAuthenticate) {
            return true;
          }

          return false;
        },
        onUnlocked: () {
          print('Unlocked.');
          Navigator.pushReplacementNamed(context, '/wrapper');
        },
      );
    } else {
      prefs.setBool('firstTime', false);
      return showConfirmPasscode(
        context: context,
        onCompleted: (context, verifyCode) {
          print(verifyCode);
          Navigator.pushReplacementNamed(context, '/wrapper');
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[800],
      body: Center(
        child: Text(
          'WELCOME',
          style: TextStyle(
            fontSize: 70,
            fontFamily: 'IndieFlower',
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FlatButton.icon(
          color: Colors.white,
          onPressed: () => ifFirstTime(),
          icon: Icon(
            Icons.navigate_next,
            color: Colors.red[800],
          ),
          label: Text(
            'Next',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.red[800],
            ),
          )),
    );
  }
}
