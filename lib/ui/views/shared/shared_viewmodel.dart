import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedproject/app/app.locator.dart';

class SharedViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void goToPage(String routeName) {
    _navigationService.navigateTo(routeName);
  }
}
