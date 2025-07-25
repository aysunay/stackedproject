import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedproject/app/app.locator.dart';
import 'package:stackedproject/app/app.router.dart';

abstract class SharedView<T extends BaseViewModel> extends StackedView<T> {
  final int? currentIndex;
  final ValueChanged<int>? onTabTapped;
  final String? title;
  final List<BottomNavigationBarItem>? navItems;
  final List<Widget>? appBarActions;
  final List<Widget> leftIcons;


  const SharedView({
    Key? key,
    this.title,
    this.currentIndex = 0,
    this.onTabTapped,
    this.navItems,
    this.appBarActions,
    this.leftIcons = const [],
  }) : super(key: key);

  Widget buildBody(BuildContext context, T viewModel);

  @override
  Widget builder(BuildContext context, T viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ""),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios_new),

        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.logout),
          ),
          IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.notifications),
            ),
            IconButton(
            onPressed: () {
           },
              icon: const Icon(Icons.settings),
          ),
        ],
      ),

      body: buildBody(context, viewModel),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex ?? 0,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Schedule"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Clients"),
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: "Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart), label: "Reports"),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
