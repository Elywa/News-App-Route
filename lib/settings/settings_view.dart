import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/providers/language_provider.dart';
import 'package:news_app/settings/language_bottom_sheet.dart';

import 'package:news_app/theme.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});
  static const String routeName = 'SettingsView';
  static List<String> languages = ['English', 'Arabic'];
  static String selectedLanguage = 'English';

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: MyTheme.whiteColor,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            AppLocalizations.of(context)!.settings,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: MyTheme.whiteColor,
                ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 70,
              ),
              Text(
                AppLocalizations.of(context)!.language,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 23,
                    ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  showBottomLanguage(context);
                },
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: MyTheme.primaryColor),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          languageProvider.language == 'ar'
                              ? AppLocalizations.of(context)!.arabic
                              : AppLocalizations.of(context)!.english,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: MyTheme.blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 35,
                          color: MyTheme.blackColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showBottomLanguage(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }
}



//  Container(
//                 width: double.infinity,
//                 height: 50,
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   border: Border.all(
//                     width: 2,
//                     color: MyTheme.primaryColor,
//                   ),
//                 ),
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton<String>(
//                     isExpanded: true,
//                     alignment: Alignment.centerRight,
//                     icon: Icon(
//                       Icons.arrow_drop_down,
//                       size: 35,
//                     ),
//                     value: SettingsView.selectedLanguage,
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         SettingsView.selectedLanguage = newValue!;
//                       });
//                     },
//                     items: SettingsView.languages
//                         .map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(
//                           value,
//                           style: TextStyle(
//                             color: MyTheme.blackColor,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),