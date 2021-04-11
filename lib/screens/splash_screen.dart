import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/color.dart';
import './login_screen.dart';
import '../providers/auth.dart';
import '../screens/homepage_screen.dart';

class SplashScreen extends StatefulWidget {

  static const routeName = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    
    super.initState();
    Timer(const Duration(milliseconds: 8000), () {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      // Navigator.push(
      //   context, MaterialPageRoute(builder: (context) => LoginScreen())
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    //final auth = Provider.of<Auth>(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              orangeColors,
              orangeLightColors,
            ],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/FitU_logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                height: 120,
                width: 120,
                //child: Image.asset('assets/FitU_logo.png'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Welcome to FitU',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: SpinKitFadingCircle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}