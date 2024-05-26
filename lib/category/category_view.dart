import 'package:flutter/material.dart';
import 'package:news_app/Home/home_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/category/home_drawer.dart';
import 'package:news_app/models/category/category_model.dart';
import 'package:news_app/theme.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key});
  static const String routeName = 'CategoryView';

  //
  late List<CategoryModel> categories;
  @override
  Widget build(BuildContext context) {
    categories = categoriesList(context);
    return Scaffold(
        drawer: Drawer(
          child: HomeDrawer(),
        ),
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.news_app,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: MyTheme.whiteColor),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                AppLocalizations.of(context)!.pick_your_categories_of_interest,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: MyTheme.greyColor,
                    ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        crossAxisCount: 2),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, HomeView.routeName,
                              arguments: categories[index]);
                        },
                        child: CategoryItem(
                            category: categories[index], index: index),
                      );
                    }),
              ),
            ),
          ],
        ));
  }

  List<CategoryModel> categoriesList(BuildContext context) {
    return [
      CategoryModel(
          id: 'sports',
          name: AppLocalizations.of(context)!.sports,
          image: 'assets/images/sports.png',
          color: MyTheme.redColor),
      CategoryModel(
          id: 'business',
          name: AppLocalizations.of(context)!.bussiness,
          image: 'assets/images/bussines.png',
          color: MyTheme.blueDarkColor),
      CategoryModel(
          id: 'entertainment',
          name: AppLocalizations.of(context)!.entertainment,
          image: 'assets/images/environment.png',
          color: MyTheme.pinkColor),
      CategoryModel(
          id: 'general',
          name: AppLocalizations.of(context)!.general,
          image: 'assets/images/Politics.png',
          color: MyTheme.brownColor),
      CategoryModel(
          id: 'health',
          name: AppLocalizations.of(context)!.health,
          image: 'assets/images/health.png',
          color: MyTheme.blueLightColor),
      CategoryModel(
          id: 'science',
          name: AppLocalizations.of(context)!.science,
          image: 'assets/images/science.png',
          color: MyTheme.yellowLightColor),
      CategoryModel(
        id: 'technology',
        name: AppLocalizations.of(context)!.technology,
        image: 'assets/images/science.png',
        color: Colors.grey,
      ),
    ];
  }
}
