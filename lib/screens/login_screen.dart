import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/color.dart';
import './signup_screen.dart';
import '../widgets/header_container.dart';
import '../providers/auth.dart';
import '../models/http_exception.dart';
import './homepage_screen.dart';
import './reset_screen.dart';
import './loading_screen.dart';

class LoginScreen extends StatefulWidget {

  static const routeName = '/login';
  
  
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // @override
  // void initState() {
  //   Provider.of<Auth>(context).logout();
  //   super.initState();
  // }

  final _form = GlobalKey<FormState>();
  var _isLoading = false;
  
  Map<String, String> _loginInfo = {
    'email': '',
    'password': '',
  };

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async{
    final validate = _form.currentState.validate();
    if(!validate){
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try{
      await Provider.of<Auth>(context, listen: false).login(
        _loginInfo['email'],
        _loginInfo['password'],
      );
      //Navigator.of(context).pushReplacementNamed(HomePageScreen.routeName);
    } on HttpException catch(error){
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')){
        errorMessage = 'This email address is already in use';
      } else if(error.toString().contains('INVALID_EMAIL')){
        errorMessage = 'This is not a valid email address';
      } else if(error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    }catch(error){
      const errorMessage = 'Could not authenticate you. Please try again later';
    }
    setState(() {
        _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return Scaffold(
      body: auth.isAuth ? HomePageScreen() : FutureBuilder(
        future: auth.tryAutoLogin(),
        builder: (ctx, authResultSnapshot) => authResultSnapshot.connectionState == ConnectionState.waiting 
        ?  LoadingScreen() :
      
      Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          children: <Widget>[
            HeaderContainer(text: 'Register', onClick: () {Navigator.of(context).pushReplacementNamed(SignUpScreen.routeName);},),
            Form(
              key: _form,
              child: Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          height: 40,
                          //padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.black12
                          ),
                          padding: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            //keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,                            
                            decoration: InputDecoration(
                              //contentPadding: EdgeInsets.only(top: 20, bottom: 14),
                              border: InputBorder.none,
                              hintText: 'Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please provide an email';
                              }
                              if(!value.contains('@') || !value.contains('.')){
                                return 'Invalid email';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _loginInfo['email'] = value;
                            },
                          ),
                        ),
                        Container(
                          height: 40,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.black12
                          ),
                          padding: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.vpn_key),
                            ),
                            validator: (value) {
                              if(value.isEmpty){
                                return 'Please provide a password';
                              }
                              if(value.length < 6){
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            onFieldSubmitted: (_) {
                              _submit();
                            },
                            onSaved: (value) {
                              _loginInfo['password'] = value;
                            },
                          ),
                        ),
                        //_textInput(hint: 'Email', icon: Icons.email),
                        //_textInput(hint: 'Password', icon: Icons.vpn_key),
                        FlatButton(
                          textColor: Colors.black,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => ResetScreen())
                            );
                          },
                        ),
                        
                        _isLoading 
                        ? Center(child: SpinKitFadingCircle(color: Colors.orange,))
                        : Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Center(
                              child: InkWell(
                                onTap: () {_submit();},
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          orangeColors,
                                          orangeLightColors,
                                        ],
                                        end: Alignment.centerLeft,
                                        begin: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(100),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                        'LOGIN',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                      ),
                                    ),
                                  ),
                              ),
                            ),
                          ),
                        
                        
                          Container(
                            margin: EdgeInsets.only(top: 55),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Don't have a account?"),
                                  Container(
                                    child: FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pushReplacementNamed(SignUpScreen.routeName);
                                      },
                                      child: Text(
                                        'Register',
                                        style: TextStyle(
                                          color: orangeColors,
                                          fontSize: 22,
                                        )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ),
                          
                    ],
                ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
    )
    );
  }

  Widget _textInput({controller,hint,icon}){
    return Container(
          height: 40,
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.black12
          ),
          padding: EdgeInsets.only(left: 10),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              prefixIcon: Icon(icon),
          ),
          ),
        );
  }
  
}

