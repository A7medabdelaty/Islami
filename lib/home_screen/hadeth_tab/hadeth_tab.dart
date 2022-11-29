import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home_screen/hadeth_tab/hadeth_details.dart';
import 'package:islami/theme.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({Key? key}) : super(key: key);

  @override
  State<HadethTab> createState() => _HadethTabState();
}

final List<HadethDataModel> hadethData = [];

class _HadethTabState extends State<HadethTab> {
  @override
  Widget build(BuildContext context) {
    if (hadethData.isEmpty) {
      getHadethData();
    }
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Image.asset('assets/images/hadeth_logo.png'),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal:
                          BorderSide(color: MyTheme.mainGold, width: 2))),
              child: const Text(
                'الأحاديث',
                style: TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => InkWell(
                      onTap: () => Navigator.of(context).pushNamed(
                          HadethDetails.routeName,
                          arguments: hadethData[index]),
                      child: Text(
                        hadethData[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: hadethData.length)
          ],
        ),
      ),
    );
  }

  void getHadethData() {
    List<String> allAhadeth;
    rootBundle.loadString('assets/quran_data/ahadeth.txt').then((value) {
      allAhadeth = value.split('#');
      for (var element in allAhadeth) {
        List<String> hadethContent = element.trim().split('\n');
        String title = hadethContent[0];
        hadethContent.removeAt(0);
        hadethData.add(HadethDataModel(title, hadethContent));
      }
      setState(() {});
    });
  }
}

class HadethDataModel {
  String title;
  List<String> hadethContent;

  HadethDataModel(this.title, this.hadethContent);
}
