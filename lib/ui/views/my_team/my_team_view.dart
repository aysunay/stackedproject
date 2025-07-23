import 'package:flutter/material.dart';
import 'package:stackedproject/ui/views/shared/shared_view.dart';

import 'my_team_viewmodel.dart';

class MyTeamView extends SharedView<MyTeamViewModel> {
  const MyTeamView({Key? key}) : super(key: key);

  @override
  // TODO: implement leftIcons
  List<Widget> get leftIcons => [Icon(Icons.abc)];
  @override
  MyTeamViewModel viewModelBuilder(BuildContext context) => MyTeamViewModel();

  @override
  Widget buildBody(BuildContext context, MyTeamViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: const Center(child: Text("MyTeamView")),
    );
  }
}
