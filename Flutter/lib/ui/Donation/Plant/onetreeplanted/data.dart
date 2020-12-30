class TreeInfo {
  String region;
  String country;
  String name;
  String overview;
  String impact;
  String treespecies;
  String imagelink;
  List<dynamic> images;

  TreeInfo(
      {this.region,
      this.country,
      this.name,
      this.overview,
      this.impact,
      this.treespecies,
      this.imagelink,
      this.images});

  factory TreeInfo.fromJson(Map<String, dynamic> json) {
    return TreeInfo(
      region: json["region"] as String,
      country: json["country"] as String,
      name: json["name"] as String,
      overview: json["overview"] as String,
      treespecies: json["tree_species"] as String,
      impact: json["impact"] as String,
      imagelink: json["image_link"] as String,
      images: json["image_list"] as List,
    );
  }
}
