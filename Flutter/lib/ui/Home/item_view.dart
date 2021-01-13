import 'package:Greeneva/models/explore_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final double expanded_height = 250;

final double rounded_container_height = 50;

class ItemView extends StatefulWidget {
  final ExploreItem model;

  ItemView({this.model});

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  YoutubePlayerController _controller;
  YoutubePlayerController _controller1;

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
    _controller1 = YoutubePlayerController(
      initialVideoId: widget.model.y2,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
      ),
    );
  }

  Widget _buildSliverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
          expanded_height, rounded_container_height, _controller),
    );
  }

  Widget _buildDetail() {
    return Container(
      child: Column(
        children: [
          Text("Sustainable Development Goal: ${widget.model.sdg}"),
          SizedBox(
            height: 30,
          ),
          Card(
            // shape: ShapeBorder.lerp(a, b, t),
            elevation: 2,
            child: YoutubePlayer(
              controller: _controller1,
              showVideoProgressIndicator: true,
              onReady: () {
                print('Player is ready.');
              },
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              _buildSliverHead(),
              SliverToBoxAdapter(
                child: _buildDetail(),
              )
            ],
          ),
        ],
      ),
      // body: Contao,
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double rounded_container_height;
  final YoutubePlayerController _controller;
  DetailSliverDelegate(
      this.expandedHeight, this.rounded_container_height, this._controller);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Stack(
        children: <Widget>[
          Hero(
            tag: "https://techbuzs.github.io/I/A.png",
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () {
                print('Player is ready.');
              },
            ),
          ),
          Positioned(
            top: expandedHeight - rounded_container_height - shrinkOffset,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: rounded_container_height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          Positioned(
            top: expandedHeight - 120 - shrinkOffset,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Donate to Help the Global Goals!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
