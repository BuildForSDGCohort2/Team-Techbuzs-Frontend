class Goals {
  final int position;
  final String name;
  final String iconImage;
  final String description;
  final String images;
  final List<dynamic> target;

  Goals(
      {this.position,
      this.name,
      this.iconImage,
      this.description,
      this.target,
      this.images});

  factory Goals.fromJson(Map<String, dynamic> json) {
    return Goals(
      position: json['goal'] as int,
      name: json['short'] as String,
      target: json['target'] as List<dynamic>,
      images: json['title'] as String,
      iconImage: json['icon_url'] as String,
      description: json['keywords'] as String,
    );
  }
}
