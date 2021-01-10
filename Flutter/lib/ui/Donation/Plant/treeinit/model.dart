class TreeInit {
  String name;
  String selectedIcon;
  String info;
  String goals;

  TreeInit(this.name, this.selectedIcon, this.info, this.goals);
}

List<TreeInit> datas = operationsData
    .map((item) => TreeInit(
        item['name'], item['selectedIcon'], item['info'], item['goals']))
    .toList();

var operationsData = [
  {
    "name": "North Region",
    "selectedIcon": "assets/g.png",
    "Target": "1000",
    "info":
        "The Rural Environmental Empowerment Initiative (T.R.E.E. Initiative) is a Nigerian registered non-proﬁt, non-government, non-political volunteer based advocacy organization actively committed to mitigating climate change via climate actions in thematic areas such as tree planting (afforestation, agroforestry & re-vegetation), food security and sustainable livelihood. \n As part of our climate action advocacy, T.R.E.E. Initiative have been promoting interventions particularly as regards the protection of the environment from degradation, carbon sequestration via massive tree planting, food security via the introduction and promotion of climate smart agriculture to rural smallholder farmers and promoting strategies that can sustain rural economic livelihood in communities across Nigeria. \n T.R.E.E. Initiative have been able to set up a few self-help, long term afforestation and sustainable forest management programs to create national awareness on the need to mitigate the negative consequences of climate change caused by indiscriminate deforestation. \n The primary focus here is to reach out to institutions, communities and smallholder farmer clusters across the country particularly in areas where deforestation has become a major concern as a result of the indiscriminate felling of trees and depletion of forest resources due to the booming business of charcoal production for domestic use, industrial use and for export. We are currently working on the following programs to reach our goal of planting and nurturing 10 million trees by 2025:"
  },
  {
    "name": "South Region",
    "goals": "200",
    "selectedIcon": "assets/onetree.png",
    "info":
        "The Rural Environmental Empowerment Initiative (T.R.E.E. Initiative) is a Nigerian registered non-proﬁt, non-government, non-political volunteer based advocacy organization actively committed to mitigating climate change via climate actions in thematic areas such as tree planting (afforestation, agroforestry & re-vegetation), food security and sustainable livelihood. \n As part of our climate action advocacy, T.R.E.E. Initiative have been promoting interventions particularly as regards the protection of the environment from degradation, carbon sequestration via massive tree planting, food security via the introduction and promotion of climate smart agriculture to rural smallholder farmers and promoting strategies that can sustain rural economic livelihood in communities across Nigeria. \n T.R.E.E. Initiative have been able to set up a few self-help, long term afforestation and sustainable forest management programs to create national awareness on the need to mitigate the negative consequences of climate change caused by indiscriminate deforestation. \n The primary focus here is to reach out to institutions, communities and smallholder farmer clusters across the country particularly in areas where deforestation has become a major concern as a result of the indiscriminate felling of trees and depletion of forest resources due to the booming business of charcoal production for domestic use, industrial use and for export. We are currently working on the following programs to reach our goal of planting and nurturing 10 million trees by 2025:"
  },
];
