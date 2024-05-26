import 'package:flutter/material.dart';
import 'package:news_app/models/category/category_model.dart';
import 'package:news_app/theme.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category, required this.index});
  final CategoryModel category;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(index % 2 != 0 ? 20 : 0),
          bottomRight: Radius.circular(index % 2 == 0 ? 20 : 0),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Image.asset(
            category.image,
            width: 100,
            height: 100,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            category.name,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: MyTheme.whiteColor,
                ),
          )
        ],
      ),
    );
  }
}
