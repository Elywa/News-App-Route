import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:news_app/Home/home_view.dart';
import 'package:news_app/Home/news_item_details.dart';
import 'package:news_app/category/category_view.dart';
import 'package:news_app/providers/language_provider.dart';
import 'package:news_app/settings/settings_view.dart';
import 'package:news_app/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CategoryView.routeName,
      theme: MyTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.language),
      routes: {
        NewsItemDetails.routeName: (context) => NewsItemDetails(),
        HomeView.routeName: (context) => const HomeView(),
        CategoryView.routeName: (context) => CategoryView(),
        SettingsView.routeName: (context) => SettingsView(),
      },
    );
  }
}
