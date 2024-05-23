import 'article.dart';

class News {
  String? status;
  int? totalResults;
  List<Article>? articles;

  News({this.status, this.totalResults, this.articles});

  factory News.fromMap(Map<String, dynamic> data) => News(
        status: data['status'] as String?,
        totalResults: data['totalResults'] as int?,
        articles: (data['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles?.map((e) => e.toMap()).toList(),
      };
}
