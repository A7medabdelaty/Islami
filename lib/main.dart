import 'package:flutter/material.dart';
import 'package:islami/home_screen/quran_tab/quran_tab.dart';
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
      routes: {
        SuraDetails.routeName: (context) => const SuraDetails(),
      },
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      title: 'Islami',
      home: const QuranTab(),
    );
  }
}
