import 'package:flutter/material.dart';
import 'package:islami/theme.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({Key? key}) : super(key: key);

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int sebhaCounter = 0;
  int counter = 0;
  double rotation = 0;

  List<String> tasbeh = [
    'سبحان الله',
    'الحمد لله',
    'لا اله الا الله',
    'الله اكبر',
    'لا حول ولا قوة الا بالله'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Stack(alignment: AlignmentDirectional.topCenter, children: [
            Padding(
              padding: const EdgeInsets.only(top: 75.0),
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(rotation / 360),
                child: Image.asset(
                  'assets/images/body_sebha_logo.png',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Image.asset(
                'assets/images/head_sebha_logo.png',
              ),
            ),
          ]),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'عدد التسبيحات',
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: MyTheme.secondGold,
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              '$sebhaCounter',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
                backgroundColor: MaterialStatePropertyAll(MyTheme.mainGold),
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 15, vertical: 8))),
            onPressed: () {
              rotation += (360 / 33);
              sebhaCounter++;
              if (sebhaCounter == 34) {
                sebhaCounter = 0;
                if (counter == tasbeh.length - 1) {
                  counter = 0;
                } else {
                  counter++;
                }
              }
              setState(() {});
            },
            child: Text(
              tasbeh[counter],
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
