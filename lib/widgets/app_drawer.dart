import '../screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../screens/homepage_screen.dart';
import '../screens/login_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Container(
                    margin: EdgeInsets.only(left: 55),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: AssetImage('assets/FitU_logo.png'),
                      ),
                    ),
                    height: 40,
                    width: 40,
                //     child: Image.asset(
                //   'assets/FitU_logo.png',
                //   height: 40,
                //   width: 40,
                // ),
            ),
            automaticallyImplyLeading: false,
          ),
          Divider(color: Theme.of(context).primaryColor,),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                HomePageScreen.routeName,
              );
            },
          ),
          Divider(color: Theme.of(context).primaryColor,),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text('Scheduler'),
            onTap: () {},
          ),
          Divider(color: Theme.of(context).primaryColor,),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Nutrition Plan'),
            onTap: () {},
          ),
          Divider(color: Theme.of(context).primaryColor,),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
              Provider.of<Auth>(context, listen: false).logout();
              //print(Provider.of<Auth>(context).token);
            },
          ),
        ],
      ),
    );
  }
}