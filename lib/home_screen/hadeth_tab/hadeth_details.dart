import 'package:flutter/material.dart';
import 'package:islami/home_screen/hadeth_tab/hadeth_tab.dart';
import 'package:islami/theme.dart';

class HadethDetails extends StatelessWidget {
  const HadethDetails({Key? key}) : super(key: key);
  static const String routeName = 'hadeth details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethDataModel;
    return Stack(children: [
      Image.asset(
        'assets/images/default_bg.png',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            args.title,
          ),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 2,color: MyTheme.mainGold),
              color: Colors.grey[300],
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Text(
                    textDirection: TextDirection.rtl,
                    args.hadethContent.join(" "),
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
      ),
    ]);
  }
}
