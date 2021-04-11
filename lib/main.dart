import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/splash_screen.dart';
import './screens/login_screen.dart';
import './screens/signup_screen.dart';
import './providers/auth.dart';
import './screens/homepage_screen.dart';
import './utils/color.dart';
import './screens/video_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
          providers: [
            ChangeNotifierProvider<Auth>(
              create : (context) => Auth(),
              //value: Auth(),
            ),
          ],
          child: MaterialApp(
                  title: 'FitU App',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      primarySwatch: Colors.blue,
                  ),
                  home: SplashScreen(),
                  routes: {
                      LoginScreen.routeName: (ctx) => LoginScreen(),
                      SignUpScreen.routeName: (ctx) => SignUpScreen(),
                      HomePageScreen.routeName: (ctx) => HomePageScreen(),
                      SplashScreen.routeName: (ctx) => SplashScreen(),
                      VideoScreen.routeName: (ctx) => VideoScreen(),
                  },
      ),
          
          
          
          
    );
  }
}


