import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Home/web_view_controller.dart';

import 'package:news_app/models/articles/articles/article.dart';
import 'package:news_app/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsItemDetails extends StatefulWidget {
  NewsItemDetails({super.key});
  static const String routeName = 'NewsItemDetails';

  @override
  State<NewsItemDetails> createState() => _NewsItemDetailsState();
}

class _NewsItemDetailsState extends State<NewsItemDetails> {
  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)!.settings.arguments as Article;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: MyTheme.whiteColor,
            image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              AppLocalizations.of(context)!.news_app,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: MyTheme.whiteColor,
                  ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .25,
                      fit: BoxFit.fill,
                      imageUrl: article.urlToImage ?? '',
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${AppLocalizations.of(context)!.auther} => ${article.author}',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: MyTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    article.title ?? "",
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: MyTheme.greyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat('dd-MM-yyyy')
                            .format(DateTime.parse(article.publishedAt ?? "")),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: MyTheme.greyColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyTheme.whiteColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 1,
                        color: MyTheme.primaryColor,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          article.content ?? "UnKnown",
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return WebViewPage(article: article);
                            }));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.view_full_article,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: 20,
                                    ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                size: 28,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
