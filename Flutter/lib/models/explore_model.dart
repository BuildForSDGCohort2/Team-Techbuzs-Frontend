class ExploreItem {
  final int sdg;
  final int videos;
  final String y1;
  final String y2;

  ExploreItem({this.sdg, this.videos, this.y1, this.y2});

  ExploreItem.fromJson(Map<String, dynamic> map)
      : sdg = map["SDG"],
        videos = map["Videos"],
        y1 = map["y1"],
        y2 = map["y2"];
}
