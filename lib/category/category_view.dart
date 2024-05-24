import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/models/category/category_model.dart';
import 'package:news_app/theme.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key});
  static const String routeName = 'CategoryView';
  //
  final List<CategoryModel> categories = [
    CategoryModel(
        id: 'sports',
        name: 'sports',
        image: 'assets/images/sports.png',
        color: MyTheme.redColor),
    CategoryModel(
        id: 'business',
        name: 'business',
        image: 'assets/images/bussines.png',
        color: MyTheme.blueDarkColor),
    CategoryModel(
        id: 'entertainment',
        name: 'entertainment',
        image: 'assets/images/environment.png',
        color: MyTheme.pinkColor),
    CategoryModel(
        id: 'general',
        name: 'general',
        image: 'assets/images/Politics.png',
        color: MyTheme.brownColor),
    CategoryModel(
        id: 'health',
        name: 'health',
        image: 'assets/images/health.png',
        color: MyTheme.blueLightColor),
    CategoryModel(
        id: 'science',
        name: 'science',
        image: 'assets/images/science.png',
        color: MyTheme.yellowLightColor),
    CategoryModel(
      id: 'technology',
      name: 'technology',
      image: 'assets/images/science.png',
      color: Colors.grey,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text(
            'News App',
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
                'pick your category of interest',
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
                      return CategoryItem(
                          category: categories[index], index: index);
                    }),
              ),
            ),
          ],
        ));
  }
}
