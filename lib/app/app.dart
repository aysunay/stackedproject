import 'package:stackedproject/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:stackedproject/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stackedproject/ui/views/home/home_view.dart';
import 'package:stackedproject/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedproject/ui/views/login/login_view.dart';
import 'package:stackedproject/services/auth_service.dart';
import 'package:stackedproject/ui/views/card_list/card_list_view.dart';
import 'package:stackedproject/services/signal_r_service.dart';
import 'package:stackedproject/services/api_service.dart';
import 'package:stackedproject/services/card_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: CardListView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: SignalRService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: CardService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
