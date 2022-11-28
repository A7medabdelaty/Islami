import 'package:flutter/material.dart';
import 'package:islami/home_screen/quran_tab/sura_details.dart';
import 'package:islami/theme.dart';

import '../../constants.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/qur2an_screen_logo.png'),
            const SizedBox(height: 10,),
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
            padding: const EdgeInsets.all(3),
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
            padding: const EdgeInsets.all(4),
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
