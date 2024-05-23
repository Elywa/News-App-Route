import 'package:flutter/material.dart';

import 'package:news_app/models/articles/articles/article.dart';
import 'package:news_app/theme.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: MediaQuery.of(context).size.height * .45,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: MyTheme.primaryColor),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 3,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .33,
            child: Image(
              image: NetworkImage(article.urlToImage ?? ''),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
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
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.start,
            article.description ?? 'Unknown',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
