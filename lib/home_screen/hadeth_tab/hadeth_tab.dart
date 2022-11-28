import 'package:flutter/material.dart';
import 'package:islami/theme.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                itemBuilder: (context, index) => Center(
                        child: Text(
                      '${index + 1} الحديث',
                      style: const TextStyle(fontSize: 20),
                    )),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 20)
          ],
        ),
      ),
    );
  }
}
