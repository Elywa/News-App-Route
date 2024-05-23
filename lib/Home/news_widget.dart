import 'package:flutter/material.dart';
import 'package:news_app/Home/news_item.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/articles/articles/news.dart';
import 'package:news_app/models/source_response/source.dart';
import 'package:news_app/theme.dart';

class NewsView extends StatefulWidget {
  NewsView({super.key, required this.source});
  Source source;

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<News?>(
      future: ApiManager.getSourceNews(widget.source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .35,
              ),
              Center(
                child: CircularProgressIndicator(
                  color: MyTheme.primaryColor,
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  snapshot.data?.message ?? 'Try Again!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: IconButton(
                  onPressed: () {
                    ApiManager.getSourceNews(widget.source.id ?? '');
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.refresh,
                    size: 30,
                    color: MyTheme.primaryColor,
                  ),
                ),
              ),
            ],
          );
        } else if (snapshot.data!.status != 'ok') {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      width: 2,
                      color: MyTheme.primaryColor,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      snapshot.data!.message ?? 'Server Error',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              IconButton(
                onPressed: () {
                  ApiManager.getSourceNews(widget.source.id ?? '');
                  setState(() {});
                },
                icon: Icon(
                  Icons.refresh,
                  size: 35,
                  color: MyTheme.primaryColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Reload',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          );
        }

        var articles = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return ArticleItem(article: articles[index]);
            },
          ),
        );
      },
    );
  }
}
