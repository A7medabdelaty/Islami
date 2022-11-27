import 'package:flutter/material.dart';
import 'package:islami/home_screen/quran_tab/sura_details.dart';
import 'package:islami/theme.dart';

import '../../constants.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({Key? key}) : super(key: key);

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
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
          body: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/images/qur2an_screen_logo.png'),
                  Column(
                    children: [
                      tableHead('عدد الآيات', 'اسم السورة'),
                      ListView.builder(
                        itemBuilder: (context, index) =>
                            tableRow('286', suras[index], index, context),
                        itemCount: suras.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget tableHead(String txt1, String txt2) {
  return Container(
    decoration: BoxDecoration(
      border: Border.symmetric(
          horizontal: BorderSide(color: MyTheme.mainGold, width: 2)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              txt1,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(width: 2, color: MyTheme.mainGold),
              ),
            ),
            child: Text(
              txt2,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget tableRow(String num, String name, int index, context) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, SuraDetails.routeName,
          arguments: SuraModel(index, name));
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              num,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(width: 2, color: MyTheme.mainGold),
              ),
            ),
            child: Text(
              name,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    ),
  );
}

class SuraModel {
  String suraName;
  int index;

  SuraModel(this.index, this.suraName);
}
