class OperationModel {
  String name;
  String selectedIcon;
  String info;
  String goals;

  OperationModel(this.name, this.selectedIcon, this.info, this.goals);
}

List<OperationModel> datas = operationsData
    .map((item) => OperationModel(
        item['name'], item['selectedIcon'], item['info'], item['goals']))
    .toList();

var operationsData = [
  {
    "name": "TechBuzs NGO",
    "selectedIcon": "assets/g.png",
    "goals": "3",
    "info":
        "Techbuzs NGO is an NGO which aims to help achieve the Sustainable Development Goals by the UN"
  },
  {
    "name": "OneTreePlanted",
    "goals": "15",
    "selectedIcon": "assets/onetree.png",
    "info":
        "One Tree Planted is a 501 charity with a mission to help global reforestation efforts. The organization is built on a network of individuals, businesses, and schools who either donate monitarily or volunteer to help plant trees around the world. As an environmental charity, we are dedicated to making it easier for individuals and businesses to give back to the environment, create a healthier climate, protect biodiversity and help reforestation efforts around the world. All by planting trees! \n Started in 2014, we have more than doubled the number of trees planted year over year. Fast-forward to today, we now work with awesome reforestations partners in North America, South America, Asia, and Africa who help us get trees in the ground to restore forests after fires and floods, create jobs, build communities, and protect habitat for biodiversity."
  },
  {
    "name": "T.R.E.E Iniative Nigeria",
    "selectedIcon": "assets/treeinit.png",
    "goals": "15",
    "info":
        "The Rural Environmental Empowerment Initiative (T.R.E.E. Initiative) is a Nigerian registered non-proﬁt, non-government, non-political volunteer based advocacy organization actively committed to mitigating climate change via climate actions in thematic areas such as tree planting (afforestation, agroforestry & re-vegetation), food security and sustainable livelihood. \n As part of our climate action advocacy, T.R.E.E. Initiative have been promoting interventions particularly as regards the protection of the environment from degradation, carbon sequestration via massive tree planting, food security via the introduction and promotion of climate smart agriculture to rural smallholder farmers and promoting strategies that can sustain rural economic livelihood in communities across Nigeria. \n T.R.E.E. Initiative have been able to set up a few self-help, long term afforestation and sustainable forest management programs to create national awareness on the need to mitigate the negative consequences of climate change caused by indiscriminate deforestation. \n The primary focus here is to reach out to institutions, communities and smallholder farmer clusters across the country particularly in areas where deforestation has become a major concern as a result of the indiscriminate felling of trees and depletion of forest resources due to the booming business of charcoal production for domestic use, industrial use and for export. We are currently working on the following programs to reach our goal of planting and nurturing 10 million trees by 2025:"
  },
  {
    "name": "STANDUPTOCHILDABUSE",
    "selectedIcon": "assets/stc.png",
    "goals": "6",
    "info":
        "STANDUPTOCHILDABUSE is an NGO setup to spread awareness about the current dangers of Child Abuse. It falls under the SDG #16. We cannot hope for sustainable development without peace, stability, human rights, and effective governance, based on the rule of law. Yet our world is increasingly divided. Some regions enjoy peace, security, and prosperity, while others fall into seemingly endless cycles of conflict and violence. This is not inevitable and must be addressed"
  },
];
