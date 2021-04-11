import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/color.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            orangeColors,
            orangeLightColors,
          ],
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
        )
      ),
      child: Center(
        child: Text(
          'Loading...', 
          style: TextStyle(fontSize: 25),
        ),  
      ),
    );
  }
}