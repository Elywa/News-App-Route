import 'package:flutter/material.dart';

import 'package:news_app/theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: MyTheme.whiteColor,
          ),
          child: Image.asset(
            'assets/images/pattern.png',
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'News App',
            ),
          ),
        ),
      ],
    );
  }
}
