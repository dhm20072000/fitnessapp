import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/http_exception.dart';

class Auth with ChangeNotifier{
  String _token;
  DateTime _expiryDate;
  String _userId;
  Timer _authTimer;
  var _firstName;

  bool get isAuth {
    // print('The token is $token');
    print(token != null);
    return token != null;
  }

  String get token {
    if(_expiryDate != null && _expiryDate.isAfter(DateTime.now()) && _token != null){
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  String get firstName{
    //print('Fullname is $_fullname');
    return _firstName;
  }

  Future<void> _authenticate(String email, String password, String urlSegment) async {
    final url = 'https://identitytoolkit.googleapis.com/v1/$urlSegment?key=AIzaSyCFI3vR8i5VmgYbmDyduy4_BjuWV3_XrQw';
    try{
      final response = await http.post(Uri.parse(url), body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }));
      final responseData = json.decode(response.body);
      if(responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      //print(responseData);
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(Duration(seconds: int.parse(responseData['expiresIn'])));
      _autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _token,
        'userId': _userId,
        'expiryDate': _expiryDate.toIso8601String(),
      },);
      prefs.setString('userData', userData);

    } catch(error){
      throw error;
    }
    
    //print(json.decode(response.body));
  }

  Future<void> resetPassword(String email) async{
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=AIzaSyCFI3vR8i5VmgYbmDyduy4_BjuWV3_XrQw';
    try{
      final response = await http.post(Uri.parse(url), body: json.encode({
        'email': email,
        'requestType': 'PASSWORD_RESET',
      }));
      final responseData = json.decode(response.body);
      if(responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      notifyListeners();
    }catch (error){
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'accounts:signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'accounts:signInWithPassword');
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('userData')){
      return false;
    }

    final extractedUserData = json.decode(prefs.getString('userData')) as Map<String,Object>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

    if(expiryDate.isBefore(DateTime.now())){
      return false;
    }
    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _expiryDate = expiryDate;
    notifyListeners();
    _autoLogout();
    return true;

  }

  Future<void> logout() async{
    _token = null;
    _userId = null;
    _expiryDate = null;
    if(_authTimer != null){
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('userData');
    prefs.clear();
  }

  void _autoLogout() {
    if (_authTimer != null){
      _authTimer.cancel();
    }
    final timeToExpiry =_expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }

  Future<void> addUserInfo(String email, String password, String fullname, String phone) async{
    final url = 'https://fituapp-991a4-default-rtdb.firebaseio.com/users/$_userId.json?auth=$_token';
    try{
      final response = await http.post(Uri.parse(url), body: json.encode({
        'email': email,
        'password': password,
        'fullname': fullname,
        'phone': phone,
      }));
    } catch(error){
      throw error();
    }
    
  }

  Future<void> fetchUserInfo() async{
    final url = 'https://fituapp-991a4-default-rtdb.firebaseio.com/users/$_userId.json?auth=$_token';
    try{
      final response = await http.get(Uri.parse(url));
      final responseData = json.decode(response.body) as Map<String,dynamic>;
      if(responseData == null){
        return;
      }
      var fullname;
      //var firstName;
      for (var key in responseData.entries){
        fullname = (key.value['fullname']);
      }
      print('FULL NAME $fullname');
      var arr = fullname.split(' ');
      _firstName = arr[0];
      
      notifyListeners();
    } catch(error){
      throw error;
    }
  }

}

