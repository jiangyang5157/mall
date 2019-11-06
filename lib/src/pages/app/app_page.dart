import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mall/src/core/core.dart';
import 'package:mall/src/models/models.dart';
import 'package:mall/src/pages/pages.dart';
import 'package:mall/src/utils/utils.dart';
import 'package:provider/provider.dart';

class AppPage extends StatefulWidget {
  AppPage({Key key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  AppModel appModel = AppModel();

  @override
  void dispose() {
    super.dispose();
    print('#### _AppPageState - dispose');
  }

  @override
  void initState() {
    super.initState();
    print('#### _AppPageState - initState');
    appModel.init();
  }

  @override
  Widget build(BuildContext context) {
    print('#### _AppPageState - build');

    return ChangeNotifierProvider<AppModel>(
      builder: (context) => appModel,
      child: Consumer<AppModel>(
        builder: (context, themeModel, _) {
          return MaterialApp(
            localizationsDelegates: [
              const AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: AppLocalizationsDelegate.supportedLanguageCodes
                .map<Locale>((languageCode) => Locale(languageCode)),
            home: SplashPage(),
            onGenerateRoute: locator<Nav>().router.generator,
            theme: themeModel.themeTypeToData(context, themeModel.themeType),
          );
        },
      ),
    );
  }
}
