import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home_screen/quran_tab/quran_tab.dart';
import 'package:islami/provider/main_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({Key? key}) : super(key: key);
  static String routeName = 'sura details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];
  String newString = '';

  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      getVerses(args.index);
    }
    return Stack(children: [
      Image.asset(
        provider.theme == ThemeMode.light
            ? 'assets/images/default_bg.png'
            : 'assets/images/dark_bg.png',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            color: provider.theme == ThemeMode.light
                ? MyTheme.mainBlack
                : Colors.white,
          ),
          title: Text(
            args.suraName,
            style: TextStyle(
                color: provider.theme == ThemeMode.light
                    ? MyTheme.mainBlack
                    : Colors.white),
          ),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: MyTheme.mainGold, width: 2),
              borderRadius: BorderRadius.circular(15),
              color: provider.theme == ThemeMode.light
                  ? Colors.grey[300]
                  : MyTheme.secondDark,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const Text(
                    'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
                    style: TextStyle(fontSize: 20, letterSpacing: 0.6),
                  ),
                  Divider(
                    color: MyTheme.mainGold,
                  ),
                  Text(
                    textDirection: TextDirection.rtl,
                    newString,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: 20,
                        color: provider.theme == ThemeMode.light
                            ? MyTheme.mainBlack
                            : MyTheme.secondYellowDark,
                        letterSpacing: .3),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }

  void getVerses(index) async {
    int verseNum = 0;
    String content =
        await rootBundle.loadString('assets/quran_data/${index + 1}.txt');
    verses = content.split('\n');
    setState(() {});
    for (var element in verses) {
      newString += '${element.trim()} [${verseNum += 1}] ';
    }
  }
}
