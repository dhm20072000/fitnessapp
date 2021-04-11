import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../models/http_exception.dart';
import '../providers/auth.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {

  final _form = GlobalKey<FormState>();
  var _isLoading = false;
  var _snackBar = false;

  Map<String, String> _resetInfo = {
    'email': '',
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

  // void _showSnackBar(){
  //   Scaffold.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('Successfully reset! Please check you email'),
  //       duration: Duration(seconds: 4),
  //     )
  //   );
  // }

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
      await Provider.of<Auth>(context, listen: false).resetPassword(
        _resetInfo['email']
      );
      setState(() {
         _snackBar = true;
      });
      
      _form.currentState.reset();
      
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
      setState(() {
         _snackBar = false;
      });
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
    return Scaffold(
      appBar: AppBar(title: Text('Reset Password'),),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                TextFormField(                        
                  decoration: InputDecoration(
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
                    _resetInfo['email'] = value;
                  },
                  onFieldSubmitted: (_) {
                    _submit();
                  },
                ),
                SizedBox(height: 10),
                _isLoading
                ? SpinKitFadingCircle(
                    color: Colors.blue,
                  )
                : RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Reset Password',
                  ),
                  onPressed: () {
                    _submit();
                  },
                ),
                SizedBox(height: 20,),
                _snackBar
                ? Text('Sucessfully reset! Please check your email.')
                : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}