class Goals {
  final int position;
  final String name;
  final String iconImage;
  final String linkImage;
  final String description;
  final dynamic color;
  final String title;
  final Map<String, dynamic> target;

  Goals(
      {this.position,
      this.name,
      this.color,
      this.iconImage,
      this.description,
      this.linkImage,
      this.target,
      this.title});

  factory Goals.fromJson(Map<String, dynamic> json) {
    return Goals(
      position: json['goal'] as int,
      name: json['short'] as String,
      color: json['color'] as dynamic,
      target: json['target'] as Map<String, dynamic>,
      title: json['title'] as String,
      linkImage: json['link_image'] as String,
      iconImage: json['icon_url'] as String,
      description: json['keywords'] as String,
    );
  }
}
