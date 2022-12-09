import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home_screen/quran_tab/sura_details.dart';
import 'package:islami/theme.dart';

import '../../constants.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({Key? key}) : super(key: key);

  @override
  State<QuranTab> createState() => _QuranTabState();
}

List<String> versesCount = [];

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    if (versesCount.isEmpty) {
      getVersesCount();
    }
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Image.asset('assets/images/qur2an_screen_logo.png'),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                tableHead(AppLocalizations.of(context)!.verses_count,
                    AppLocalizations.of(context)!.sura_name),
                ListView.builder(
                  itemBuilder: (context, index) => tableRow(
                      versesCount.isEmpty ? '0' : versesCount[index].trim(),
                      suras[index],
                      index,
                      context),
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

  void getVersesCount() async {
    String content =
        await rootBundle.loadString('assets/quran_data/versesNumber.txt');
    versesCount = content.split('\n');
    setState(() {});
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
            padding: const EdgeInsets.all(3),
            alignment: Alignment.center,
            child: Text(
              txt2,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        Container(width: 2,height: 40,color: MyTheme.mainGold,padding: EdgeInsets.zero,child: const Text(""),),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              txt1,
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
            padding: const EdgeInsets.all(4),
            alignment: Alignment.center,
            child: Text(
              name,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        Container(width: 2,height: 45,color: MyTheme.mainGold,padding: EdgeInsets.zero,child: const Text(""),),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              num,
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
