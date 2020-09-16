class GoalAPI {
  final int goal;
  final String title;
  final String image;
  final String keywords;
  final String short;
  final Map<String, dynamic> target;

  GoalAPI(this.keywords,
      {this.goal, this.title, this.short, this.target, this.image});

  GoalAPI.fromJson(Map<String, dynamic> map)
      : goal = map['goal'],
        title = map['title'],
        keywords = map['keywords'],
        image = map['icon_url'],
        short = map['short'],
        target = map['target'];
}
