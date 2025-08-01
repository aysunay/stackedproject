import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedproject/app/app.locator.dart';

import '../../common/app_colors.dart';

abstract class SharedView<T extends BaseViewModel> extends StackedView<T> {
  final int? currentIndex;
  final ValueChanged<int>? onTabTapped;
  final String? title;
  final List<BottomNavigationBarItem>? navItems;
  final List<Widget> leftIcons;

  const SharedView({
    Key? key,
    this.title,
    this.currentIndex = 0,
    this.onTabTapped,
    this.navItems,
    this.leftIcons = const [],
  }) : super(key: key);

  Widget buildBody(BuildContext context, T viewModel);

  List<Widget> buildActions(BuildContext context, T viewModel);

  @override
  Widget builder(BuildContext context, T viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: Text(title ?? ""),
        backgroundColor: kcwhite,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            final prevRoute = locator<NavigationService>().previousRoute;
            final isBackAvailable = prevRoute != '/login-view' && prevRoute.isNotEmpty;
            return IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: isBackAvailable ? kcblack : Colors.black38,
              ),
              onPressed: isBackAvailable ? () => locator<NavigationService>().back() : null,
            );
          },
        ),
        centerTitle: true,
        actions: buildActions(context, viewModel),
      ),
      body: buildBody(context, viewModel),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kcwhite,
        currentIndex: currentIndex ?? 0,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Schedule"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Clients"),
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: "Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.insert_chart), label: "Reports"),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
