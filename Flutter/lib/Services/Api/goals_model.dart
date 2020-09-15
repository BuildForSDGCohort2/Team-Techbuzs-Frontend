class GoalAPI {
  final int goal;
  final String title;
  final String image;
  final String short;
  final Map<String, dynamic> targets;

  GoalAPI({this.goal, this.title, this.short, this.targets, this.image});

  GoalAPI.fromJson(Map<String, dynamic> map)
      : goal = map['goal'],
        title = map['title'],
        image = map['icon_url'],
        short = map['short'],
        targets = map['target'];
}
