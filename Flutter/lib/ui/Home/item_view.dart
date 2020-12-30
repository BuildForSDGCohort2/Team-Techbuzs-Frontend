import 'package:Greeneva/models/explore_model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ItemView extends StatefulWidget {
  final ExploreItem model;

  ItemView({this.model});

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  YoutubePlayerController _controller;
  YoutubePlayerController _controller2;
  bool showy2 = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.model.y1,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
    _controller2 = YoutubePlayerController(
      initialVideoId: widget.model.y2,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () {
              print('Player is ready.');
            },
          ),
          SizedBox(
            height: 30,
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                showy2 = true;
              });
            },
            child: Text("Show more!"),
          ),
          SizedBox(
            height: 20,
          ),
          showy2 == true
              ? YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  onReady: () {
                    print('Player is ready.');
                  },
                )
              : SizedBox(height: 0)
        ],
      ),
    );
  }
}
