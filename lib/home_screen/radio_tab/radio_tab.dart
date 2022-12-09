import 'package:flutter/material.dart';
import 'package:islami/theme.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/radio_image.png'),
        const SizedBox(
          height: 25,
        ),
        const Text(
          'إذاعة القرآن الكريم',
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              splashRadius: 25,
              icon: Icon(
                Icons.skip_next,
                size: 35,
                color: MyTheme.mainGold,
              ),
              onPressed: () {},
            ),
            IconButton(
              splashRadius: 25,
              icon: Icon(
                Icons.play_arrow_rounded,
                size: 35,
                color: MyTheme.mainGold,
              ),
              onPressed: () {},
            ),
            IconButton(
              splashRadius: 25,
              icon: Icon(
                Icons.skip_previous,
                size: 35,
                color: MyTheme.mainGold,
              ),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
