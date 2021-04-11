import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class VideoItem extends StatelessWidget {
  final String url;

  VideoItem(this.url);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterYoutube.playYoutubeVideoByUrl(
              apiKey: 'AIzaSyCVg-cgWS60Fko0JSzi09m1qMkqAEsQex4',
              videoUrl: url,
            ),
    );
  }
}

// class VideoItem extends StatefulWidget {

//   final String url;

//   VideoItem(this.url);

//   @override
//   _VideoItemState createState() => _VideoItemState();
// }

// class _VideoItemState extends State<VideoItem> {

  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FlutterYoutube.playYoutubeVideoByUrl(
//               apiKey: 'AIzaSyCVg-cgWS60Fko0JSzi09m1qMkqAEsQex4',
//               videoUrl: widget.url,
//             ),
//     );
//   }
// }