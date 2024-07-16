import 'package:flutter/material.dart';
import 'package:stack_app/app/app.bottomsheets.dart';
import 'package:stack_app/app/app.dialogs.dart';
import 'package:stack_app/app/app.locator.dart';
import 'package:stack_app/app/app.router.dart';

import 'package:stack_app/ui/views/counter/counter_view.dart';
import 'package:stack_app/ui/views/home/home_view.dart';
import 'package:stack_app/ui/views/login/login_view.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      home: LoginView(),
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
