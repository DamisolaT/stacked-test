import 'package:stack_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:stack_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stack_app/ui/views/home/home_view.dart';
import 'package:stack_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stack_app/ui/views/counter/counter_view.dart';
import 'package:stack_app/ui/views/login/login_view.dart';
import 'package:stack_app/services/authentication_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: CounterView),
    MaterialRoute(page: LoginView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationService),
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
