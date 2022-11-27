import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                      size: 35,
                    ),
                    label: 'Radio'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_sebha.png'),
                      size: 35,
                    ),
                    label: 'Sebha'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_hadeth.png'),
                      size: 35,
                    ),
                    label: 'Hadeth'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_quran.png'),
                      size: 35,
                    ),
                    label: 'Quran'),
              ]),
        ),
      ],
    );
  }
}
