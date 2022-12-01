import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/main_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: TextStyle(fontSize: 25, color: MyTheme.mainGold),
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context, provider);
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: MyTheme.mainGold,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.language_field,
                    style: TextStyle(fontSize: 20, color: provider.theme == ThemeMode.light ? MyTheme.mainBlack : Colors.white,),
                  ),
                  const Icon(Icons.change_circle),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: TextStyle(fontSize: 25, color: MyTheme.mainGold),
          ),
          InkWell(
            onTap: () => showThemeBottomSheet(context, provider),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: MyTheme.mainGold,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.theme_field_light,
                    style: TextStyle(fontSize: 20, color: provider.theme == ThemeMode.light ? MyTheme.mainBlack : Colors.white,),
                  ),
                  const Icon(Icons.change_circle)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet(context, MainProvider provider) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              InkWell(
                onTap: () => provider.changeLanguage('ar'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'العربية',
                      style: TextStyle(fontSize: 20),
                    ),
                    Checkbox(
                      value: provider.language == 'ar' ? true : false,
                      activeColor: MyTheme.mainGold,
                      onChanged: (value) {},
                    )
                    //Icon(Icons.check_box),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () => provider.changeLanguage('en'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'English',
                      style: TextStyle(fontSize: 20),
                    ),
                    Checkbox(
                      value: provider.language == 'en' ? true : false,
                      activeColor: MyTheme.mainGold,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showThemeBottomSheet(context, MainProvider provider) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              InkWell(
                onTap: () => provider.changeTheme('light'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      AppLocalizations.of(context)!.theme_field_light,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Checkbox(
                      value: provider.theme == ThemeMode.light ? true : false,
                      activeColor: MyTheme.mainGold,
                      onChanged: (value) {},
                    )
                    //Icon(Icons.check_box),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () => provider.changeTheme('dark'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.theme_field_dark,
                      style:const TextStyle(fontSize: 20),
                    ),
                    Checkbox(
                      value: provider.theme == ThemeMode.dark ? true : false,
                      activeColor: MyTheme.mainGold,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
