import 'package:flutter/material.dart';
import 'package:stackedproject/ui/views/shared/shared_view.dart';
import 'my_team_viewmodel.dart';

class MyTeamView extends SharedView<MyTeamViewModel> {
  const MyTeamView({super.key});

  @override
  String? get title => "My Team";

  @override
  List<Widget> get leftIcons => const [];

  @override
  MyTeamViewModel viewModelBuilder(BuildContext context) => MyTeamViewModel();

  @override
  List<Widget> buildActions(BuildContext context, MyTeamViewModel viewModel) {
    return viewModel.isTeamLeader
        ? [
            IconButton(
              icon: const Icon(Icons.person_add_alt_1),
              tooltip: 'Add Technician',
              onPressed: () {},
            ),
          ]
        : [];
  }

  @override
  Widget buildBody(BuildContext context, MyTeamViewModel viewModel) {
    if (viewModel.isBusy) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.hasError) {
      return Center(child: Text(viewModel.modelError ?? "An unknown error occurred"));
    }

    if (viewModel.technicians.isEmpty) {
      return const Center(child: Text("No technicians found."));
    }

    return ListView.builder(
      itemCount: viewModel.technicians.length,
      itemBuilder: (context, index) {
        final tech = viewModel.technicians[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text(tech.name),
            subtitle: Text("Role: ${tech.role}"),
            trailing: viewModel.isTeamLeader
                ? IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {},
                    // onPressed: () => viewModel.removeTechnician(tech.id),
                  )
                : null,
          ),
        );
      },
    );
  }
}
