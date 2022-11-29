import 'package:flutter/material.dart';
import 'package:islami/home_screen/hadeth_tab/hadeth_tab.dart';
import 'package:islami/home_screen/quran_tab/quran_tab.dart';
import 'package:islami/home_screen/radio_tab/radio_tab.dart';
import 'package:islami/home_screen/sebha_tab/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    const RadioTab(),
    const SebhaTab(),
    HadethTab(),
    const QuranTab(),
  ];

  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/default_bg.png',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(
              'إسلامي',
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },
              currentIndex: currentIndex,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_radio.png'),
                      size: 30,
                    ),
                    label: 'Radio'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_sebha.png'),
                      size: 30,
                    ),
                    label: 'Sebha'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_hadeth.png'),
                      size: 30,
                    ),
                    label: 'Hadeth'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_quran.png'),
                      size: 30,
                    ),
                    label: 'Quran'),
              ]),
          body: tabs[currentIndex],
        ),
      ],
    );
  }
}
