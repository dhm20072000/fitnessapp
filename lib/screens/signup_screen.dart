import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../widgets/header_container.dart';
import '../utils/color.dart';
import '../models/http_exception.dart';
import '../providers/auth.dart';
import './homepage_screen.dart';
import './login_screen.dart';

class SignUpScreen extends StatefulWidget {

  static const routeName = '/signup';
  
  
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _form = GlobalKey<FormState>();
  var _isLoading = false;

  //Pattern pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(r'(^(?:[+0]9)?[0-9]{10}$)');
  
  Map<String, String> _signupInfo = {
    'email': '',
    'password': '',
    'fullname': '',
    'phone': '',
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
      await Provider.of<Auth>(context, listen: false).signup(
        _signupInfo['email'],
        _signupInfo['password'],
      );
      await Provider.of<Auth>(context, listen: false).addUserInfo(
        _signupInfo['email'],
        _signupInfo['password'],
        _signupInfo['fullname'],
        _signupInfo['phone'],
      );
      _form.currentState.reset();
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
      body: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          children: <Widget>[
            HeaderContainer(text: 'Login', onClick: () {
              Provider.of<Auth>(context, listen: false).logout();
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },),
            Form(
              key: _form,
              child: Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          height: 40,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.black12
                          ),
                          padding: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,                      
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Full Name',
                              prefixIcon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if(value.isEmpty){
                                return 'Please provide your fullname';
                              }
                              if(value.length < 6){
                                return 'Fullname should be at least 6 characters';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _signupInfo['fullname'] = value;
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
                            textInputAction: TextInputAction.next,  
                            decoration: InputDecoration(
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
                              _signupInfo['email'] = value;
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
                            textInputAction: TextInputAction.next, 
                            keyboardType: TextInputType.phone, 
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Phone Number',
                              prefixIcon: Icon(Icons.call),
                            ),
                            validator: (value) {
                              if(value.isEmpty){
                                return 'Please provide your phone number';
                              }
                              if(!regExp.hasMatch(value)){
                                return 'only 10 numbers and no character';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _signupInfo['phone'] = value;
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
                            onSaved: (value) {
                              _signupInfo['password'] = value;
                            },
                            onFieldSubmitted: (_) {
                              _submit();
                            },
                          ),
                        ),
                        //_textInput(hint: 'Full Name', icon: Icons.person),
                        //_textInput(hint: 'Email', icon: Icons.email),
                        //_textInput(hint: 'Phone Number', icon: Icons.call),
                        //_textInput(hint: 'Password', icon: Icons.vpn_key),
                        
                        _isLoading 
                        ? Center(child: SpinKitFadingCircle(color: Colors.orange,))
                        : Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                _submit();
                              },
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
                                      'REGISTER',
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
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                auth.isAuth                                 
                                ? Text(
                                  "Success!!! Please click here to login",
                                  style: TextStyle(color: Colors.green),
                                )
                                : Text("Already a member?"),
                                Container(
                                  child: FlatButton(
                                    onPressed: () {
                                      Provider.of<Auth>(context, listen: false).logout();
                                      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                                      //Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Login',
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