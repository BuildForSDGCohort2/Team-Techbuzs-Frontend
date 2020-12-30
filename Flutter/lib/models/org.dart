class OperationModel {
  String name;
  String selectedIcon;

  OperationModel(this.name, this.selectedIcon);
}

List<OperationModel> datas = operationsData
    .map((item) => OperationModel(item['name'], item['selectedIcon']))
    .toList();

var operationsData = [
  {
    "name": "OneTreePlanted",
    "selectedIcon": "assets/treeinit.png",
  },
  {
    "name": "T.R.E.E Iniative Nigeria",
    "selectedIcon": "assets/onetree.png",
  },
  {
    "name": "STANDUPTOCHILDABUSE",
    "selectedIcon": "assets/stc.png",
  },
];
