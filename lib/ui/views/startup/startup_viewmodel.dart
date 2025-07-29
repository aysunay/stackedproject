import 'package:stacked/stacked.dart';
import 'package:stackedproject/app/app.locator.dart';
import 'package:stackedproject/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/auth_service.dart';

class StartupViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  Future<void> runStartupLogic() async {
    final token = await _authService.getToken();

    if (token != null) {
      _navigationService.replaceWithCardListView();
    } else {
      _navigationService.replaceWithLoginView();
    }
  }
}
