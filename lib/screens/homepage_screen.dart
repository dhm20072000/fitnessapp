import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../providers/auth.dart';
import '../models/category.dart';
import '../widgets/category_item.dart';

class HomePageScreen extends StatefulWidget {

  static const routeName = '/homepage';
  
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  var _isLoading = false;
  var _isInit = true;
  @override
  void didChangeDependencies() {
    if(_isInit){
      setState(() {
        _isLoading = true;
      });
      Provider.of<Auth>(context).fetchUserInfo().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    
    super.didChangeDependencies();
  }

  String greeting() {
    final hour = DateTime.now().hour;
    if(hour < 12){
      return 'Good morning';
    }
    else if(hour < 17){
      return 'Good afternoon';
    }
    else{
      return 'Good evening';
    }
  }

  String timepic() {
    final hour = DateTime.now().hour;
    if(hour < 12){
      return 'assets/morning.png';
    }
    else if(hour < 17){
      return 'assets/afternoon.png';
    }
    else{
      return 'assets/evening.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    final hour = greeting();
    final pic = timepic();
    return Scaffold(
        //appBar: AppBar(title: Text('$hour ${auth.firstName}!')),
        appBar: AppBar(title: Text('Welcome!'),),
        drawer: AppDrawer(),
        body: _isLoading
        ? Center(child: SpinKitFadingCircle(color: Colors.blue,),)
        : Container(
          child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                            image: AssetImage(pic),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 15,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '$hour \n${auth.firstName}!',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Center(
                  child: Text('Pick a category for your workout'),
                ),
                SizedBox(height: 8,),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    children: categories.map((category) => CategoryItem(
                      category.title, category.image
                    )).toList(),
                  ),
                ),
              ],
            ),
        ),
      );  
  }
}

