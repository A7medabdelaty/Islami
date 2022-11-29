import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/home_screen/hadeth_tab/hadeth_details.dart';
import 'package:islami/home_screen/home.dart';
import 'package:islami/home_screen/quran_tab/sura_details.dart';
import 'package:islami/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar'),
      routes: {
        SuraDetails.routeName: (context) => const SuraDetails(),
        HadethDetails.routeName: (context) => const HadethDetails(),
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.light,
      title: 'Islamy',
      home: const HomeScreen(),
    );
  }
}
