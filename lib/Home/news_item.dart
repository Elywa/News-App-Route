import 'package:flutter/material.dart';
import 'package:news_app/Home/news_item_details.dart';

import 'package:news_app/models/articles/articles/article.dart';
import 'package:news_app/theme.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NewsItemDetails.routeName,
            arguments: article);
      },
      child: Container(
        // width: double.infinity,
        // padding: EdgeInsets.symmetric(horizontal: 5),
        // height: MediaQuery.of(context).size.height * .45,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: MyTheme.primaryColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            // كان ممكن نستخدم ClipRRect بدل Container
            Container(
              //clipBehavior: Clip.antiAlias, => نستخدم السطر ده لو خلينا الصورة كطفل للكونتيرنر عشان يتعملها بوردر راديس
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage(article.urlToImage ?? ''),
                    fit: BoxFit.fill,
                  )),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .33,
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2, right: 2, left: 2),
              child: Text(
                article.title ?? 'Unknown',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: MyTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                maxLines: 1,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2, right: 2, left: 2),
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
                article.description ?? 'Unknown',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
