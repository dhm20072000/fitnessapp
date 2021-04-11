import 'package:flutter/material.dart';

import '../utils/color.dart';

class HeaderContainer extends StatelessWidget {
  final String text;
  final Function onClick;

  HeaderContainer({this.text, this.onClick});
  @override
  Widget build(BuildContext context) {
    

    return Container(
            height: MediaQuery.of(context).size.height*0.4,
            decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                orangeColors,
                orangeLightColors,
              ],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100)
            ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: FlatButton(
                      onPressed: onClick,
                      child: Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                  )
                ),
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
              ],
            ),
          );
  }
}