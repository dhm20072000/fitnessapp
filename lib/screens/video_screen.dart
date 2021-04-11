import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

import '../models/video.dart';
import '../widgets/video_item.dart';
//import '../widgets/chewie_listitem.dart';

class VideoScreen extends StatefulWidget {
  
  static const routeName = '/video';

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  var _isInitloaded = false;
  String categoryTitle;
  List<Video> listofvideos = [];

  @override
  void didChangeDependencies() {
    if(_isInitloaded == false){
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      _isInitloaded = true;
    }
    super.didChangeDependencies();
  }

  List<Video> getVideos(){
    switch(categoryTitle){
        case 'Abs':
          return abs;
        case 'Arm':
          return arm;
        case 'Back':
          return back;
        case 'Chest':
          return chest;
        case 'Glute':
          return glute;
        case 'Leg':
          return leg;
        case 'Shoulder':
          return shoulder;
        case 'Yoga':
          return yoga;
      }
      return null;
  }


  @override
  Widget build(BuildContext context) {
    // final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    // categoryTitle = routeArgs['title'];
    listofvideos = getVideos();
    print(listofvideos);
    return Scaffold(
      appBar: AppBar(title: Text('$categoryTitle exercises')),
     body: ListView(
              
        children: listofvideos.map((video) {
          return Container(
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0,4),
                  blurRadius: 6.0,
                  spreadRadius: 1,
                ),
              ],
            ),
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: InkWell(
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => VideoItem(video.url))
                //   );
                // },
                onTap: () => Container(
                  child: FlutterYoutube.playYoutubeVideoByUrl(
                          apiKey: 'AIzaSyCVg-cgWS60Fko0JSzi09m1qMkqAEsQex4',
                          videoUrl: video.url,
                          autoPlay: true,
                        ),
                ),
                child: ListTile(
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 50,
                      minHeight: 100,
                    ),
                    child: Image.network(video.imageUrl),
                  ),
                  title: Text(video.title, softWrap:true,),
              ),
              ),
            ),
          );
        }).toList(),
     ),
      
    );
  }
}