import 'package:class_plan_flutter/core/bloc/factory_bloc.dart';
import 'package:class_plan_flutter/core/library/injection_container.dart' as injector;
import 'package:class_plan_flutter/core/library/util_helper.dart';
import 'package:class_plan_flutter/features/home/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  injector.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      navigatorKey: injector.getIt<IAppService>().navigatorKey,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale(
          UtilHelper.languageCode,
          UtilHelper.countryCode,
        ),
      ],
      home: HomePage(),
    );
  }
}
