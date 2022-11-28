import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home_screen/quran_tab/quran_tab.dart';
import 'package:islami/theme.dart';

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
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      getVerses(args.index);
    }
    return Stack(children: [
      Image.asset(
        'assets/images/default_bg.png',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            color: MyTheme.mainBlack,
          ),
          title: Text(args.suraName),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[300],
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const Text(
                    'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
                    style: TextStyle(fontSize: 20, letterSpacing: 0.6),
                  ),
                  const Divider(),
                  Text(
                    textDirection: TextDirection.rtl,
                    newString,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: 20,
                        color: MyTheme.mainBlack,
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
    verses.forEach((element) {
      newString += '${element.trim()} [${verseNum += 1}] ';
    });
  }
}
