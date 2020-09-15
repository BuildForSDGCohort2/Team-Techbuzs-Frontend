import 'package:Greeneva/ui/widgets/info_list/info_list.dart';
import 'package:Greeneva/viewmodels/info_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Info extends StatelessWidget {
  const Info({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InfoViewModel>.reactive(
      viewModelBuilder: () => InfoViewModel(),
      onModelReady: (model) => model.getGoals(),
      builder: (context, model, child) => SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 50,
          ),
          model.goals == null
              ? CircularProgressIndicator()
              : InfoList(goals: model.goals),
        ],
      )),
    );
  }
}
