import 'package:flutter/material.dart';
import 'package:news_app/providers/language_provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/theme.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({
    super.key,
  });

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  languageProvider.changeLanguage('ar');
                },
                child: languageProvider.language == 'ar'
                    ? getSelectedWidget(AppLocalizations.of(context)!.arabic)
                    : getUnSelectedWidget(
                        AppLocalizations.of(context)!.arabic)),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                languageProvider.changeLanguage('en');
              },
              child: languageProvider.language == 'en'
                  ? getSelectedWidget(AppLocalizations.of(context)!.english)
                  : getUnSelectedWidget(AppLocalizations.of(context)!.english),
            )
          ],
        ),
      ),
    );
  }

  Widget getSelectedWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            color: MyTheme.primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          Icons.check,
          size: 35,
          color: MyTheme.primaryColor,
        )
      ],
    );
  }

  Widget getUnSelectedWidget(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
