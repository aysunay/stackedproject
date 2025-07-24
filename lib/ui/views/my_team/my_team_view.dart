import 'package:flutter/material.dart';
import 'package:stackedproject/ui/common/ui_helpers.dart';
import 'package:stackedproject/ui/views/shared/shared_view.dart';
import 'package:stackedproject/model/technician_model.dart';

import 'my_team_viewmodel.dart';

class MyTeamView extends SharedView<MyTeamViewModel> {
  const MyTeamView({Key? key}) : super(key: key);

  @override
  String? get title => "myTeam";

  @override
  List<Widget> get leftIcons => [const Icon(Icons.abc)];

  @override
  MyTeamViewModel viewModelBuilder(BuildContext context) => MyTeamViewModel();

  @override
  Widget buildBody(BuildContext context, MyTeamViewModel viewModel) {
    final List<Technician> teamList = [
      Technician(
        id: "123",
        name: "Aysun Ay",
        role: "intern",
        contact: "12345567",
        status: "active",
        photoUrl: "",
      ),
      Technician(
        id: "124",
        name: "Zeynep Ay",
        role: "intern",
        contact: "98765432",
        status: "active",
        photoUrl: "",
      ),
    ];
    return Container(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: ListView.separated(
        itemCount: teamList.length,
        separatorBuilder: (context, index) => verticalSpaceSmall,
        itemBuilder: (context, index) {
          var technician = teamList[index];
          return ListTile(
            leading: technician.photoUrl != null && technician.photoUrl!.isNotEmpty
                ? CircleAvatar(
              backgroundImage: NetworkImage(technician.photoUrl!),
              radius: 24,
            )
                : const CircleAvatar(
              radius: 24,
              backgroundColor: Color(0xFFEEEEEE),
              child: Icon(Icons.person, color: Colors.grey, size: 28),
            ),
            title: Text(technician.name),
            subtitle: Text(technician.role),
            trailing: technician.status.toLowerCase() == "active"
                ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.13),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Text(
                "Active",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            )
                : technician.status.toLowerCase() == "new"
                ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.13),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Text(
                "New",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            )
                : null,
          );
        },
      ),
    );
  }
}
