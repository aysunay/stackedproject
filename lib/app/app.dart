import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedproject/services/auth_service.dart';
import 'package:stackedproject/services/team_api_service.dart';
import 'package:stackedproject/services/signalr_service.dart';
import 'package:stackedproject/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:stackedproject/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stackedproject/ui/views/my_profile/my_profile_view.dart';
import 'package:stackedproject/ui/views/startup/startup_view.dart';
import 'package:stackedproject/ui/views/login/login_view.dart';
import 'package:stackedproject/ui/views/my_team/my_team_view.dart';
import 'package:stackedproject/ui/dialogs/add_technician/add_technician_dialog.dart';
import 'package:stackedproject/ui/dialogs/remove_technician/remove_technician_dialog.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: MyTeamView),
    MaterialRoute(page: MyProfileView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: TeamApiService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: SignalRService),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: AddTechnicianDialog),
  ],
)
class App {}
