import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../util/constant.dart';
import 'counter/counter_default_page.dart';
import 'counter/counter_new_stock_item_page.dart';
import 'counter/counter_riverpod_page.dart';
import 'counter/counter_stock_page.dart';
import 'styles.dart';
import 'tab_page.dart';

///
/// MyApp
///
class MyApp extends StatelessWidget {
  final Locale locale = Locale('en');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.appName,
      theme: ThemeData(
        primaryColor: Styles.primary,
        accentColor: Styles.primary,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Styles.secondary,
        appBarTheme: const AppBarTheme(
          textTheme: TextTheme(
            headline6: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Styles.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      home: TabPage(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      routes: {
        Constant.pageCounterDefaultPage: (context) =>
            CounterDefaultPage(title: 'CounterDefaultPage'),
        Constant.pageCounterNewStockItemPage: (context) =>
            CounterNewStockItemPage(),
        Constant.pageCounterRiverpodPage: (context) => CounterRiverpodPage(),
        Constant.pageCounterStockPage: (context) => CounterStockPage(),
      },
    );
  }
}
