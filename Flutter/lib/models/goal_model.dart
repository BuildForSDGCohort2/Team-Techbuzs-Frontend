class Goals {
  final int position;
  final String name;
  final String iconImage;
  final String description;
  final String title;
  final Map<String, dynamic> target;

  Goals(
      {this.position,
      this.name,
      this.iconImage,
      this.description,
      this.target,
      this.title});

  factory Goals.fromJson(Map<String, dynamic> json) {
    return Goals(
      position: json['goal'] as int,
      name: json['short'] as String,
      target: json['target'] as Map<String, dynamic>,
      title: json['title'] as String,
      iconImage: json['icon_url'] as String,
      description: json['keywords'] as String,
    );
  }
}
