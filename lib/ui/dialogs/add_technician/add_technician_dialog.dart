import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'add_technician_dialog_model.dart';

class AddTechnicianDialog extends StackedView<AddTechnicianDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const AddTechnicianDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  AddTechnicianDialogModel viewModelBuilder(BuildContext context) =>
      AddTechnicianDialogModel();

  @override
  Widget builder(
      BuildContext context, AddTechnicianDialogModel viewModel, Widget? child) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Add Technician",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
                controller: viewModel.nameController,
                decoration: const InputDecoration(labelText: "Name")),
            TextField(
                controller: viewModel.roleController,
                decoration: const InputDecoration(labelText: "Role")),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () =>
                        completer(DialogResponse(confirmed: false)),
                    child: const Text("Cancel")),
                ElevatedButton(
                  onPressed: () {
                    final name = viewModel.nameController.text.trim();
                    final role = viewModel.roleController.text.trim();
                    if (name.isNotEmpty && role.isNotEmpty) {
                      completer(DialogResponse(
                        confirmed: true,
                        data: {"name": name, "role": role},
                      ));
                    }
                  },
                  child: const Text("Add"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
